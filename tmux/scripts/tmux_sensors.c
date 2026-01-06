#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

/* ---------- system stats ---------- */

static double read_cpu_usage(void)
{
  static long long lu, ln, ls, li;
  long long u, n, s, i;
  FILE *f = fopen("/proc/stat", "r");
  if (!f)
    return 0;

  fscanf(f, "cpu %lld %lld %lld %lld", &u, &n, &s, &i);
  fclose(f);

  long long total = u + n + s + i;
  long long last = lu + ln + ls + li;

  long long dtotal = total - last;
  long long didle = i - li;

  lu = u;
  ln = n;
  ls = s;
  li = i;

  if (dtotal == 0)
    return 0;
  return 100.0 * (dtotal - didle) / dtotal;
}

static double read_mem_usage(void)
{
  long long total = 0, avail = 0;
  FILE *f = fopen("/proc/meminfo", "r");
  if (!f)
    return 0;

  char k[64];
  long long v;
  while (fscanf(f, "%63s %lld kB\n", k, &v) == 2)
  {
    if (!strcmp(k, "MemTotal:"))
      total = v;
    if (!strcmp(k, "MemAvailable:"))
      avail = v;
  }
  fclose(f);

  if (!total)
    return 0;
  return 100.0 * (total - avail) / total;
}

static double read_cpu_temp(void)
{
  FILE *f = fopen("/sys/class/hwmon/hwmon2/temp1_input", "r");
  if (!f)
  {
    printf("could not open file");
    return 0;
  }
  long t;
  fscanf(f, "%ld", &t);
  fclose(f);
  return t / 1000.0f;
}

static char *read_gpu_temps(void)
{
  FILE *e = NULL, *j = NULL, *m = NULL;
  int et, jt, mt;
  char *ret = NULL;

  e = fopen("/sys/class/hwmon/hwmon1/temp1_input", "r");
  j = fopen("/sys/class/hwmon/hwmon1/temp2_input", "r");
  m = fopen("/sys/class/hwmon/hwmon1/temp3_input", "r");

  if (!e || !j || !m)
    goto out;

  if (fscanf(e, "%d", &et) != 1 ||
      fscanf(j, "%d", &jt) != 1 ||
      fscanf(m, "%d", &mt) != 1)
    goto out;

  ret = malloc(64);
  if (!ret)
    goto out;

  snprintf(ret, 64, "%d/%d/%d",
           et / 1000,
           jt / 1000,
           mt / 1000);

out:
  if (e)
    fclose(e);
  if (j)
    fclose(j);
  if (m)
    fclose(m);
  return ret;
}

/* ---------- tmux control ---------- */

static void tmux_cmd(int fd, const char *fmt, ...)
{
  char buf[256];
  va_list ap;
  va_start(ap, fmt);
  vsnprintf(buf, sizeof(buf), fmt, ap);
  va_end(ap);

  write(fd, buf, strlen(buf));
  write(fd, "\n", 1);
}

int main(void)
{
  int in[2], out[2];
  pipe(in);
  pipe(out);

  pid_t pid = fork();
  if (pid == 0)
  {
    dup2(in[0], STDIN_FILENO);
    dup2(out[1], STDOUT_FILENO);
    dup2(out[1], STDERR_FILENO);

    close(in[1]);
    close(out[0]);

    execlp("/usr/bin/tmux", "tmux", "-C", "attach", NULL);
    _exit(1);
  }

  close(in[0]);
  close(out[1]);

  while (1)
  {
    char v[32];
    int cpu_temp = read_cpu_temp();

    snprintf(v, sizeof(v), "%.1f%%", read_cpu_usage());
    tmux_cmd(in[1], "set -gq @cpu_stats %s/%d°C", v, cpu_temp);

    snprintf(v, sizeof(v), "%.1f%%", read_mem_usage());
    tmux_cmd(in[1], "set -gq @mem_used %s", v);

    snprintf(v, sizeof(v), "%s", read_gpu_temps());
    tmux_cmd(in[1], "set -gq @gpu_temp %s", v);

    usleep(300000);
  }
}
