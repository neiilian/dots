#editor/term
export VISUAL="nvim"
export EDITOR="nvim"

#locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#path
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

#terminal title
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

#exa
alias ls="exa -l -g --icons"
alias la="exa -l -a -g --icons"
alias llt="exa -1 --icons --tree --git-ignore"

#git
alias clone="git clone"
alias ga="git add"
alias gall="git add ."
alias gc="git commit -m"
alias gd="git diff"
alias gi="git init"
alias ic='git commit -m "chore(init): initial commit"'
alias gp="git push"
alias gpm="git push -u origin main"
alias gs="git status"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

#tmux
alias dev="tmux attach-session -t dev"
alias sdev="tmux -u new -s dev"

#enable wifi
alias wifi_on="sudo rfkill unblock wifi && sudo ip link set wlo1 up"

#default prompt
PS1='[\u@\h \W]\$ '

#starship settings
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/dots/starship.toml

#golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/home/bachitterch/.cargo/bin

#nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
export PATH=/home/bachitterch/.fnm:$PATH
eval "`fnm env`"
