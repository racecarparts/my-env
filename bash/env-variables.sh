export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Sets CASSANDRA_HOME
export CASSANDRA_HOME=$MY_SANDBOX_FOLDER/cassandra

#### Activator / Play Framework Opts ####
export PATH=$MY_DEVELOPMENT_FOLDER/frameworks/activator:$PATH
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

#### Maven opts for debugging
export MAVEN_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n -Xnoagent -Djava.compiler=NONE -Xmx2048m -Xms2048m -XX:PermSize=1024m -Djava.net.preferIPv4Stack=true";

export RBENV_ROOT="$HOME/.rbenv"
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

# Add rbenv ruby version
export RBENV_VERSION=2.3.0

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec
