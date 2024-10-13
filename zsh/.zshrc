[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(fzf --zsh)

tmux_default() {
    if command -v tmux &> /dev/null; then
        if [[ -z "$TMUX" && -z "$SSH_CONNECTION" ]]; then
            tmux new-session -A -s start -c ~ 
        fi
    fi
}

tmux_default

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not already there
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' up-line-or-search
bindkey '^n' down-line-or-search

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# autocorrect
setopt correct

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# Function to search for a directory
search_directory() {
    local target_directory="$1"
    local current_directory=$(pwd)

    while [[ "$current_directory" != "/" ]]; do
        if [[ -d "$current_directory/$target_directory" ]]; then
            echo "$current_directory/$target_directory"
            return 0
        else
            current_directory=$(dirname "$current_directory")
        fi
    done

    # If not found, return an error message
    echo "Directory '$target_directory' not found." >&2
    return 1
}

# Function to activate a virtual environment
activate() {
    local directoryName=$(search_directory venv)

    # Check if the folder exists
    if [ ! -d "$directoryName" ]; then
        return 1
    fi

    # Check if the activate script exists
    if [ ! -f "$directoryName/bin/activate" ]; then
        echo "Activate script not found in '$directoryName'."
        return 1
    fi

    # Activate the virtual environment
    source "$directoryName/bin/activate"
}

alias ac=activate
alias dac=deactivate

lloutput() {
    clang-14 -fno-discard-value-names -emit-llvm -O0 -Xclang -disable-O0-optnone -g -S "$1" -o "${1%.*}.ll"
    opt-14 -instnamer -mem2reg -mergereturn -aa-pipeline='basic-aa' -S "${1%.*}.ll" > "${1%.*}.slim.ll"
}

export PATH="$PATH:$HOME/llvm-project/build/bin/"
export PATH="$PATH:/snap/bin"
