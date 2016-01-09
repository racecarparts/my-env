# . /cust/tools/bin/b2c.sh

MY_ENV_BASH=~/my-env/bash
MY_ENV_RUBY=~/my-env/ruby
MY_ENV_GIT_CONF=~/my-env/conf/git
MY_DEVELOPMENT_FOLDER=~/wrk
MY_SANDBOX_FOLDER=~/wrk/sandbox

# Enable programmable completion features.
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# source the bash global bash stuff
for f in $(find $MY_ENV_BASH -name '*.sh' -or -name '*.bash' ); do source $f; done

# Sets JAVA_HOME
java_set 8 $>/dev/null
