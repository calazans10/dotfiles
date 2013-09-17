# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="wezm+"

# Example aliases
alias zshconfig="sublime-text ~/.zshrc"
alias ohmyzsh="sublime-text ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(django git git-flow golang heroku pip python rails ruby virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/home/calazans/.rvm/gems/ruby-2.0.0-p0/bin:/home/calazans/.rvm/gems/ruby-2.0.0-p0@global/bin:/home/calazans/.rvm/rubies/ruby-2.0.0-p0/bin:/home/calazans/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games


########################
##       ALIASES      ##
########################

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


########################
##      PAGGTAXI      ##
########################

alias fs='foreman start -f Procfile.dev'
alias sync='./manage.py syncdb'
alias clear-pyc='find . -name \*.pyc -delete'
alias migration='./manage.py schemamigration'
alias migrate='./manage.py syncdb --migrate'
alias console='./manage.py shell_plus'
alias teste='pyrg ./manage.py test'


########################
##        RUBY        ##
########################

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm


########################
##       PYTHON       ##
########################

export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages --distribute'
export RH_SECRET_KEY=')%25*!10nuwo^$utxt#d*$@o&l-os&b8b50pxq5e6xe4oddk!j'

########################
##       HEROKU       ##
########################

export PATH="/usr/local/heroku/bin:$PATH"


########################
##         GO         ##
########################

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
