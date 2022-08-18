import ranger.api
from ranger.core.linemode import LinemodeBase
from .devicons import *
from ranger.core.linemode import human_readable,human_readable_time

@ranger.api.register_linemode
class DevIconsLinemode(LinemodeBase):
  name = "my"

  uses_metadata = False

  def filetitle(self, file, metadata):
    return devicon(file) + ' ' + file.relative_path

  def infostring(self, file, metadata):
    return human_readable_time(file.stat.st_mtime).ljust(7, ' ') + '  ' + human_readable(file.size).ljust(7, ' ') + ' ' + file.get_permission_string()
