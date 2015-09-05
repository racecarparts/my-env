# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend 

# Make some possibly destructive commands more interactive.
#alias rm='rm -i'
#alias rmf='rm'
alias mv='mv -i'
alias cp='cp -i'

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ll='ls -aGop'
alias ls='ls -F'

alias android-debug='adb forward tcp:9222 localabstract:chrome_devtools_remote'

alias currentConnections='lsof -i | grep -E "(LISTEN|ESTABLISHED)"'

# a default Maven build command
alias mvn_clean_install='mvn clean install -Pinstall-all'
alias mvn_clean_install_no_test='mvn clean install -Pinstall-all -Dmaven.test.skip=true'
alias mvn_clean_install_no_test_offline='mvn -o clean install -Pinstall-all -Dmaven.test.skip=true'

alias mvn_clean_install_4503='mvn clean install -Pinstall-all -Dsling.port=4503'
alias mvn_clean_install_4503_no_test='mvn clean install -Pinstall-all -Dsling.port=4503 -Dmaven.test.skip=true'
alias mvn_clean_install_4503_no_test_offline='mvn -o clean install -Pinstall-all -Dsling.port=4503 -Dmaven.test.skip=true'

# PostgreSQL psql command line tool for localhost
alias psql='/Applications/Postgres.app/Contents/Versions/9.3/bin/psql -h localhost'

#### Activator / Play Framework ####
alias play='activator "run 9001"'
