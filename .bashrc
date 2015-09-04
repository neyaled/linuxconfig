# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=~/bin:$PATH
#PATH=~/bin/jdk1.6.0_29/bin:$PATH
PATH=~/android-sdks/tools:$PATH

export USE_CCACHE=1
export CCACHE_TOOLS_PREFIX="/usr/bin/ccache"
ccache -M 2G > /dev/null
ccache -F 0 > /dev/null

export APPDATA=/tmp

export JAVA_1_5=/usr/java/jdk1.5.0_22

#export JAVA_HOME=$HOME/bin/jdk1.6.0_29
export JAVA_FONTS=/usr/share/fonts/truetype
export ANT_HOME=/usr/share/ant
PATH=$ANT_HOME/bin:$JAVA_HOME/bin:$PATH
export CLASSPATH=.

export NSS_SSL_CBC_RANDOM_IV=0

alias ant-install="android update project -t 17 -p $(pwd) && ant debug install"

alias enable_alert='PS1="$PS1\a"'

alias systrace='~/android-sdks/tools/systrace/systrace.py'
alias setsystrace='adb root; adb wait-for-device; echo "1. systrace --set-tags sync,gfx,camera,video,input,webview,audio,am,wm,view";systrace --set-tags sync,gfx,camera,video,input,webview,audio,am,wm,view 1>/dev/null; echo "2. Restart Zygote"; adb shell stop; adb shell start'
alias startsystrace='systrace -d -f -i -l -t 10 -o'

stty -ixon

alias as="adb wait-for-device && adb shell"
alias aroot="adb wait-for-device && adb root && adb wait-for-device"
alias await="adb wait-for-device"
alias areboot="adb reboot"
alias abootloader="adb wait-for-device && adb reboot bootloader"
alias al="adb logcat -b main -b system -b radio -b events -b kernel -v threadtime"
alias asmeminfo="adb shell cat /proc/meminfo"
alias ascmdline="adb shell cat /proc/cmdline"
alias asinstalled="adb shell pm list packages"
alias admesg="adb shell cat /proc/kmsg"
alias count="awk 'BEGIN{count=0;} {count+=\$1;} END{print count;}'"
alias countverbose="awk 'BEGIN{count=0;} {count+=\$1;print count;} END{print count;}'"
alias cscope_x86='cscope -b `find ./arch/x86/ ./android/ ./[b-z]*/ -type f`'
alias apull='adb pull'
alias apush='adb push'
alias aremount='adb remount / && adb shell mount -o remount,rw /'
alias smaps2line="awk 'BEGIN{i=0;} {if (i == 0) {addr=\$1; section=\$2; name=\$NF;} else {printf(\"%s %s (%s) (%s)\n\",\$2,name,section,addr);}; i++; i%=2 }' | sort -k1 -n -r"
alias fastbooterasedata='adb reboot bootloader && fastboot erase data && fastboot continue'
alias debug='set -x'
