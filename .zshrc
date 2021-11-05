# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="cc"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
plugins=('fzf' 'dotenv' 'git' 'ruby' 'rails' 'rvm' 'gem' 'heroku' 'nvm' 'composer')
# merge gabrielelana/dotfiles  # https://github.com/gabrielelana/dotfiles 
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Customize to your needs...用户自己的设置
# --------------------------------------------------------------------------------------------------------------------------------------------

# Enabling Plugins 启用插件。调用随oh-my-zsh默认安装的包(in ~/.oh-my-zsh/plugins/*)及自己手工下载的包(in ~/.oh-my-zsh/custom/plugins/*)
plugins=(
    autojump
    z              #同autojump插件，她会记录进入过的文件夹，下次再进入只要输入很少的内容即可
    extract        #解压插件，x filename 即可，不用再记忆各类参数
    history-substring-search   # 默认上下方向键选择
    catimg         # catimg filename
    encode64       # encode64 string
    urltools       # 编码 urlencode http://wdxtub.com;解码 urldecode http%3A%2F%2Fwdxtub.com
)

# --------------------------------------------------------------------------------------------------------------------------------------------
# zplug begin
# --------------------------------------------------------------------------------------------------------------------------------------------
# Check if zplug is installed
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# oh-my-zsh
# zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

P9K=""
if [ -z "$P9K" ]; then 
    zplug "romkatv/powerlevel10k", as:theme, depth:1
    if zplug check "bhilburn/powerlevel9k"; then
        zplug clean
        if [ -f ~/.p10k.zsh.back ]; then 
            mv ~/.p10k.zsh.back ~/.p10k.zsh
        fi
    fi
    ZSH_THEME="powerlevel9k/powerlevel9k"
    POWERLEVEL9K_MODE='nerdfont-fontconfig'
    
    ## 
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
    POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
    
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined)
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{045}\u256D\u2500%F{white}"
    # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{045}\u2570\uf460%F{white} "
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{045}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
    
    # dir
    POWERLEVEL9K_SHORTEN_DELIMITER=''
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=7
    POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_first_and_last'
    
    # Home Root 
    POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
    POWERLEVEL9K_DIR_HOME_FOREGROUND='045'
    
    # Root sub dir
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='045'
    # user dir
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='005'
    
    # ect dir 
    POWERLEVEL9K_DIR_ETC_BACKGROUND='none'
    POWERLEVEL9K_DIR_ETC_FOREGROUND='005'
    
    # 禁止编辑
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="none"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
    
    # RIGHT_PROMP
    # ===========================================================
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time vcs background_jobs_joined battery time_joined)
    
    POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
    POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
    
    # change
    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='003'
    
    POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND='045'
    
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='005'
    
    
    # INDICATOR
    POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="none"
    POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
    
    POWERLEVEL9K_STATUS_OK_BACKGROUND="none"
    POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
    
    POWERLEVEL9K_STATUS_ERROR_BACKGROUND="none"
    POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
    
    # TIME 
    # POWERLEVEL9K_TIME_FORMAT="%D{%Y-%m-%d,%H:%M:%S}"
    POWERLEVEL9K_TIME_ICON=''
    POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uf017 %d.%m \uf073}"
    POWERLEVEL9K_TIME_BACKGROUND="none"
    POWERLEVEL9K_TIME_FOREGROUND="cyan"
    
    # battery 电池
    POWERLEVEL9K_BATTERY_LOW_BACKGROUND='none'
    POWERLEVEL9K_BATTERY_LOW_FOREGROUND='001'
    POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='none'
    POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='076'
    POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='none'
    POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='076'
    POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='none'
    POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='003'
    POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
    POWERLEVEL9K_BATTERY_VERBOSE=false
    # POWERLEVEL9K_BATTERY_STAGES=''
    
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='none'
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
    
    POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='none'
    POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'

    # POWERLEVEL10K_MODE='nerdfont-complete'      # yay -Syu nerd-fonts-dejavu-complete       dejavu字体加nerd-fonts全套的字形集。
    # ZSH_THEME=powerlevel10k/powerlevel10k
