#!/bin/bash

tmux send "export TERM=xterm; python -c 'import pty;pty.spawn(\"/bin/bash\")' 2>/dev/null || python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"
