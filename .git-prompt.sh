#PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
#PS1="$PS1"'\n'                 # new line
PS1='\[\033[1;32m\]\u '       	# [bright green]user
#PS1="$PS1"'\[\033[35m\]'       # change to purple
#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
PS1="$PS1"'\[\033[0;33m\]'      # change to brownish yellow
PS1="$PS1"'\w'                 	# current working directory
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[36m\]'  # change color to cyan
		PS1="$PS1"'`__git_ps1`'   # bash function
	fi
fi
PS1="$PS1"'\[\033[1;32m\]'      # change color
PS1="$PS1"'\n'                  # new line
PS1="$PS1"'$> '               	# prompt: always $>
PS1="$PS1"'\[\033[0m\]'         # clear format

# shows $ if there are any stashes.
export GIT_PS1_SHOWDIRTYSTATE=true

# Shows % if there are any untracked files.
export GIT_PS1_SHOWUNTRACKEDFILES=true

# shows <, >, <>, or = when your branch is behind, ahead, diverged from,
# or in sync with the upstream branch, respectively.
export GIT_PS1_SHOWUPSTREAM="auto"
