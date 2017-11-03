## Schneems Dotfiles

Warning, these are not 1337 dotfiles. They are optimized for a work environment that features frequent tutorials for beginners. The idea is to be close to stock so beginners won't be left in the dust while being productive.

## Secrets

`bash/.env` is checked in but not tracked, put your secrets there


## Install

You need homebrew, git, and chruby installed first

```
mkdir ~/bin
cd ~/bin
git clone https://github.com/schneems/dotfiles.git
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

- Install [command line tools](http://stackoverflow.com/questions/9329243/xcode-4-4-and-later-install-command-line-tools)

```
xcode-select --install
```

- Install Setup script: (https://github.com/thoughtbot/laptop)
- `brew install chruby ruby-install git bash-completion`
- `ruby-install ruby`
- Dotfiles: see install (https://github.com/schneems/dotfiles)
- Increase repeat rate on keyboard
- Change dock to auto hide
- set up dropbox
- set up 1password
- download [sublime]()
- download [chrome]()
- Heroku [Toolbelt](https://toolbelt.heroku.com)
- generate RSA key []()
- add RSA key to github
- hipchat
- iterm2
- mvim
- gitx https://rowanj.github.io/gitx/ 
- copy .gitconfig https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
- install janus: https://github.com/carlhuda/janus


