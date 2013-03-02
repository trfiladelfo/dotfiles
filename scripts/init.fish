set -g dotfiles $HOME/.dotfiles
set -l current_dir $PWD

#Load all aliases
for f in $dotfiles/aliases/*.fish
  . $f
end

#Load all files in $dotfiles/autoload
for f in $dotfiles/autoload/*.fish
  . $f
end

#read the path file and load all directories to $PATH
for line in (awk '/^[^#]/ { print $1 }' $dotfiles/path)
  set line (eval echo $line) 
  if not contains $line $PATH
    set PATH $line $PATH
  end
end

#link all files in $DOTFILES/symlinks to home
for file in $dotfiles/symlinks/*
  set file (basename $file) 
  if not test -e $HOME/.$file
    cd $HOME
    command ln -s $dotfiles/symlinks/$file .$file
  end
end

#fix broken symlinks
command find $HOME -maxdepth 1 -type l  -xtype l -delete

#return to dir
cd $current_dir
