#
# File: ~/.bash_logout
# Version: 12.2018.7
# Author: BreadyX
#
# Scipts that gets sourced by bash at logout from a login shell
#

# Clear screen at logout
if [ "$SHLVL" = 1 ]; then [ -x /usr/bin/clear ] && /usr/bin/clear; fi
