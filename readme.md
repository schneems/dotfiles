## Schneems Dotfiles

These are my dotfiles. There are many like them, but these dotfiles are mine.

## Secrets

`bash/.env` is checked in but not tracked, put your secrets there

## Install

You need homebrew installed first.

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
echo "
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi" >> ~/.bash_profile
source ~/bin/dotfiles/bashrc
```

```
source osx/hacks
source settings/sync.sh
```

## Extras

- System preferences search "'default web browser"
- Install package control
- `ruby-install ruby` versions
- gitx https://rowanj.github.io/gitx/

- Setup github [via token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)


