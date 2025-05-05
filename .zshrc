alias gitree='git log --graph --all --decorate --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias odd='cd "~/OneDrive - Duale Hochschule Baden-Württemberg Stuttgart"'
alias odp='cd "~/OneDrive - Persönlich"'
alias tl='trans :en -b'
alias lg='lazygit'
alias dsa='docker stop $(docker ps -a -q)'

alias compute='python -c print("$1")'

bindkey -v
bindkey -M vicmd 'j' down-line-or-history
bindkey -M vicmd 'k' up-line-or-history
bindkey -M viins '^?' backward-delete-char

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_USR='%f'
COLOR_DIR='%F{#41927A}'
COLOR_GIT='%F{#804079}'
# About the prefixed `$`: https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_03.html#:~:text=Words%20in%20the%20form%20%22%24',by%20the%20ANSI%2DC%20standard.
NEWLINE=$'\n'
# Set zsh option for prompt substitution
setopt PROMPT_SUBST
# ORIGINAL: export PROMPT='${COLOR_USR}%n@%M ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    MODE_INDICATOR="%F{red}[N]%f"
  else
    MODE_INDICATOR="%F{green}[I]%f"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init {
  zle-keymap-select
}
zle -N zle-line-init

# Add $MODE_INDICATOR somewhere in your PROMPT
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%1d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${MODE_INDICATOR} %% '
