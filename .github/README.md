# dotfiles for nottelbox
This repo contains the dotfiles in my linux machine's $HOME.
I make use of a bare git repository to prevent interferences with other repos in $HOME.
Only config files are committed.

# How to use this repo?
For managing this repo in my $HOME I use the this alias (from .zshrc):
`config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"`
This alias can be used instead of the git command to commit files, for example:
```
config status
config add .vimrc
config commit -m "Add vimrc"
config push
```

# How to use this repo on a new system?

1. clone this repo into a bare repository in a hiddne folder of your $HOME
`git clone --bare git@github.com:nottelbox/dotfiles.git $HOME/.cfg`
2. define the alias in current session
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
3. checkout dotfiles from remote to local repository in your $HOME
`config checkout`
This might fail if some dotfiles already exist. Either delete them or move them to a backup folder:
`config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}`
4. Set flag `showUntrackedFiles` to `no` to get a clean output for `config status`
`config config --local status.showUntrackedFiles no`
5. Add new files or change files with the `config` alias
