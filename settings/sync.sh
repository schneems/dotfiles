# ## Sublime text
# cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# rm -r User
# ln -s ~/Dropbox/Sublime/User

# Make folder structure
mkdir -p ~/Documents/projects/work

## Project folder

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

# allow `git git status`
git config --global alias.git '!git'

# List branches by date
git config --global alias.branchd "for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"

git config --global push.default current
git config --global credential.helper osxkeychain
git config --global commit.cleanup scissors
git config --global init.defaultBranch main

echo "== Settup git"
echo "git config user.name"
echo -n "> "
read -r user_name
git config --global user.name "$user_name"
echo "Set to: $(git config --global user.name)"
echo ""

echo "git config user.email"
echo -n "> "
read -r user_email
git config --global user.email "$user_email"
echo "Set to: $(git config --global user.email)"
echo ""

echo "git config work email"
echo -n "> "
read -r work_email

if [ -n "$work_email" ]; then
  cat >> ~/.gitconfig << EOF
[includeIf "gitdir:~/Documents/projects/work/"]
  path = ~/.work.gitconfig
EOF

  cat > ~/.work.gitconfig << EOF
[user]
  name = Richard Schneeman
  email = $work_email
EOF
fi

echo "setting up global .gitignore"
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "Obsidian vimrc"
ln -s "$HOME/bin/dotfiles/vim/.obsidian.vimrc" "$HOME/Documents/Obsidian Vault/.obsidian.vimrc"

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
