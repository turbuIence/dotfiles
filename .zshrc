# ZSH Configuration File
# Loaded after /etc/zshrc

# ----------------------
# Environment Variables
# ----------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export VISUAL="vim"
export EDITOR=$(which vim)
#export PYTHONSTARTUP="/Users/$USER/.bin/python_startup.py"  # interactive mode
export WORDCHARS=${WORDCHARS//[-_=.\'\"\/\\]}
export LSCOLORS="xxfxcxdxbxegedabagccdd"
export LS_COLORS="di=34:ow=36"

# History Configuration
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=100000
HISTSIZE=$SAVEHIST
HISTCONTROL=ignoreboth

# ----------------------
# Path Configuration
# ----------------------
declare -a paths=(
    "$HOME/.bin"
    "$HOME/.local/bin"
    "/run/current-system/sw/bin"
    "/opt/homebrew/bin"  # ARM binaries
    "/usr/bin"
    "/usr/local/bin"
    "$HOME/Developer/bin"
    "$HOME/.docker/bin"
    "$HOME/go/bin"
    #"/opt/llvm/build/bin"
)
export PATH="$(IFS=:; echo "${paths[*]}"):$PATH"
export GOPATH="$HOME/go/bin"

is_macos() {
    [[ "$OSTYPE" == "darwin"* ]]
}

if is_macos; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    ulimit -n 65536
fi

# ----------------------
# Plugin Management
# ----------------------
load_plugin() {
    local plugin_name=$1
    local repo_url=$2
    local defer=${3:-false}

    local plugin_home="${XDG_DATA_HOME:-${HOME}/.local/share}/${plugin_name}.git"
    if [ ! -d "$plugin_home" ]; then
        mkdir -p "$(dirname $plugin_home)"
        git clone "$repo_url" "$plugin_home"
    fi

    if [[ "$defer" == true ]]; then
        zsh-defer source "${plugin_home}/${plugin_name}.plugin.zsh"
    else
        source "${plugin_home}/${plugin_name}.plugin.zsh"
    fi
}

# Load zsh-defer first
load_plugin "zsh-defer" "https://github.com/romkatv/zsh-defer.git"

load_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git" true
load_plugin "fzf-tab" "https://github.com/Aloxaf/fzf-tab.git" true
load_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git" true

# Completions
ZSH_COMPLETIONS_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-completions.git"
if [ ! -d "$ZSH_COMPLETIONS_HOME" ]; then
    mkdir -p "$(dirname $ZSH_COMPLETIONS_HOME)"
    git clone https://github.com/zsh-users/zsh-completions.git "$ZSH_COMPLETIONS_HOME"
fi
fpath=($ZSH_COMPLETIONS_HOME/src $fpath)

# Git completion helper
__git_files () {
    _wanted files expl 'local files' _files
}

# tmux plugin manager
TPM_HOME="${XDG_DATA_HOME:-${HOME}/.tmux/plugins}/tpm"
if [ ! -d "$TPM_HOME" ]; then
    mkdir -p "$(dirname $TPM_HOME)"
    git clone https://github.com/tmux-plugins/tpm.git "$TPM_HOME"
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Run PlugInstall non-interactively
    vim +PlugInstall +qall
fi

# ----------------------
# ZSH Options
# ----------------------
setopt NO_CASE_GLOB         # Case-insensitive globbing
setopt AUTO_CD              # Auto change directory
setopt EXTENDED_HISTORY     # Include timestamps in history
setopt SHARE_HISTORY        # Share history across sessions
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt AUTO_PUSHD           # Directory stack
setopt PUSHD_IGNORE_DUPS
setopt EXTENDED_GLOB
setopt INTERACTIVECOMMENTS

# ----------------------
# Completion Configuration
# ----------------------
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) || ! -f ~/.zcompdump ]]; then  # rebuild cache daily
    compinit
else
    compinit -i
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# TODO: Interesting: https://github.com/Aloxaf/fzf-tab/wiki/Configuration
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# TODO: Remove non-git results.
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-p:page-up' 'ctrl-n:page-down'
export FZF_DEFAULT_COMMAND='find . -type f ! -path ".git"'
export FZF_DEFAULT_OPTS="--height=70% --layout=reverse --info=inline"

# ----------------------
# fzf Conveniences
# ----------------------
fcd() {
    local file
    file=$(fzf)
    if [[ -n "$file" ]]; then
        cd "$(dirname "$file")"
    fi
}

# ----------------------
# Key Bindings
# ----------------------
set -o emacs
bindkey \^U backward-kill-line
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward
bindkey "^[[3~" delete-char  # fn+delete to fwd delete. Was ~.

# ----------------------
# Aliases
# ----------------------
# Python
alias py="python3"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gl1="git log --graph --abbrev-commit --decorate --date=relative --all"
alias gl2="git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr)%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset' --abbrev-commit"

