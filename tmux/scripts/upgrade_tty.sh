#!/bin/bash

tmux send "export TERM=xterm; python -c 'import pty;pty.spawn(\"/bin/bash\")' || python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"
