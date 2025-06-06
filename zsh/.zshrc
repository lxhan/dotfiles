export EDITOR='nvim'

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

if ! zplug check --verbose; then
    printf "Install? [Y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

fpath=( ~/.zsh_autoload_functions "${fpath[@]}" )
autoload -Uz load_nn

# aliases
alias v="nvim"
alias py="python3"
alias pyvenv="python3 -m venv .venv --upgrade-deps && source .venv/bin/activate && python3 -m pip install -U autopep8"
alias pyset='pyvenv && printf "[*.py]\nindent_style = space\nindent_size = 4" > .editorconfig && touch main.py'
alias nw="newsboat -u ~/.newsboat/urls -c ~/.newsboat/cache.db -C ~/.newsboat/config"
alias yt="newsboat -u ~/.newsboat/yturls -c ~/.newsboat/ytcache.db -C ~/.newsboat/ytconfig"
alias tt="tmux split-window -v -p 30"
# alias ssh="kitty +kitten ssh"
alias mux="tmuxinator"
alias k="kubectl"
alias t="task"
alias c="cursor"

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

if [[ "$OSTYPE" =~ ^linux ]]; then
    # fnm
    export PATH="/home/lx/.local/share/fnm:$PATH"
    eval "`fnm env`"
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
    eval "$(fnm env --use-on-cd)"
fi

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/alex/yandex-cloud/path.bash.inc' ]; then source '/Users/alex/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/alex/yandex-cloud/completion.zsh.inc' ]; then source '/Users/alex/yandex-cloud/completion.zsh.inc'; fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lx/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lx/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lx/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lx/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
