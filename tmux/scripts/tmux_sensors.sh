#!/bin/bash

while true; do
    # CPU Load
    read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
    total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
    idle1=$((idle + iowait))
    
    # Wait 1 second without creating a subshell
    sleep 1
    
    # Read second sample
    read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
    total2=$((user + nice + system + idle + iowait + irq + softirq + steal))
    idle2=$((idle + iowait))
    
    # Compute integer CPU usage %
    diff_total=$((total2 - total1))
    diff_idle=$((idle2 - idle1))
    
    # Calculate percentage
    cpu_usage=$(((diff_total - diff_idle) * 100 / diff_total))
    tmux set -gq @cpu_load "$cpu_usage"
    
    # CPU Temperature
    cpu_temp=$(</sys/class/hwmon/hwmon2/temp1_input)
    tmux set -gq @cpu_temp "$((cpu_temp / 1000))"
    
    # GPU Temperature (if available)
    edge_temp="$(($(</sys/class/hwmon/hwmon1/temp1_input)/1000))"
    junction_temp="$(($(</sys/class/hwmon/hwmon1/temp2_input)/1000))"
    mem_temp="$(($(</sys/class/hwmon/hwmon1/temp3_input)/1000))"
    gpu_temp="$edge_temp/$junction_temp/$mem_temp"
    tmux set -gq @gpu_temp "$gpu_temp"
    
    # Memory Usage
    mem_total=0
    mem_available=0
    
    while IFS=":" read -r key value; do
        case "$key" in
            MemTotal) mem_total=${value//[!0-9]/} ;;
            MemAvailable) mem_available=${value//[!0-9]/} ;;
        esac
    done < /proc/meminfo
    
    mem_used=$(((mem_total - mem_available)/1000/1000))
    tmux set -gq @mem_used "$mem_used/$((mem_total/1000/1000))"
    
done
