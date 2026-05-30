# ~/.zshrc

bindkey -v
bindkey -M vicmd 'j' down-line-or-history
bindkey -M vicmd 'k' up-line-or-history
bindkey -M viins '^?' backward-delete-char

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500
HISTFILESIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

echo -en "\e]P0282828" #black   (color_01)
echo -en "\e]P1CC241D" #lightred (color_02)
echo -en "\e]P298971A" #lightgreen (color_03)
echo -en "\e]P3D79921" #yellow  (color_04)
echo -en "\e]P4458588" #lightblue (color_05)
echo -en "\e]P5B16286" #lightmagenta (color_06)
echo -en "\e]P6689D6A" #lightcyan (color_07)
echo -en "\e]P7A89984" #highwhite (color_08)

echo -en "\e]P8928374" #grey    (color_09)
echo -en "\e]P9FB4934" #red     (color_10)
echo -en "\e]PAB8BB26" #green   (color_11)
echo -en "\e]PBFABD2F" #brown   (color_12)
echo -en "\e]PC83A598" #blue    (color_13)
echo -en "\e]PDD3869B" #magenta (color_14)
echo -en "\e]PE8EC07C" #cyan    (color_15)
echo -en "\e]PFEBDBB2" #white   (color_16)

# Optional: Set Foreground, Background, and Cursor
echo -en "\e]10;EBDBB2\a" # Foreground
echo -en "\e]11;282828\a" # Background
echo -en "\e]12;EBDBB2\a" # Cursor

# These commands are for setting foreground and background, which are not directly P-codes
# but you might set them separately depending on your terminal emulator.
# If your terminal supports OSC 10 (foreground) and OSC 11 (background):
# echo -en "\e]10;EBDBB2\a" # Foreground
# echo -en "\e]11;282828\a" # Background

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
