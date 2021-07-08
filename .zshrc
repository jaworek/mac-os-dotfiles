autoload -U colors && colors

# Aliases
alias \
	g="git" \
	ga="git add" \
	gaa="git add ." \
	gac="gaa && gc" \
	gp="g push" \
	gpu="g pull" \
	gl="g log --graph --color --branches --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'" \
	gs="g status" \
	gc="g commit" \
	gch="g checkout" \
	gr="g reset" \
	l="ls -ohG" \
	la="ls -oAhG" \
	nb="newsboat" \
	vim="nvim" \
	myip="curl ipinfo.io/ip"
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -v" \
	mkdir="mkdir -pv" \

if [[ $OSTYPE == darwin* ]]; then
	alias update="brew update && brew upgrade"
fi

# Environment variables
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_TYPE="en_US.UTF-8"
export MANPAGER='nvim +Man!'
export HOMEBREW_NO_AUTO_UPDATE=1

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

#OpenSSL
export PATH=/usr/local/opt/openssl/bin:$PATH

# Set history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd

# Enable command completition
autoload -Uz compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

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

# Plugins
source /usr/local/share/antigen/antigen.zsh

#antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
bindkey '^ ' autosuggest-accept
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle command-not-found
# Syntax highlighting. Must be last.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
