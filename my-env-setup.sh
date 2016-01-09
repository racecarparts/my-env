#!/bin/bash

CASK_APP_LIST="macdown atom alfred iterm2 google-chrome intellij-idea-ce"
BREW_APP_LIST="colordiff tree homebrew/versions/maven31 gradle"
JAVA_VERSIONS="java java7"

# create symlinks for system settings
echo
echo "* App installations.  This will take a little while."
echo "*   Installing Homebrew..."
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "*   Installing Homebrew Cask..."
     brew install caskroom/cask/brew-cask
echo "*   Setting up the previous version caskroom"
     brew tap caskroom/versions
echo "*   Installing terminal apps via brew."
     brew install $BREW_APP_LIST
echo "*   Now we'll install some binary apps: $CASK_APP_LIST"
     #brew cask install --force --appdir=/Applications $CASK_APP_LIST
     brew cask install --appdir=/Applications $CASK_APP_LIST
echo "*   Installing Java: $JAVA_VERSIONS"
     #brew cask install --force $JAVA_VERSIONS
     brew cask install $JAVA_VERSIONS
echo "*   Done."

echo
echo "Symlink Setup"
echo "  Create symlink bash_profile."
     rm -f ~/.bash_profile; ln -s ~/my-env/bash_profile.sh ~/.bash_profile
echo "  Create symlink .gitconfig."
     rm -f ~/.gitconfig; ln -s ~/my-env/conf/git/gitconfig ~/.gitconfig
echo "  Create symlink ssh config."
    rm -f ~/.ssh/config; ln -s ~/my-env/conf/ssh/config ~/.ssh/config
echo "  Create maven repo symlink."
    rm -Rf ~/.m2; ln -s ~/my-env/conf/m2 ~/.m2
echo "  Create Intellij IDEA 'idea.vmoptions' symlink."
    rm -f ~/Library/Preferences/IntelliJIdea13/idea.vmoptions
    ln -s ~/my-env/conf/intellij-idea-14-ce/idea64.vmoptions ~/Library/Preferences/IdeaIC14/idea64.vmoptions;
echo "  Done."

echo
echo "Alfred 2 Setup"
echo "  Quitting Alfred 2 ..."
echo "  rsync Alfred 2 prefs ..."
    #Alfred 2 prefs cannot be symlinks
    osascript -e 'quit app "Alfred 2"'
    mkdir -p ~/my-env/conf/alfred2/Alfred\ 2
    rsync -r ~/Library/Application\ Support/Alfred\ 2/ ~/my-env/conf/alfred2/Alfred\ 2
    rm -Rf ~/Library/Application\ Support/Alfred\ 2;
    cp -R ~/my-env/conf/alfred2/Alfred\ 2 ~/Library/Application\ Support/Alfred\ 2;
echo "  Starting Alfred 2 ..."
    open -a /Applications/Alfred\ 2.app/Contents/MacOS/Alfred\ 2
echo "  Done."

echo
echo "Sourcing '~/.bash_profile'"
    source ~/.bash_profile
echo "  Done."

echo
echo "Install Fonts"
# Add the custom fonts
    install_fonts ~/my-env/opt/fonts
echo "  Done."

echo
echo
echo "Setup complete. yay."
echo
