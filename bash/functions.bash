function java_version {
  echo `java -version`;
}

function java_set {
  if [[ $1 == "6" ]]
    then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.6`;
    echo "Setting Java to version 6..."
    echo "$JAVA_HOME"
  elif [[ $1 == "7" ]]
    then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`;
    echo "Setting Java to version 7..."
    echo "$JAVA_HOME"
  elif [[ $1 == "8" ]]
    then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`;
    echo "Setting Java to version 8..."
    echo "$JAVA_HOME"
  fi
}

function install_fonts {
  # Set source and target directories
  my_env_fonts_dir=$( cd "$( dirname "$0" )" && pwd )
  find_fonts_command="find -L \"$my_env_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

  if [[ `uname` == 'Darwin' ]]; then
    font_dir="$HOME/Library/Fonts/my-env"
    rm -Rf $font_dir
    mkdir $font_dir
  fi

  # Copy all fonts to user fonts directory
  eval $find_fonts_command | xargs -0 -I % cp "%" "$font_dir/"

  echo "  All fonts installed to $font_dir"
}

# moves up one directory ... if `cd ../` is just too much to type.
up() {
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
    do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

array_contains () {
    local array="$1[@]"
    local seeking=$2
    local in=false
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=true
            break
        fi
    done
    echo $in
}

copy(){ cp -v "$1" "$2"&watch -n 1 'du -h "$1" "$2";printf "%s%%\n" $(echo `du -h "$2"|cut -dG -f1`/0.`du -h "$1"|cut -dG -f1`|bc)';}

function get_current_wifi_device() {
  CURRENT_DEVICE=$(networksetup -listallhardwareports | awk '$3=="Wi-Fi" {getline; print $2}')
  echo "Current Wi-Fi Device = '$CURRENT_DEVICE'"
}

function wifi_on() {
  CURRENT_DEVICE=$(networksetup -listallhardwareports | awk '$3=="Wi-Fi" {getline; print $2}')
  networksetup -setairportpower $CURRENT_DEVICE on
  echo "Wi-Fi Device = '$CURRENT_DEVICE' on"
}

function wifi_off() {
  CURRENT_DEVICE=$(networksetup -listallhardwareports | awk '$3=="Wi-Fi" {getline; print $2}')
  networksetup -setairportpower $CURRENT_DEVICE off
  echo "Wi-Fi Device = '$CURRENT_DEVICE' off"
}

function showAllFiles() {
  defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app
}

function hideFiles() {
  defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app
}

function setComputerName() {
  sudo scutil --set ComputerName $1;
  sudo scutil --set LocalHostName $1;
  sudo scutil --set HostName $1;
}
