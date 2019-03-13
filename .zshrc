# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wangms/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="fino"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion. # 如果想要大小写敏感，可以取消注释下面的一行
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable. # 如果想要连接符不敏感，可以取消注释下面的一行。_ 和 - 将可以互换
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks. # 如果不想要自动更新，可以取消注释下面的一行
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days). # 自动更新的时间间隔，单位是天，这里设置 17 天更新一次
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls. # 如果不想要 ls 命令输出带颜色，可以取消注释下面的一行
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title. # 是否禁止更改终端标题,不要禁止,不然所有终端tab只显示zsh了,而不随着目录的改变而改变显示
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction. # 自动纠正命令,不启用,不怎么好用
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion. # 按tab键补全命令的时候,如果没什么可补全的就会出现三个红点,更人性化显示，这里我们启用
COMPLETION_WAITING_DOTS="true"

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
# plugins=(
#   git
# )

# 在原.zshrc(copy "～/.oh-my-zsh/templates/zshrc.zsh-template"文件而得)的67-69行间插入如下设置：
# -------------------------------------------------------------------------------------------------------------------------------
# Enabling Plugins 启用插件。调用随oh-my-zsh默认安装的包(in ~/.oh-my-zsh/plugins/*)及自己手工下载的包(in ~/.oh-my-zsh/custom/plugins/*)
plugins=(
    git
    extract        # x filename 即可，不用再记忆各类参数
    history
    autojump       # 这个插件需用pacman安装，她会记录进入过的文件夹，下次再进入只要输入很少的内容即可
    catimg         # catimg filename
    encode64       # encode64 string
    urltools       # 编码 urlencode http://wdxtub.com;解码 urldecode http%3A%2F%2Fwdxtub.com
)

# 来自https://github.com/skywind3000/vim/blob/master/etc/zshrc.zsh

################################################################
# Antigen begin
################################################################

# Antigen: https://github.com/zsh-users/antigen
ANTIGEN="$HOME/.local/bin/antigen.zsh"

# Install antigen.zsh if not exist
if [ ! -f "$ANTIGEN" ]; then
	echo "Installing antigen ..."
	[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local" 2> /dev/null
	[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin" 2> /dev/null
	[ ! -f "$HOME/.z" ] && touch "$HOME/.z"
	URL="http://git.io/antigen"
	TMPFILE="/tmp/antigen.zsh"
	if [ -x "$(which curl)" ]; then
		curl -L "$URL" -o "$TMPFILE" 
	elif [ -x "$(which wget)" ]; then
		wget "$URL" -O "$TMPFILE" 
	else
		echo "ERROR: please install curl or wget before installation !!"
		exit
	fi
	if [ ! $? -eq 0 ]; then
		echo ""
		echo "ERROR: downloading antigen.zsh ($URL) failed !!"
		exit
	fi;
	echo "move $TMPFILE to $ANTIGEN"
	mv "$TMPFILE" "$ANTIGEN"
fi

# Load antigen — plugin manager
source "$ANTIGEN"
# Load the oh-my-zsh's library
antigen use oh-my-zsh

# antigen Install and Enabling bundle/Plugins
antigen bundles <<EOBUNDLES           # 与与plugins=(}的区别是：lugins只启用已安装的;antigen是既安装也启用。
	command-not-found
	colored-man-pages
	autojump                      # 与autojump用antigen安装不了，需用pacman安装。

	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-syntax-highlighting
	HeroCC/LS_COLORS
	rupa/z
EOBUNDLES

# Load the theme.
# antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

################################################################
# Antigen end
################################################################


# Initialize command prompt
export PS1="%n@%m:%~%# "

# Enable 256 color to make auto-suggestions look nice
export TERM="xterm-256color"

# Load local bash/zsh compatible settings
_INIT_SH_NOFUN=1
[ -f "$HOME/.local/etc/init.sh" ] && source "$HOME/.local/etc/init.sh"

# exit for non-interactive shell
[[ $- != *i* ]] && return

# WSL (aka Bash for Windows) doesn't work well with BG_NICE
[ -d "/mnt/c" ] && [[ "$(uname -a)" == *Microsoft* ]] && unsetopt BG_NICE

# check login shell
if [[ -o login ]]; then
	[ -f "$HOME/.local/etc/login.sh" ] && source "$HOME/.local/etc/login.sh"
	[ -f "$HOME/.local/etc/login.zsh" ] && source "$HOME/.local/etc/login.zsh"
fi

################################################################
# syntax
################################################################
# syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# load local config
[ -f "$HOME/.local/etc/config.zsh" ] && source "$HOME/.local/etc/config.zsh" 
[ -f "$HOME/.local/etc/local.zsh" ] && source "$HOME/.local/etc/local.zsh"

################################################################
#  default keymap
################################################################
# bindkey -s '\ee' 'vim\n'
# bindkey '\eh' backward-char
# bindkey '\el' forward-char
# bindkey '\ej' down-line-or-history
# bindkey '\ek' up-line-or-history
# bindkey '\eu' undo
# bindkey '\eH' backward-word
# bindkey '\eL' forward-word
# bindkey '\eJ' beginning-of-line
# bindkey '\eK' end-of-line

# bindkey -s '\eo' 'cd ..\n'
# bindkey -s '\e;' 'll\n'

# bindkey '\e[1;3D' backward-word
# bindkey '\e[1;3C' forward-word
# bindkey '\e[1;3A' beginning-of-line
# bindkey '\e[1;3B' end-of-line

# bindkey '\ev' deer

################################################################
# Set ZSH options
################################################################
# options
unsetopt correct_all
#== History ================
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#HISTFILE=$HOME/zsh_history           # history file location
HISTSIZE=1000000                 # number of history lines kept internally
SAVEHIST=1000000                 # max number of history lines saved

################################################################
# Functions
################################################################
# source function.sh if it exists
[ -f "$HOME/.local/etc/function.sh" ] && . "$HOME/.local/etc/function.sh"

# ignore complition
zstyle ':completion:*:complete:-command-:*:*' ignored-patterns '*.pdf|*.exe|*.dll'
zstyle ':completion:*:*sh:*:' tag-order files

################################################################
# Aliases
################################################################
# 用 GUI 文件管理器或编辑器打开指定的的文件或目录
# xdg-open fileOrDir
alias opzshrc="xdg-open ~/.zshrc" 
alias ohmyzsh="xdg-open ~/.oh-my-zsh/"

alias zshrc="emacs ~/.zshrc &"
alias ff="firefox &"

# https://wdxtub.com/2016/02/18/oh-my-zsh/
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias grep="grep --color=auto"
alias -s html='vim'        # 在命令行直接输入后缀为 html 的文件名，会在 Vim 中打开
alias -s rb='vim'          # 在命令行直接输入 ruby 文件，会在 Vim 中打开
alias -s py='vim'          # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js='vim'
alias -s c='vim'
alias -s java='vim'
alias -s txt='vim'
alias -s gz='tar -xzvf'    # 在命令行直接输入后缀为 gz 的文件名，会自动解压打开
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

################################################################
# PROMPT=PS1
################################################################
# 我的PS1
# export PS1=$'%{\e[1;37m[ \e[1;31m%n\e[1;37m@\e[1;33m%m \e[1;35m%~ \e[1;37m]\e$
# export PS1="${White}[${Reset}${Cyan}${0} : ${Reset}${Red}%n${Reset}${White}@$$

# autoload -U promptinit
# promptinit
# prompt fade magenta

# -------------------------------------------------------------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
