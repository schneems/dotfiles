# ## Sublime text
# cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# rm -r User
# ln -s ~/Dropbox/Sublime/User

# Make folder structure
mkdir -p ~/Documents/projects/work

## Iterm2
ln -s "~/Dropbox/shared_settings/iterm2/com.googlecode.iterm2.plist" ~/Library/Preferences/com.googlecode.iterm2.plist

## Project folder
# echo "Set up project folder"
# ln -s ~/Dropbox/projects ~/Documents/projects

## Git Aliases
git config --global alias.co checkout
git config --global alias.p push
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.pushf "push --force-with-lease"
git config --global alias.rrh "remote remove heroku"
git config --global alias.a "add -p"
git config --global alias.ro "pull --rebase origin main"
git config --global alias.ru "pull --rebase upstream main"
git config --global alias.cam "commit —amend —reuse-message=@"
git config --global alias.git '!git' # allow `git git status`

git config --global push.default current
git config --global credential.helper osxkeychain
git config --global commit.cleanup scissors

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
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
# ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ~/bin/code


echo "setting up bundler"
gem install bundler
bundle config --global jobs $(sysctl -n hw.ncpu)

echo "ag ignore"
echo ".git/" >> ~/.agignore
