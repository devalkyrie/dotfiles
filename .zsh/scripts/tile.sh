# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {

	# [
	PS1="["

	PS1+="%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"

	# Status Code
	PS1+='%(?.., %{$fg[orange]%}%?%{$reset_color%})'

 	# Git
 	if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
 		PS1+=', '
 		PS1+="%{$fg[magenta]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
		STATUS=$(git status --short | wc -l)
		if [ $STATUS -gt 0 ]; then 
 			PS1+="%{$fg[green]%}+$(echo $STATUS | awk '{$1=$1};1')%{$reset_color%}"
 		fi
 	fi


	# Timer: show the elapsed time for the event.
	if [[ $_elapsed[-1] -ne 0 ]]; then
		PS1+=', '
		PS1+="%{$fg[blue]%}$_elapsed[-1]s%{$reset_color%}"
	fi

	# pid : shows the process id of the background process.
	if [[ $! -ne 0 ]]; then
		PS1+=', '
		PS1+="%{$fg[yellow]%}pid:$!%{$reset_color%}"
	fi

	# sudo: flags sudo in the prompt.
	can_i_run_sudo=$(sudo -n uptime 2>&1|grep "load"|wc -l)
	if [ ${can_i_run_sudo} -gt 0 ]
	then
		PS1+=', '
		PS1+="%{$fg_bold[red]%}sudo%{$reset_color%}"
	fi

	# ]
	PS1+="]: "
}

precmd_functions+=set_prompt

preexec () {
   (( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
   _start=$seconds
}

precmd () {
   (( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
   _start=-1 
}
