# ~/.zshrc

bindkey -v
bindkey -M vicmd 'j' down-line-or-history
bindkey -M vicmd 'k' up-line-or-history
bindkey -M viins '^?' backward-delete-char

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500
HISTFILESIZE=1000

# Colors
autoload -U colors && colors

# Git branch
git_branch() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo "%F{magenta}  $branch%f"
}

# Prompt
setopt PROMPT_SUBST
PROMPT='%F{cyan}%n%f %F{yellow}  %1~%f$(git_branch) %F{gray}%%%f '

source "/Users/jannisgehring/.zsh_aliases"