else
    # zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, from:github, at:next, as:theme
    zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, from:github, at:next, as:theme
    if zplug check "romkatv/powerlevel10k"; then
        zplug clean
        if [ -f ~/.p10k.zsh ]; then 
            mv ~/.p10k.zsh ~/.p10k.zsh.back
        fi
    fi
    # powerlevel9k配置
    # https://raw.githubusercontent.com/tonylambiris/dotfiles/devel/dot.zshrc
    if zplug check "bhilburn/powerlevel9k"; then

        # Easily switch primary foreground/background colors
        #    DEFAULT_FOREGROUND=038 DEFAULT_BACKGROUND=024 PROMPT_COLOR=038
        #    DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235 PROMPT_COLOR=173
        #    DEFAULT_FOREGROUND=198 DEFAULT_BACKGROUND=090 PROMPT_COLOR=173
        #    DEFAULT_FOREGROUND=235 DEFAULT_BACKGROUND=159 PROMPT_COLOR=173
        #    DEFAULT_FOREGROUND=123 DEFAULT_BACKGROUND=059 PROMPT_COLOR=183
        #    DEFAULT_FOREGROUND=159 DEFAULT_BACKGROUND=238 PROMPT_COLOR=173
        #    DEFAULT_FOREGROUND=159
            
        P9K_MODE='nerdfont-fontconfig'         # "nerdfont-complete"    # pacman -Syu nerd-fonts-dejavu-complete       dejavu字体加nerd-fonts全套的字形集。
        DEFAULT_BACKGROUND=239
        PROMPT_COLOR=172
        DEFAULT_COLOR="clear"
    
        P9K_MODE="nerdfont-complete"    # pacman -Syu nerd-fonts-dejavu-complete       dejavu字体加nerd-fonts全套的字形集。
        P9K_STATUS_VERBOSE=false
        P9K_DIR_SHORTEN_LENGTH=1
    
        P9K_DIR_OMIT_FIRST_CHARACTER=false
    
        P9K_CONTEXT_ALWAYS_SHOW=true
        P9K_CONTEXT_ALWAYS_SHOW_USER=false
    
        P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{232}\uE0BD%f"
        P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{232}\uE0BD%f"
        P9K_LEFT_SEGMENT_SEPARATOR_ICON='▓▒░'
        P9K_RIGHT_SEGMENT_SEPARATOR_ICON='░▒▓'
    
        P9K_PROMPT_ON_NEWLINE=true
        P9K_RPROMPT_ON_NEWLINE=false
    
        P9K_STATUS_VERBOSE=true
        P9K_STATUS_CROSS=true
        P9K_PROMPT_ADD_NEWLINE=true
    
        P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}%f"
        P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}➜ %f"
    
        P9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir dir_writable vcs)
        P9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)
    
        P9K_VCS_GIT_GITHUB_ICON=""
        P9K_VCS_GIT_BITBUCKET_ICON=""
        P9K_VCS_GIT_GITLAB_ICON=""
        P9K_VCS_GIT_ICON=""
    
        P9K_VCS_CLEAN_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_VCS_CLEAN_FOREGROUND="010"
    
        P9K_VCS_MODIFIED_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_VCS_MODIFIED_FOREGROUND="011"
    
        P9K_VCS_UNTRACKED_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_VCS_UNTRACKED_FOREGROUND="011"
    
        P9K_DIR_HOME_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_DIR_HOME_FOREGROUND="158"
        P9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_DIR_HOME_SUBFOLDER_FOREGROUND="158"
        P9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_DIR_DEFAULT_FOREGROUND="158"
        P9K_DIR_ETC_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_DIR_ETC_FOREGROUND="158"
        P9K_DIR_NOT_WRITABLE_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_DIR_NOT_WRITABLE_FOREGROUND="158"
    
        P9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_ROOT_INDICATOR_FOREGROUND="red"
    
        P9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_STATUS_OK_FOREGROUND="green"
        P9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_STATUS_ERROR_FOREGROUND="red"
    
        P9K_TIME_ICON="\uF017" # 
        P9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_TIME_FOREGROUND="183"
    
        P9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
        P9K_COMMAND_EXECUTION_TIME_PRECISION=1
    
        P9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_BACKGROUND_JOBS_FOREGROUND="123"
    
        P9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_USER_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_USER_DEFAULT_ICON="\uF415" # 
        P9K_USER_ROOT_ICON=$'\uFF03' # ＃
    
        P9K_CONTEXT_TEMPLATE="\uF109 %m"
        P9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_CONTEXT_DEFAULT_FOREGROUND="123"
        P9K_CONTEXT_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_CONTEXT_SUDO_FOREGROUND="123"
        P9K_CONTEXT_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_CONTEXT_REMOTE_FOREGROUND="123"
        P9K_CONTEXT_REMOTE_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_CONTEXT_REMOTE_SUDO_FOREGROUND="123"
        P9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_CONTEXT_ROOT_FOREGROUND="123"
    
        P9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_HOST_LOCAL_ICON="\uF109 " # 
        P9K_HOST_REMOTE_ICON="\uF489 "  # 
    
        P9K_SSH_ICON="\uF489 "  # 
        P9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_SSH_FOREGROUND="212"
    
        P9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"
        P9K_OS_ICON_FOREGROUND="212"
    fi
