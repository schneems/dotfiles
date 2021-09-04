## Schneems Dotfiles

These are my dotfiles. There are many like them, but these dotfiles are mine.

## Secrets

`bash/.env` is checked in but not tracked, put your secrets there

## Install

You need homebrew installed first [install homebrew](https://brew.sh/).

```
mkdir ~/bin
cd ~/bin
git clone https://github.com/schneems/dotfiles.git
cd ~/bin/dotfiles
brew bundle
```

```
touch ~/.bashrc
echo "source ~/bin/dotfiles/bashrc" >> ~/.bashrc
touch ~/.bash_profile # Link bashrc to bashprofile
cat > ~/.bash_profile << EOF
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF
source ~/bin/dotfiles/bashrc

echo "source ~/bin/dotfiles/vim/.vimrc" > ~/.vimrc
```

```
source osx/hacks
source settings/sync.sh
```

```
vim +PluginInstall +qall
```

## Extras

- System preferences search "'default web browser"
- `ruby-install ruby` versions
- gitx https://rowanj.github.io/gitx/
- Setup github [via token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)


