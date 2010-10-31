## lachkaters .zshrc 04.09
##########################

zmodload  zsh/termcap zsh/complist zsh/computil
autoload -Uz compinit colors history-search-end url-quote-magic
compinit
colors

HISTFILE=~/.zshhist
HISTSIZE=8000
SAVEHIST=8000

#bindkey -e
export EDITOR=vim

setopt brace_ccl			# expand alphabetic brace exrpressions
setopt complete_aliases
setopt complete_in_word     # ~/Dev/pro -> <Tab> -> ~/Development/project
setopt numeric_glob_sort    # when globbing numbered files, use real counting
setopt hist_ignore_all_dups # when I run a command several times, only store one
setopt hist_no_functions    # don't show function definitions in history
setopt hist_reduce_blanks   # reduce whitespace in history
setopt correct				# spell check for commands only
#setopt glob_complete
setopt extended_glob
setopt autopushd            # automatically append dirs to the push/pop list
setopt pushdignoredups      # and don't duplicate them
setopt prompt_subst
setopt auto_cd              # automatically cd to paths
setopt numeric_glob_sort	# when globbing numbered files, use real counting

## Prompt
##############

PROMPT="%B%n[%24<*<%~]%#%b "
#RPROMPT="%~ (%*)" #show date on right prompt


## Keys
##############

bindkey '^y'	kill-region
bindkey '^O'	vi-open-line-below
bindkey '^w'	backward-delete-word
bindkey '^i'    expand-or-complete-prefix
bindkey '\EOH'  beginning-of-line
bindkey '\EOF'  end-of-line
bindkey '\E[3~' delete-char
bindkey '\E[5~' history-search-backward
bindkey '\E[6~' history-search-forward

# konsole or xterm
bindkey '\E[H'	beginning-of-line
bindkey '\E[F'	end-of-line

# (u)rxvt
bindkey '\E[8~' end-of-line
bindkey '\E[7~' beginning-of-line
bindkey '5C'	forward-word
bindkey '5D'	backward-word
# screen/tmux
bindkey '\E[1~' beginning-of-line
bindkey '\E[4~' end-of-line
bindkey '\EOD'	backward-word
bindkey '\EOC'	forward-word

## Style
##############

zle -N history-beginning-search-backward-end
zle -N history-beginning-search-forward-end history-search-end
zle -N self-insert url-quote-magic

# formatting and messages
zstyle ':completion:*' verbose 'yes'
zstyle ':completion:*:descriptions' format "%B-- %d --%b"
zstyle ':completion:*:messages' format "%B--${green} %d ${nocolor}--%b"
zstyle ':completion:*:warnings' format "%B--${red} no match for: %d ${nocolor}--%b"
zstyle ':completion:*:corrections' format "%B--${yellow} %d ${nocolor}-- (errors %e)%b"
zstyle ':completion:*' group-name ''

# describe options
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d' -x NULLCMD=cat

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 1
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:processes' command 'ps -A'
zstyle ':completion:*:manuals' menu yes select
zstyle ':completion:*history*' remove-all-dups yes
zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd
typeset -xUT LS_COLORS ls_colors

# more ls colors
ls_colors=(
    #1 = red 2=green 3=yellow 4=blue 5=pink 6=cyan 7=white 8=black
    "no=00"
    "fi=00"
    "di=01;38"
    "ln=01;35"
    "*#=4"
    "*%=4"
    "*~=4"

    "*.cmd=01;32"
    "*.exe=01;32"
    "*.sh=01;32" 
    "*.zsh=01;32"

    "*.tar=00;31"
    "*.tgz=00;31"
    "*.rar=00;31"
    "*.taz=00;31"
    "*.lzh=00;31"
    "*.zip=00;31"
    "*.gz=00;31"
    "*.bz2=00;31"
    "*.cpio=00;31"
    "*.rpm=01;31"
    "*.deb=01;31"

    "*.jpg=00;34"
    "*.gif=00;34"
    "*.bmp=00;24"
    "*.xbm=00;34"
    "*.xpm=00;34"
    "*.png=00;34"
    "*.tif=00;34"

    "*.c=31"
    "*.cc=31"
    "*.cpp=31"
    "*.C=31"
    "*.cxx=31"
    "*.o=34"
    "*.h=33"
    "*.java=31"
    "*.class=35"
    "*.html=31"
    "*.htm=31"
    "*.shtml=31"
    "*.tex=31"
    "*.lyx=31"
    "*.mgp=31"
    "*.pl=31"
    "*.py=31"

    "*akefile=31;43"
    "*akefile.linux=31;43"
    "*akefile.in=31;43"
    "*akefile.am=31;43"
    "*onfigure.in=31;43"

    "*.ogg=33;4"
    "*.flac=33;4"
    "*.mp3=33;4"
    "*.wav=33;4"
    "*.mpg=35;4"
    "*.mpeg=35;4"
    "*.avi=35;4"
    "*.ram=35;4"
    "*.wmv=35;4"
    "*.vob=35;4"
    "*.mkv=35;4"
)

