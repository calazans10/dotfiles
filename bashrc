# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# some aliases for myfreecomm
alias fs='bundle exec foreman start -f Procfile.development'
alias integrate="RAILS_ENV=test time rake integrate"


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

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Git prompt function that returns (branch) ou (branch*)
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_color="\033[33;33m"
    git_append=""
  else
    git_color="\033[01;31m"
    git_append="*"
  fi

  echo -e " $git_color$git_branch$git_append"
}

source ~/.rails-completion.bash
source ~/.rake-completion.bash
source ~/.git-completion.bash


GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;34m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\](\[\033[33;31m\]$(~/.rvm/bin/rvm-prompt i v g)\[\033[33;33m\]$(git_prompt)\[\033[00m\])\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\n$ '




[[ -s "/home/calazans/.rvm/scripts/rvm" ]] && source "/home/calazans/.rvm/scripts/rvm"
[[ -s "/home/calazans/.rvm/scripts/rvm" ]] && source "/home/calazans/.rvm/scripts/rvm"


export CERTMAN_HOME="$HOME/calazans/myfreecomm/certman" # altere para a raiz do certman na sua máquina
export EC2_HOME="$HOME/Amazon/ec2-api-tools"
export AWS_AUTO_SCALING_HOME="$HOME/Amazon/AutoScaling"
export AWS_ELB_HOME="$HOME/Amazon/ElasticLoadBalancing"
export AWS_RDS_HOME="$HOME/Amazon/RDSCli"
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-i386" # altere para o java na sua máquina
export PATH="$PATH:$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_ELB_HOME/bin:$AWS_RDS_HOME/bin"
function set_project() {
  export CERTMAN_S3CFG="$HOME/calazans/Amazon/myfinance/jeferson.calazans@myfreecomm.com.br.s3cfg"
  export EC2_PRIVATE_KEY="$HOME/calazans/Amazon/myfinance/jeferson.calazans@myfreecomm.com.br.key"
  export EC2_CERT="$HOME/calazans/Amazon/myfinance/jeferson.calazans@myfreecomm.com.br.crt"
  export AWS_CREDENTIAL_FILE="$HOME/calazans/Amazon/myfinance/jeferson.calazans@myfreecomm.com.br.aws-credential-file"
  export CERTMAN_KEYS_BUCKET=$2
  export CERTMAN_PROJECT_BUCKET=$3
  export CERTMAN_SSH_KEY_NAME=$4
  # aqui entra algo que eu não entendo. Teoricamente não deveria precisar desse arquivo "$HOME/.aws-credential-file".
  rm -Rf "$HOME/.aws-credential-file"
  cp -rf $AWS_CREDENTIAL_FILE "$HOME/.aws-credential-file"
}
function set_myfreecomm() {
  set_project "myfreecomm" 'myfreecomm-ec2-pairs' 'myfreecomm-ec2' 'myfreecomm-AWS-US-East'
}
function set_myfinance() {
  set_project "myfinance" 'myfinance-keys-9b7hz90vb7hk' 'myfinance-packages-1qyts2yte9vtv' 'myfreecomm-AWS-US-East'
}
function set_fundos() {
  set_project "fundos" 'fundos-keys-13lfshmzplqh2' 'fundos-packages-8e40u6mbpdv5' 'myfreecomm-AWS-US-East'
}
function setBackground() {
  osascript -e "tell application \"iTerm\"
    tell current terminal
      tell current session
        set background color to $1
      end tell
    end tell
  end tell"
}
alias setBlackBackground='setBackground "{0,0,0}"'
function ssh() {
  /usr/bin/ssh $@
  STATUS=$?
  setBackground "{0,0,0}"
  return $STATUS
}
function ec2ssh() {
  INSTANCE="$1"
  shift
  if [[ -z "$INSTANCE" ]]
  then
    echo 'use: ec2ssh $INSTANCE' >&2
    return 2
  fi
  DESCRIBE=$(ec2-describe-instances "$INSTANCE")
  ADDRESS=$(echo "$DESCRIBE" | awk '$1 ~ /^INSTANCE$/ { print $4; }')
  ADDRESS="${ADDRESS% *}"
  if [[ -n "$ADDRESS" ]]
  then
    if [[ `echo "$DESCRIBE" | grep "production"` ]]
    then
      setBackground "{15000,0,0}"
    fi
    if [[ `echo "$DESCRIBE" | grep "sandbox"` ]]
    then
      setBackground "{0,0,15000}"
    fi
    ssh -t "$ADDRESS" $@
    setBackground "{0,0,0}"
  else
    return 1
  fi
}
function ec2log() {
    INSTANCE="$1"
    if [[ -z "$INSTANCE" ]]
    then
        echo "Use: $0 instance [logfile]" >&2
        return 1
    fi
    LOGFILE="${2:-/var/log/bootstrap.log}"
  ec2ssh "$INSTANCE" "tail -f '$LOGFILE'"
}
### Myfinance SSH
function __mf-ssh() {
  ENVIRONMENT="$1"
  RAILS_ENV="$2"
  if [[ -z "$ENVIRONMENT" ]]
  then
    echo 'use: __mf-ssh $ENVIRONMENT $RAILS_ENV' >&2
    echo '$ENVIRONMENT not found'
    return 1
  fi
  if [[ -z "$RAILS_ENV" ]]
  then
    echo 'use: __mf-ssh $ENVIRONMENT $RAILS_ENV' >&2
    echo '$RAILS_ENV not found'
    return 2
  fi
  INSTANCE_ID=$(elb-describe-instance-health $ENVIRONMENT | egrep -o -m 1 "i-[a-zA-Z0-9]+")
  echo "Connecting to $INSTANCE_ID..."
  ec2ssh "$INSTANCE_ID" "sudo -i 'cd /srv/myfinance/src/ && bash'"
}
function mf-ssh-sandbox() {
  # __mf-ssh "MyFinance-Sandbox" "sandbox"
  __mf-ssh "myfinance-sand-ELB-1V2F0MY0KS8BS" "sandbox"
}
function mf-ssh-production() {
  # __mf-ssh "MyFinance-Production" "production"
  __mf-ssh "myfinance-prod-ELB-10E1045ZCLZ8Z" "production"
}
function mf-ssh-integracao-continua() {
  ssh -t "integracao@ingelheim.corp.myfreecomm.com.br" "cd /var/lib/jenkins/root/workspace/Myfinance/src && sudo su jenkins"
}
### Myfinance rails console
function __mf-rails-console() {
  ENVIRONMENT="$1"
  RAILS_ENV="$2"
  if [[ -z "$ENVIRONMENT" ]]
  then
    echo 'use: __mf-rails-console $ENVIRONMENT $RAILS_ENV' >&2
    echo '$ENVIRONMENT not found'
    return 1
  fi
  if [[ -z "$RAILS_ENV" ]]
  then
    echo 'use: __mf-rails-console $ENVIRONMENT $RAILS_ENV' >&2
    echo '$RAILS_ENV not found'
    return 2
  fi
  INSTANCE_ID=$(elb-describe-instance-health $ENVIRONMENT | egrep -o -m 1 "i-[a-zA-Z0-9]+")
  ec2ssh "$INSTANCE_ID" "sudo -i 'cd /srv/myfinance/src/ && bundle exec rails console $RAILS_ENV'"
}
function mf-rails-console-sandbox() {
  __mf-rails-console "myfinance-sand-ELB-1V2F0MY0KS8BS" "sandbox"
}
function mf-rails-console-production() {
  __mf-rails-console "myfinance-prod-ELB-10E1045ZCLZ8Z" "production"
}

[[ -s "/home/calazans/.rvm/scripts/rvm" ]] && source "/home/calazans/.rvm/scripts/rvm"
