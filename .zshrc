## lachkaters .zshrc 01.14
##########################

# {{{1 Options

zmodload  zsh/termcap zsh/complist zsh/computil
autoload -Uz compinit colors history-search-end url-quote-magic
compinit
colors

export XCOMPOSE=~/.Xcompose

export HISTFILE=~/.zshhist
export HISTSIZE=6096
export SAVEHIST=6096
export EDITOR=vim

setopt brace_ccl			# expand alphabetic brace exrpressions
setopt complete_aliases
setopt complete_in_word     # ~/Dev/pro -> <Tab> -> ~/Development/project
setopt numeric_glob_sort    # when globbing numbered files, use real counting
#setopt hist_ignore_all_dups # when I run a command several times, only store one
setopt hist_ignore_dups		# when I run a command several times, only store one
setopt hist_no_functions    # don't show function definitions in history
setopt hist_reduce_blanks   # reduce whitespace in history
setopt append_history
setopt inc_append_history
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells
setopt correct				# spell check for commands only
#setopt glob_complete
setopt extended_glob
setopt autopushd            # automatically append dirs to the push/pop list
setopt pushdignoredups      # and don't duplicate them
setopt prompt_subst
setopt auto_cd              # automatically cd to paths

## {{{1 Prompt

#PROMPT="%B%n[%24<*<%~]%#%b "
PROMPT="
%B%n %bon%B %m %bis%B %(?.%F{green}:)%f.%F{red}:(%f) %bwhile being at%B %32<*<%~
%#%b "

PROMPT="
%B%n %bon%B %m %bis%B %(?.%F{green}:)%f.%F{red}:(%f) %bat%B %32<*<%~
%#%b "
#RPROMPT="%~ (%*)" #show date on right prompt


## {{{1 Keys

# mappings for Ctrl-left-arrow and Ctrl-right-arrow for word moving 
bindkey -M emacs '^[[1;5C' forward-word 
bindkey -M emacs '^[[1;5D' backward-word 
bindkey '^R'  history-incremental-search-backward
bindkey '^[[5~' history-search-backward		#PgUp
bindkey '^[[6~' history-search-forward		#PgDwn
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

## {{{1 Style 

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


## {{{1 Alias

alias -g ...="../.."
alias -g ....="../../.."
alias cp="cp -r"
alias DIE="sudo shutdown -hP now 'Ich Will Leben!'"
alias df="df -h"
alias la="ls -ACF --group-directories-first"
alias ll="ls -l -h --color=auto -F --group-directories-first"
alias ls="ls --color=auto -F --group-directories-first"
alias lsd="ls -d */"
alias grep="grep --color=auto"
alias inet="ip addr; ping google.de"
alias -g ND='$(ls --color=none -d *(/om[1]))' # newest directory
alias -g NF='$(ls --color=none *(.om[1]))' #newest file
alias own="sudo chown `whoami`:users"
alias pwd=/bin/pwd	# inbuild pwd does not show realpath (symlink problem)
alias pud='pwd | xsel -s'
alias pod='cd "$( xsel -so )"'
alias readbios="sudo dd if=/dev/mem bs=1k skip=768 count=512 2>/dev/null | strings -n 8"
alias search="find | grep"
alias showip="curl icanhazip.com"
alias srm="mv -t ~/.local/share/Trash/files --backup=t --verbose"
alias weather="curl -s wttr.in/bonn+germany | head -n 7" # 2> /dev/null"

## Command File Type Detection
compctl -/ -g '*.(ogg|ogv|avi|mpg|mpeg|wmv|mp4|mov|flv|divx|mkv|vob)' mplayer
compctl -/ -g '*.(png|jpg|gif|bmp|tiff|jpeg|tga|JPG)' feh

# auto open movies
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv,vob,ogv,ogg}="mplayer -idx"

# auto open audio
alias -s {mp3,ogg,wav,flac}="mplayer"


## {{{1 Functions

function rndpron()
{
	#mplayer ~/Videos/.p/"$(ls ~/Videos/.p/ | shuf | head -n1)"
	cd ~/Videos/.pron/
	#$(*) | shuf  | xargs mplayer
	rm pl.txt
	files=(*); for x in {1..50}; do i=$((RANDOM % ${#files[@]} + 1)); echo "${files[i]}" >> pl.txt; done
	uniq pl.txt > p.txt
	mv p.txt pl.txt 
	mplayer -playlist pl.txt

	cd -

}

function update()
{
	if [ -f /usr/bin/apt-get ];	then
		sudo apt-get update
		sudo apt-get dist-upgrade -y
	else
	    packer --noconfirm -Syu
	fi
}

function cleanpackertmp()
{
	rm -rv /tmp/packerbuild-1000
#	rm -rv /tmp/packertmp-1000
}

function cleanthumbnails()
{
	du -sh ~/.thumbnails
	find ~/.thumbnails -type f -atime +30 -exec rm '{}' \;
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
    locate $@ | grep -v /media
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

function llgrep()
{
    ls -l --color=auto | grep -i ${1:-""} 
}

function mvcd()
{
	mv -iv "${@}" && cd "${@: -1}"
}

#[ -f .todo ] && cat .todo