# Colored less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


## Alias
##############

alias -g ...="../.."
alias -g ....="../../.."
#alias alert="notify-send -i $(history|tail -n1)"
alias DIE="sudo shutdown -hP now 'Ich Will Leben!'"
alias la="ls -ACF"
alias ll="ls -l -h --color=auto -F"
alias ls="ls --color=auto -F"
alias grep="grep --color=auto"
alias -g ND='$(ls --color=none -d *(/om[1]))' # newest directory
alias -g NF='$(ls --color=none *(.om[1]))' #newest file
alias own="sudo chown `whoami`:users"
alias podracer="cd /mnt/sda5/PodRacer; WINEDEBUG=-all wine podracer_*.exe; cd -"
alias pwd=/bin/pwd	# inbuild pwd does not show realpath (symlink problem)
alias pud='pwd | xsel -s'
alias pod='cd "$( xsel -so )"'
alias readbios="sudo dd if=/dev/mem bs=1k skip=768 count=512 2>/dev/null | strings -n 8"
alias search="find | grep"
#alias showip="wget -q -O - www.joerky.de/dyn/ip.php | cat"
alias showip="curl icanhazip.com"
alias ut99="cd /mnt/sda5/Unr*/Sy*; WINEDEBUG=-all wine UnrealT*.exe; cd -"
alias xorg="sudo vim /etc/X11/xorg.conf"

## Command File Type Detection
compctl -/ -g '*.(ogg|ogv|avi|mpg|mpeg|wmv|mp4|mov|flv|divx|mkv|vob)' smplayer
compctl -/ -g '*.(png|jpg|gif|bmp|tiff|jpeg|tga|JPG)' feh

# auto open movies
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv,vob,ogv,ogg}="mplayer -idx"

# auto open audio
alias -s {mp3,ogg,wav,flac}="cplay"


## Functions
##############

function update()
{
#    packer --noconfirm -Syu
	sudo clyde -Syu --aur --noconfirm
}

function cleanthumbnails()
{
	du -sh ~/.thumbnails
	find ~/.thumbnails -type f -atime +28 -exec rm '{}' \;
	du -sh ~/.thumbnails
}

function readdisk()
{
	if [ "$1" = "" ] ; then		
		echo "usage: readdisk [sd?/hd?]"	
	else
		echo "$1"
		sudo hexdump -C /dev/"$1" | less
	fi
}

function showtopcmds()
{
    if [ "$1" = "" ] ; then
		1="10"
    fi
    print -l ${(o)history%% *} | uniq -c | sort -nr | head -n "$1"
    echo "* Roots Top Cmds:"
	grep sudo $HISTFILE | awk '{print $2}'| sort | uniq -c | sort -nr | head -n "$1"
    echo "* Total Cmds: `wc -l $HISTFILE`"
}

function llocate()
{
    locate $@ | grep -v /mnt/
}

function lowercase-extensions()
{
	autoload zmv
	zmv '(**/)(*).(*)' '$1$2.${(L)3}'
}

function bcalc() {
    if [[ ! -f /usr/bin/bc ]] ; then
        echo 'Please install bc before trying to use it!'
        return
    fi
    
    if [[ -z "$1" ]] ; then
        /usr/bin/bc -q
    else
       echo "$@" | /usr/bin/bc -l
    fi
}

function title()
{
	print -nR $'\033]0;'$*$'\a'
}

function locategrep 
{ 
  if [ "${#}" != 2 ] ; then 
    echo "Usage: locategrep [string to locate] [string to grep]"; 
    return 1; 
  else 
    echo "locate -i ${1} | grep -i ${2}"; 
    command locate -i ${1} | grep -i ${2}; 
  fi; 
}

function lli()
{
    ls -l --color=auto | grep -i ${1:-""} 
}

function c() {
    case $1 in
        (-Ss | -Si | -Q* | -T | -G | *)
            /usr/bin/clyde "$@" ;;
        (-S* | -R* | -U )
            /usr/bin/sudo /usr/bin/clyde "$@" || /bin/su -c /usr/bin/clyde "$@" || return $? ;;
    esac
}


#compdef _pacman clyde=pacman

#[ -f .todo ] && cat .todo

