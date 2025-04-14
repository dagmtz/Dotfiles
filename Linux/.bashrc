#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source the ~/.bashrc file if it exists
if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

export VISUAL=vim
export EDITOR="$VISUAL"

# Bash shell settings
# Typing a directory name just by itself will automatically change into that directory.
shopt -s autocd

# Automatically fix directory name typos when changing directory.
shopt -s cdspell

# Automatically expand directory globs and fix directory name typos whilst completing.
# Note, this works in conjuction with the cdspell option listed above.
shopt -s direxpand dirspell

# Enable the ** globstar recursive pattern in file and directory expansions.
# For example, ls **/*.txt will list all text files in the current directory hierarchy.
shopt -s globstar

# Ignore lines which begin with a <space> and match previous entries.
# Erase duplicate entries in history file.
HISTCONTROL=ignoreboth:erasedups

# Ignore saving short- and other listed commands to the history file.
HISTIGNORE=?:??:history

# The maximum number of lines in the history file.
HISTFILESIZE=99999

# The number of entries to save in the history file.
HISTSIZE=99999

# Set Bash to save each command to history, right after it has been executed.
PROMPT_COMMAND='history -a'

# Save multi-line commands in one history entry.
shopt -s cmdhist

# Append commands to the history file, instead of overwriting it.
# History substitution are not immediately passed to the shell parser.
shopt -s histappend histverify

#bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'

export PATH=$PATH:$HOME/.local/bin

# Set prompt
exitstatus()
{
    if [[ $? == 0 ]]; then
        printf '\033[32m'
    else 
        printf '\033[31m'
    fi
}

if [ -f ~/.config/git/git-prompt.sh ]; then
  . ~/.config/git/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  PS1='\[\033[30m\][\[\033[38;5;208m\]\u\[\033[0m\]\[\033[30m\]@\[\033[36m\]\h\[\033[30m\]]\[\033[30m\][\[\033[32m\]\W\[\033[30m\]]\[\033[30m\][\t]\[\033[36m\]$(__git_ps1 "(%s)")\n\[$(exitstatus)\]$> \[\033[0m\]'
else 
  PS1='\[\033[30m\][\[\033[38;5;208m\]\u\[\033[0m\]\[\033[30m\]@\[\033[36m\]\h\[\033[30m\]]\[\033[30m\][\[\033[32m\]\W\[\033[30m\]]\[\033[30m\][\t]\n\[$(exitstatus)\]$> \[\033[0m\]'
fi

# Start oh-my-posh prompt if feasible
if [[ ! $(tty) =~ /dev/tty[1-8] ]]; then
    #zsh
    if [ -e ~/.local/bin/oh-my-posh ]; then
      eval "$(oh-my-posh init bash --config '~/.config/omp/themes/spaceship2.omp.json')"
    fi
else
    neofetch
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

