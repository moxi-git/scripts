# ~/.bashrc
#

# -------------------------
# AOSP build environment
# -------------------------
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_MAXSIZE=50G

# Only run if interactive shell
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lah'

# Colors
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
RESET="\[\e[0m\]"

# Git branch helper
git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch)"
    fi
}

# CCache helper
ccache_status() {
    if command -v ccache &>/dev/null; then
        hit_rate=$(ccache -s | awk '/Local storage:/ {flag=1; next} flag && /Hits:/ {match($0, /\(([0-9.]+)%\)/, a); print a[1] "%"; exit}')
        size=$(ccache -s | awk '/Local storage:/ {flag=1; next} flag && /Cache size/ {gsub(/^[ \t]+|[ \t]+$/,"",$0); split($0,a,":"); split(a[2],b,"/"); gsub(/ /,"",b[1]); gsub(/ /,"",b[2]); print b[1] "GB /" b[2] "GB"; exit}')
        echo "[ccache: ${hit_rate:-0%} / ${size:-0GB / 0GB}]"
    fi
}

# Multi-line PS1
PS1="\n[${GREEN}\u${RESET}@${BLUE}\h${RESET} ${CYAN}\w${RESET}] \$(git_branch) \$(ccache_status)\n\$ "

# Enable bash completion if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

