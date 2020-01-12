# If you come from bash you might have to change your $PATH.
export PATH=${HOME}/Bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/go/libexec/bin:${PATH}

# Path to your oh-my-zsh installation.
export ZSH="/Users/chris/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="chris"

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
export UPDATE_ZSH_DAYS=7

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
plugins=()

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
export EDITOR=vim

# vi style incremental search
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Oracle client configuration
export ORACLE_HOME=${HOME}/Oracle/instantclient_12_1

if [ -d ${ORACLE_HOME} ]
then
    export PATH=${ORACLE_HOME}:${PATH}
    export NLS_LANG="AMERICAN_AMERICA.AL32UTF8"
    export NLS_DATE_FORMAT="DD-Mon-YYYY HH24:MI:SS"
    export NLS_TIMESTAMP_FORMAT="DD-Mon-YYYY HH24:MI:SS.FF"
    export NLS_TIMESTAMP_TZ_FORMAT="DD-Mon-YYYY HH24:MI:SS.FF TZR (TZD)"
    export TNS_ADMIN=${ORACLE_HOME}
fi

# Direnv configuration
eval "$(direnv hook zsh)"

# Perlbrew configuration
export PERLBREW_ROOT=${HOME}/Perl

if [ -d ${PERLBREW_ROOT} ]
then
    source ${PERLBREW_ROOT}/etc/bashrc
fi

# Grc configuration
if [ -f $(brew --prefix)/etc/grc.zsh ]
then
    source $(brew --prefix)/etc/grc.zsh
fi

# Rbenv configuration
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Homebrew configuration
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Iterm2 configuration
source ~/.iterm2_shell_integration.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias barley='brew update && brew upgrade && brew cleanup && brew doctor'
alias pstree='grc --colour=auto /usr/local/bin/pstree'
alias rm='rm -i'
alias uptime='grc --colour=auto /usr/bin/uptime'
