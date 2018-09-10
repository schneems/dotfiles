## Sublime text
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Sublime/User

## Iterm2
ln -s "~/Dropbox/shared_settings/iterm2/com.googlecode.iterm2.plist" ~/Library/Preferences/com.googlecode.iterm2.plist

## Git Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

echo "== Settup git"
echo "git config user.name"
echo "> "
read user_name
git config --global user.name "$user_name"
echo "Set to: $(git config --global user.name)"
echo ""

echo "git config user.email"
echo "> "
read user_email
git config --global user.email "$user_email"
echo "Set to: $(git config --global user.email)"
echo ""

echo "setting up heroku"
heroku autocomplete

# Text editors
echo "setting up text editors"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ~/bin/code


