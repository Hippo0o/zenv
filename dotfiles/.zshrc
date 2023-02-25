# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=$PATH:$HOME/.local/bin:$(ruby -e 'puts Gem.user_dir')/bin:$HOME/.node/bin:$HOME/.config/composer/vendor/bin:$(go env GOPATH)/bin

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# true until https://github.com/ohmyzsh/ohmyzsh/issues/10972 is fixed
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/usr/share/zsh/plugins

ZSH_DISABLE_COMPFIX=true

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

VI_MODE_SET_CURSOR="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # vi-mode
    direnv
    docker docker-compose
    composer
    npm
    zsh-autosuggestions
    # kubectl
    # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# zsh-syntax-highlighting
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=none,underline
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=none,underline
#ZSH_HIGHLIGHT_STYLES[arg0]=fg=none

#zstyle ':completion:*' rehash true

unsetopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt share_history
unsetopt nomatch

bindkey "^E" edit-command-line
bindkey -r "^[l"
bindkey -r "^[h"

# PROMPT='${PWD/#$HOME/~}
# %{$fg[cyan]%}%(!.#.$)%{$reset_color%} '
#RPROMPT='%{$fg[cyan]%}[%*]%{$reset_color%}'

alias ll='ls -alFh --group-directories-first --color=auto'
alias df='df -h'
alias vi="$EDITOR"
alias i3config='vi ~/.i3/config +"set ft=i3config"'
alias swayconfig='vis ~/.config/sway'
alias viconfig='vis ~/.config/nvim'
alias neofetch='neofetch --color_blocks on --ascii_distro arch --colors 6 7 7 6 --ascii_colors 7 7'
alias dockerc='docker-compose'
alias yay='yay --nocleanmenu --nodiffmenu --editmenu'
alias ccopy='xclip -selection c'
alias fd='fd -HI'

# ssh() {
#     echo -ne '\e[2 q'
#     command ssh "$@"
#     echo -ne '\e[6 q'
# }

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1 -d `basename $1 .zip` ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

path-to-id() {
    echo "${$(echo ${$(realpath $1)//\//__} | rev | cut -c -50 | rev)##__}"
}

vis() {
    cd "$1" && abduco -e ^z -A "vis_$(path-to-id $(pwd))" vi $2 +'SessionManager load_current_dir_session'
    cd -
}
sis() {
    S=$(abduco | grep __home__tobias | cut -d'	' -f3 | sed -e 's/__/\//g' | fzf)
    if [[ -n "$S" ]] then
        echo -e "\e]2;vis $S\007"
        vis $S
    fi
}

mkcd() { mkdir -p "$1" && cd "$1" ; }
cdvi() {
    cd "$1" && vi
    cd -
}
mkvi() { mkdir -p "$(dirname "$1")" && vi "$1" ; }


git-acp() {
    git add .;
    git commit -m "$(date +%Y-%m-%d\ %H:%M)
    $(git status -s)";
    git push
}

duh() {
    du -d 1 -h $@ | sort -h
}

e() {
    ID=$(path-to-id $(pwd))
    [ -z $(docker ps -a -f name=$ID -q) ] && docker run -it -d --name=$ID -u $HOST_USER -v "$(pwd):/workdir" $@ zenv zsh
    docker start -i $ID
}

s() {
    docker run -it --rm -u root -v "/:/workdir" zenv $@
}

j() {
    docker run -it --rm -u $HOST_USER -v "$(pwd):/workdir" $@ zenv zsh
}

u() {
    su $HOST_USER $@
}

hs() {
    SESSION_ID=h_${$(echo $@)//\//__}
    SESSION_ID=${${SESSION_ID}// /+}
    abduco -e ^z -A $SESSION_ID ssh -t $HOST_USER@localhost "$@"
}

h() {
    ssh -t $HOST_USER@localhost "$@"
}

update() {
    hs "yay -Syu;read"
    hs "flatpak update --user;read"
}

bdiff() { diff -u $@ | ydiff -s -w 0 }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
