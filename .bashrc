########## OTHER ##########

# IntelliJ
#PATH="$PATH:$HOME/IntelliJ/bin"

########## HISTORY ##########

# No duplicates in .bash_history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

########## COLORS ##########

export FOREGROUND_COLOR="#ffffff"
export DISABLED_COLOR="#333333"
export GIT_COLOR="#ffb703"
export ACCENT_COLOR="#02c39a"

hex_to_ansi() {
    local hex="${1#\#}"

    if [[ ! "$hex" =~ ^[0-9A-Fa-f]{6}$ ]]; then
        echo "Invalid colorcode: $1" >&2
        return 1
    fi

    local r=$((16#${hex:0:2}))
    local g=$((16#${hex:2:2}))
    local b=$((16#${hex:4:2}))

    printf '\\[\\e[38;2;%d;%d;%dm\\]' "$r" "$g" "$b"
}

source /etc/bash_completion.d/git-prompt
source /usr/share/doc/fzf/examples/completion.bash
source /usr/share/doc/fzf/examples/key-bindings.bash

git_prompt() {
    __git_ps1 "  %s"
}

PS1_COLOR_PATH=$(hex_to_ansi "$FOREGROUND_COLOR")
PS1_COLOR_GIT=$(hex_to_ansi "$GIT_COLOR")
PS1_COLOR_ARROW=$(hex_to_ansi "$ACCENT_COLOR")
PS1_COLOR_RESET='\[\e[0m\]'
PS1_COLOR_BOLD='\[\e[1m\]'
PS1="\n${PS1_COLOR_BOLD}${PS1_COLOR_PATH}\w${PS1_COLOR_RESET}${PS1_COLOR_GIT}\$(git_prompt)${PS1_COLOR_RESET}${PS1_COLOR_BOLD}${PS1_COLOR_ARROW}  ${PS1_COLOR_RESET}"

export FZF_DEFAULT_OPTS="
--height=40%
--layout=reverse
--border=rounded
--info=inline-right
--prompt=' '
--marker='✓'
--separator='─'
--scrollbar='│'
--color=bg:-1,bg+:${DISABLED_COLOR}
--color=fg:${FOREGROUND_COLOR},fg+:${ACCENT_COLOR}
--color=hl:${ACCENT_COLOR},hl+:${ACCENT_COLOR}
--color=info:${ACCENT_COLOR}
--color=prompt:${ACCENT_COLOR}
--color=pointer:${ACCENT_COLOR}
--color=marker:${ACCENT_COLOR}
--color=spinner:${ACCENT_COLOR}
--color=header:${DISABLED_COLOR}
--color=border:${DISABLED_COLOR}
--color=gutter:-1
"
