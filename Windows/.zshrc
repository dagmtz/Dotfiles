# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000 
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dagmtz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines added by me :)
# # # # # # # # # # # # # # # # # # # # # # # # # # # #

# grml prompt disable
autoload -Uz promptinit
promptinit
prompt off



# Starship config and init
# # # # # # # # # # # # # # # # # # # # # # # # # # # #
export STARSHIP_CONFIG=~/Dotfiles/.config/starship.toml
eval "$(starship init zsh)"
