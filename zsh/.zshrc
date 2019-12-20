# vimplug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# zplug
if [[ ! -d ~/.zplug ]]; then
    echo "zplug not installed, installing now..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# plugins
zplug "plugins/compleat", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/grep", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "themes/agnoster", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [Y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# zsh vars 
export DEFAULT_USER=$USER
export EDITOR=nvim
export TERMINAL=urxvt

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# aliases
alias v="nvim"                                                                                                     
alias py="python3"                                                                                                
alias pip="pip3"
alias nw="newsboat -u ~/.newsboat/urls -c ~/.newsboat/cache.db -C ~/.newsboat/config"
alias yt="newsboat -u ~/.newsboat/yturls -c ~/.newsboat/ytcache.db -C ~/.newsboat/ytconfig"
alias gw="cd ~/Documents/wiki"
alias gc="cd ~/Documents/dotfiles"
alias gd="cd ~/Downloads"
alias uw="gw && git add . && git commit -m 'updated' && git push && cd -"
alias uc="gc && git add . && git commit -m 'updated' && git push && cd -"
alias u="sudo apt-get update -y && sudo apt-get upgrade -y"
alias i="sudo apt-get install -y"
