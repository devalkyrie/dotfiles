# valkyre_zshrc

# Colors
# Enable colors and change prompt:
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[cyan]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# Set up the prompt
setopt autocd
setopt nocaseglob
setopt globcomplete
setopt histignorealldups sharehistory appendhistory
setopt correct correctall
setopt interactivecomments
setopt complete_aliases
setopt NO_BG_NICE # don't nice background tasks



# Prevent duplicates in PATH variable
typeset -U path

# NVIM_TUI_ENABLE_TRUE_COLOR was problematic but gruvbox colorscheme has already proper support for it
# (more info: https://github.com/morhetz/gruvbox/commit/e5c6c3a359af4b2da8f50ea9323315308f00d191
#  && https://github.com/neovim/neovim/issues/4436)
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#bindkeys
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Use vim style line editing in zsh
bindkey -v
# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Aliases
# listing files
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -h'
alias ll='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hl'
alias la='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlA'
alias lt='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -hlt'
# xclip shorts
alias xcp='xclip-copyfile'
alias xcu='xclip-cutfile'
alias xpa='xclip-pastefile'
# cd free
alias ..=' cd ..; ls'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'
# vim free
alias vi='nvim'
alias vim='nvim'
# git aliases
alias g='git'
alias ga='git add .'
alias gc='git commit'
alias glog='git log --graph --abbrev-commit --decorate --all'
# misc free
alias zshconf="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias cl="clear"
#alias alaconfig ="vi ~/.alacritty.yml"
alias lie='cmatrix -a -s'
alias apt='sudo apt-fast'
alias SimpleServer='open http://localhost:8000; python -m SimpleHTTPServer'
# aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
# Config for dot files
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

# Git config for not pushing to the wrong branch
git config --global push.default current

# Functions
# make and cd into a directory.
mcd () {
	mkdir $1 && cd $1
}

# show uid of kernel.
uuid () {
	cat /proc/sys/kernel/random/uuid
}
# show newly modified files.
newest () {
	find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | grep -v cache | grep -v ".hg" | grep -v ".git" | sort -r | less
}
# shows clock at top right
clock () {
    while sleep 1;
    do
        tput sc
        tput cup 0 $(($(tput cols)-29))
        date
        tput rc
    done &
}
# http://www.commandlinefu.com/commands/view/2829
wp () {
    dig +short txt ${1}.wp.dg.cx
}
# top [10] used commands from history
tten () {
	history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
# percent ram usage
psgrp (){
	 ps aux | awk '/java/ { sum+=$4 } END { print sum }'
}
# list apps using internet
inapp () {
	lsof -P -i -n
}
# Go up [n] directories
upi () {
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Enviornment
export PATH=/home/ruturaj/code/flutter/bin:$PATH
export BROWSER=/usr/bin/xdg-open
export EDITOR=nvim
export VISUAL=nvim
export PATH=~/.cargo/bin:$PATH
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

# tilix terminal vte.sh reload 
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte-2.91.sh
fi

# Manual pages with colors
man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}

#plugins = (zsh-syntax-highlighting)

# Custom 'cd'
chpwd() ls

# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/scripts/tile.sh
