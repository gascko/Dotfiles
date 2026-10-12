########## PATH ##########

# export PATH="$PATH:$HOME/IntelliJ/bin"

########## COLORS ##########

export TEXT_COLOR="#ffffff"
export PRIMARY_COLOR="#02c39a"
export SECONDARY_COLOR="#ffb703"
export DISABLED_COLOR="#666666"

########## HISTORY ##########

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

########## ZSH OPTIONS ##########

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS

########## COMPLETION ##########

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

[[ -n "$LS_COLORS" ]] &&
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

########## FZF ##########

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
--color=fg:${TEXT_COLOR},fg+:${PRIMARY_COLOR}
--color=hl:${PRIMARY_COLOR},hl+:${PRIMARY_COLOR}
--color=info:${PRIMARY_COLOR}
--color=prompt:${PRIMARY_COLOR}
--color=pointer:${PRIMARY_COLOR}
--color=marker:${PRIMARY_COLOR}
--color=spinner:${PRIMARY_COLOR}
--color=header:${DISABLED_COLOR}
--color=border:${DISABLED_COLOR}
--color=gutter:-1
"

########## GIT ##########

autoload -Uz vcs_info add-zsh-hook

update_vcs_info() {
    vcs_info
}

add-zsh-hook precmd update_vcs_info

########## PROMPT ##########

setopt PROMPT_SUBST

PROMPT='%B%F{$TEXT_COLOR}%~%f%b%F{$SECONDARY_COLOR}${vcs_info_msg_0_}%f%B%F{$PRIMARY_COLOR}  %f%b'
