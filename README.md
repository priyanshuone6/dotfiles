# dotfiles
The repository contains all my dotfiles

## .bashrc
```bash
source ~/dotfiles/bash/aliases-bash
source ~/dotfiles/bash/bashrc
```
```bash
alias ca='conda activate'
alias jn='jupyter notebook'

format () {
    isort $1
    black $1
    flake8 $1
}
```

## gitconfig
Using symlink
```bash
ln -s ~/dotfiles/git/gitconfig .gitconfig
```
