## Schneems Dotfiles

Warning, these are not 1337 dotfiles. They are optimized for a work environment that features frequent tutorials for beginners. The idea is to be close to stock so beginners won't be left in the dust while being productive.

## Secrets

`bash/.env` is checked in but not tracked, put your secrets there


## Install

You need homebrew, git, and rbenv installed first

```
cd ~/bin
git clone git@github.com:schneems/dotfiles.git
touch ~/.bashrc
echo "source ~/bin/dotfiles/bashrc" >> ~/.bashrc
```

then:

```sh
# Link bashrc to bashprofile
touch ~/.bash_profile
echo "
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi" >> ~/.bash_profile
```


## New Lappie?

Follow these steps:

- Download Xcode
- Install command line tools
- Setup script: (https://github.com/thoughtbot/laptop)
- Dotfiles: see install (https://github.com/schneems/dotfiles)
- Increase repeat rate on keyboard
- Change dock to auto hide
- set up dropbox
- set up 1password
- download sublime
- download chrome
- generate RSA key
- add RSA key to github
- hipchat
- iterm2
- mvim
- gitx
- copy .gitconfig
- install janus: https://github.com/carlhuda/janus