fi

if zplug check "zsh-users/zsh-syntax-highlighting"; then
    typeset -gA ZSH_HIGHLIGHT_STYLES ZSH_HIGHLIGHT_PATTERNS

    ZSH_HIGHLIGHT_STYLES[default]='none'
    ZSH_HIGHLIGHT_STYLES[cursor]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey,underline'
    ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=white'
    ZSH_HIGHLIGHT_STYLES[path_approx]='fg=white'
    ZSH_HIGHLIGHT_STYLES[globbing]='none'
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
    ZSH_HIGHLIGHT_STYLES[assign]='none'

    ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
fi

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load
# --------------------------------------------------------------------------------------------------------------------------------------------
# zplug end
# --------------------------------------------------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------------------------------------------------
# PROMPT=PS1
# --------------------------------------------------------------------------------------------------------------------------------------------
# 我的PS1i
# Initialize command prompt
# export PS1="%n@%m:%~%# "
# export PS1=$'%{\e[1;37m[ \e[1;31m%n\e[1;37m@\e[1;33m%m \e[1;35m%~ \e[1;37m]\e[0m%#%} '
# export PS1="${White}[${Reset}${Cyan}${0}:${Reset}${Red}%n${Reset}${White}@${White}] "

# autoload -U promptinit
# promptinit
# prompt fade magenta

# --------------------------------------------------------------------------------------------------------------------------------------------
# Enable 256 color to make auto-suggestions look nice
# [[ $TMUX = "" ]] && export TERM="xterm-256color"
# export LD_PRELOAD=/usr/lib/libwcwidth-icons.so
export TERM="xterm-256color"
export TERMINAL="st"
export EDITOR="vim"
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PYTHON="python2.7"

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

# load local config
[ -f "$HOME/.local/etc/config.zsh" ] && source "$HOME/.local/etc/config.zsh"
[ -f "$HOME/.local/etc/local.zsh" ] && source "$HOME/.local/etc/local.zsh"

# --------------------------------------------------------------------------------------------------------------------------------------------
# Aliases
# --------------------------------------------------------------------------------------------------------------------------------------------
alias "."="cd ."
alias ".."="cd .."
{ local alias_from=".."
  local alias_to="cd .."
  for _pit in {1..42}; do
    alias_from="$alias_from."
    alias_to="$alias_to/.."
    eval "alias ${alias_from}=\"${alias_to}\""
  done
}
alias zshrc="vim ~/dotfiles/.zshrc"
# https://wdxtub.com/2016/02/18/oh-my-zsh/
alias lsi='/opt/coreutils/bin/ls'
# export PATH=$PATH:/opt/coreutils/bin
alias ls='lsd'
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

# --------------------------------------------------------------------------------------------------------------------------------------------
# colorls
# --------------------------------------------------------------------------------------------------------------------------------------------
# export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
# source $(dirname $(gem which colorls))/tab_complete.sh
# alias cla="colorls -A"
# alias cld="colorls -d"
# alias clf="colorls -f"
# alias clh="colorls -h"
# alias cll="colorls -l"
# alias clr="colorls -r"
# alias clt="colorls --tree"
# alias clgs="colorls --gs"
# alias clsd="colorls -A --sd"
# alias clsf="colorls -A --sf"

# --------------------------------------------------------------------------------------------------------------------------------------------
# fzf
# --------------------------------------------------------------------------------------------------------------------------------------------
export FZF_COMPLETION_TRIGGER='~~'
# export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_COMMAND='find -type f'
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --border \
    --color='fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='find -type d'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"


export GOPROXY=https://goproxy.io,direct

# --------------------------------------------------------------------------------------------------------------------------------------------
# proxy
# --------------------------------------------------------------------------------------------------------------------------------------------
# export all_proxy=http://192.168.79.1:1080/
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

export RANGER_LOAD_DEFAULT_RC=FALSE

source /usr/share/doc/pkgfile/command-not-found.zsh