# File operations
alias ls='ls --group-directories-first --color=auto -CFh'
alias l='ls --group-directories-first --color=auto -CFhl'
alias ll='ls --group-directories-first --color=auto -CFhl'
alias la='ls --group-directories-first --color=auto -CFha'
alias lla='ls --group-directories-first --color=auto -CFhla'
alias sl='ls --group-directories-first --color=auto -CFh'
alias lsf='ls --color=auto -CFht | grep -v "/$"'
alias grep='grep --color=auto'
alias hg='history | grep --color=auto'
alias fin="find . | grep --color=auto"
alias difff="diff --suppress-common-lines -U 1000 --color"
alias rsync="rsync -ah --info=progress2"

# MacOS aliases
alias hidedesktop="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop true; killall Finder"
alias imgsz='sips -g pixelWidth -g pixelHeight'
alias yt-dlp='noglob yt-dlp'
alias etd="TZ=America/New_York /Applications/Discord.app/Contents/MacOS/Discord&"
alias tls="tmux list-sessions -F \"#{session_activity} #{session_name}: #{session_windows} windows ($(echo '#{t:session_activity}'))#{?session_grouped, (group ,}#{se    ssion_group}#{?session_grouped,),}#{?session_attached, (attached),}\" | sort -Vr | sed 's/\S*\s//'"

# ----------------------
# Functions
# ----------------------
mkcd() {
    if [ $# != 1 ]; then
        echo "Usage: mkcd <dir>"
    else
        mkdir -p $1 && cd $1
    fi
}

csource() {
    if [[ $1 ]]; then
        if [[ -r $1 ]]; then
            local output_path=${TMPDIR:-/tmp}/${1##*/}
            if gcc "$1" -o "$output_path"; then
                "$output_path"
                rm "$output_path"
                return 0
            else
                echo "Compilation failed" >&2
                return 1
            fi
        else
            printf "File %s does not exist or is not readable\n" "$1" >&2
            return 1
        fi
    else
        echo "Missing operand" >&2
        return 1
    fi
}

setup_ssh_agent() {
    SSH_ENV="$HOME/.ssh/environment"

    # Check for running agent and valid socket
    if [ -f "$SSH_ENV" ]; then
        source "$SSH_ENV" > /dev/null
        if ! ps -p $SSH_AGENT_PID > /dev/null; then
            # Stale agent pid, need new agent
            rm -f "$SSH_ENV"
            unset SSH_AGENT_PID
        elif [ ! -S "$SSH_AUTH_SOCK" ]; then
            # Stale socket, need new agent
            rm -f "$SSH_ENV"
            unset SSH_AUTH_SOCK
        fi
    fi

    # Start new agent if needed
    if [ ! -f "$SSH_ENV" ]; then
        echo "Starting new SSH agent..."
        ssh-agent > "$SSH_ENV"
        chmod 600 "$SSH_ENV"
        source "$SSH_ENV" > /dev/null

        # Add keys, handling potential failures
        ssh-add || return 1
        ssh-add ~/.ssh/id_ed25519 || echo "Warning: Failed to add general id_ed25519 key"
        ssh-add ~/.ssh/aws_codecommit_rsa || echo "Warning: Failed to add AWS CodeCommit key"
    fi

    source "$SSH_ENV" > /dev/null
}

HEICtoJPG() {
    if [ -n "$1" ]; then
        magick mogrify -monitor -format jpg $1
    else
        magick mogrify -monitor -format jpg *.HEIC
    fi
}

alias -g yt='noglob yt-dlp -o "~/Downloads/tmp_video.%(ext)s" --exec "open -a IINA.app ~/Downloads/tmp_video.%(ext)s"'

push_alert() {
    if [[ -z "$PUSHOVER_USER_TOKEN" ]] || [[ -z "$PUSHOVER_APP_TOKEN" ]]; then
        echo "Error: Pushover tokens not set in ~/.zshrc_private" >&2
        return 1
    fi

    local msg="${1:-done}"

    local response
    if ! response=$(curl -s \
        --form-string "token=$PUSHOVER_APP_TOKEN" \
        --form-string "user=$PUSHOVER_USER_TOKEN" \
        --form-string "message=$msg" \
        https://api.pushover.net/1/messages.json); then
        echo "Error: Failed to send notification" >&2
        return 1
    fi

    if echo "$response" | grep -q '"status":1'; then
        if [[ "$msg" == "done" ]]; then
            echo "Notification sent successfully"
        else
            echo "Notification sent successfully: \"$msg\""
        fi
    else
        echo "Error: API request failed - $response" >&2
        return 1
    fi
}

# ----------------------
# Prompt Configuration
# ----------------------
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
#PROMPT='%F{cyan}%~ %f % '
PROMPT='%2~ %# '

# ----------------------
# Final Initialization
# ----------------------
if is_macos; then
    setup_ssh_agent
fi
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# Load private configuration if it exists
if [[ -f ~/.zshrc_private ]]; then
    if [[ "$(stat -c %a ~/.zshrc_private)" != "600" ]]; then
        echo "~/.zshrc_private should have permissions 600" >&2
        echo "Run: chmod 600 ~/.zshrc_private" >&2
    fi
    source ~/.zshrc_private
fi
