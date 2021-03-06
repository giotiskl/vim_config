# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set vi editing mode for zsh
set -o vi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ======= #
# Aliases #
# ======= #
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" # Make process table searchable
alias g="git"                                         # Alias for Git
alias gcb="git branch | grep \*"                      # Display name of current git branch
alias delvitmp='find . -name "*.sw*" -type f -delete'  # Alias to delete all vim *sw* tmp files recursively

# ========= #
# Functions #
# ========= #
# This function will perform a git grep and then replace the word for a new one
# optionally in a specific folder/file.
# $1 is the original text
# $2 is the new text
# $3 is optionally the path
gitGrepAndReplace() {
  git grep -l $1 -- $3 | xargs sed -i 's/'$1'/'$2'/g' # Linux version
  # git grep -l $1 -- $3 | xargs sed -i '' -e 's/'$1'/'$2'/g' # OSX version
}

# This function will perform a git grep and count the instances it finds
# $1 is the text to grep for
# $2 is optionally the directory
gitGrepAmount() {
  git grep $1 -- $2 | wc -l
}

# This function will show the number of files changed between to commits
# $1 is the from-commit (either SHA1 or HEAD~x)
# $2 is the to-commit (either SHA1 or HEAD~x)
gitFilesChangedBetweenCommits() {
  git diff $1..$2 --name-only | wc -l
}

# This function will look recursively in all subdirectories
# to find files containing a certain pattern
# NOTE: it will exclude hidden directories - files
#       (if not needed, take out the -not -path '*/\.*' part)
findFilesWithPatternInFilename() {
  find . -not -path '*/\.*' -type f -name *$1*
}

# Mods to agnoster theme
export DEFAULT_USER=$USER
prompt_dir() {
    prompt_segment blue black "${PWD##*/}"
}

# Check if there is a local .zshrc with more
# config on this machine and source it
if [ -e ~/.zshrc.local ]
then
  source ~/.zshrc.local
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
