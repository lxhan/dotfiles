# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath+=($ZSH/plugins/docker)

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
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/grep", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
# zplug "themes/agnoster", from:oh-my-zsh
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1

if ! zplug check --verbose; then
    printf "Install? [Y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# brew autocomplte
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# zsh vars 
export DEFAULT_USER=$USER
export EDITOR=nvim
export VISUAL=nvim

# nvm
export NVM_DIR="$HOME/.nvm"
source ~/.nvm/nvm.sh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$HOME/Library/Python/3.9/bin:$PATH"

# aliases
alias v="nvim"
alias py="python3"
alias pyvenv="python3 -m venv .venv --upgrade-deps && source .venv/bin/activate && python3 -m pip install -U autopep8"
alias pyset='pyvenv && printf "[*.py]\nindent_style = space\nindent_size = 4" > .editorconfig && touch main.py'
alias nw="newsboat -u ~/.newsboat/urls -c ~/.newsboat/cache.db -C ~/.newsboat/config"
alias yt="newsboat -u ~/.newsboat/yturls -c ~/.newsboat/ytcache.db -C ~/.newsboat/ytconfig"
alias gw="cd ~/wiki"
alias gc="cd ~/dotfiles"
alias uw="gw && git add . && git commit -m 'updated' && git push && cd -"
alias uc="gc && git add . && git commit -m 'updated' && git push && cd -"
alias tt="tmux split-window -v -p 30"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
