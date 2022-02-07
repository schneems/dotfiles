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
echo "source ~/bin/dotfiles/bashrc" >> ~/.zshrc
echo "source ~/bin/dotfiles/vim/.vimrc" > ~/.vimrc

source ~/bin/dotfiles/bashrc
```

- Set up iterm to use saved preferences from folder (Preferences -> General -> preferences point to dotfiles/config/iterm folder)
- Setup caps lock to ctrl+escape - https://github.com/jasonrudolph/ControlEscape.spoon
- Login 1password
- Login dropbox && install fonts

```
source osx/hacks
source settings/sync.sh
```

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## Extras

- System preferences search "'default web browser"
- `ruby-install ruby` versions
- gitx https://rowanj.github.io/gitx/
- Setup github [via token](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git)
- Setup [ssh key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Setup [GPG key](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)


