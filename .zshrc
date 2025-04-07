
command_not_found_handler() {
    print -P "%F{13}-- what even is $@?%f"
    return 127
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# zsh plugins
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# OMZ plugins
# zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Prompt
# PROMPT='%(?.%F{14}!%f.%F{9}?%f) %3~ $ '

# load completions
autoload -U compinit && compinit

zinit cdreplay -q

bindkey -e

# history
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

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# aliases
alias l="ls -a"
alias la="ls -la"
alias cls="clear"
alias lg="lazygit"
alias cd="z"

export EDITOR="nvim"

# path exports
export PATH="$PATH:/Users/sally/.local/bin"
export PATH="$PATH:/Users/sally/.local/scripts"
export PATH="$PATH:/Users/sally/.cargo/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/Users/sally/.config/emacs/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export CMAKE_PREFIX_PATH="/Users/sally/.local/library/libs:$CMAKE_PREFIX_PATH"

export XDG_CONFIG_HOME="/Users/sally/.config"

# shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
