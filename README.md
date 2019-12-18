[source](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)

create a .dotfiles folder, which we'll use to track your dotfiles

`git init --bare $HOME/.dotfiles`

create an alias `dotfiles` so you don't need to type it all over again

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

set git status to hide untracked files

`dotfiles config --local status.showUntrackedFiles no`

add the alias to .bashrc (or .zshrc) so you can use it later

`echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash_aliases`

# Usage

Now you can use regular git commands such as:

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

Nice, right? Now if you're moving to a virgin system…

# Setup environment in a new computer

Clone repository
```
git clone --bare git@github.com:Ledarium/newdotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```
