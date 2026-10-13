# started with Debian .bashrc, tweaked, and added LFS stuff

# bails if running interactively
case $- in
    *i*) ;;
    *) return;;
esac

shopt -s checkwinsize
shopt -s globstar
shopt -s histappend

HISTSIZE=-1
HISTFILESIZE=-1

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color|*-ghostty) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

case "$TERM" in
    xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
    *) ;;
esac

alias ls='ls --color=auto'
eval "$(dircolors -b)"
set +h
umask 022

LC_ALL=POSIX
LFS_TARGET=$(uname -m)-lfs-linux-gnu
PATH=/usr/sbin:/usr/bin
PATH=~/mnt/opt/lfs/bin:$PATH:~/.local/bin
CONFIG_SITE=~/mnt/usr/share/config.site

export LC_ALL LFS_TARGET PATH CONFIG_SITE
