#track current dir
CURRENT_DIR=$PWD

#load some functions
. $DOTFILES/scripts/functions.sh

#load all scripts in dotfiles/autoload
AUTOLOAD_DIR="$DOTFILES/autoload"

if [ `ls $AUTOLOAD_DIR | wc -l` -gt 0 ]; then
  for script in $autoload_dir/*
  do
    if [ -f $script -a -x $script ]; then
      "$script"
    fi
  done
fi

#read the PATH file and load all directories to path
for line in `awk '/^[^#]/ { print $1 }' $DOTFILES/PATH`
do
  line=`eval echo $line`
  if [ -d $line ] && [[ ":$PATH:" != *":$line:"* ]]; then
    export PATH=$line:$PATH
  fi
done

#link all files in $DOTFILES/symlinks to home
cd "$DOTFILES/symlinks"

for file in `ls -A`
do
if [[ "$file" =~ "^\.\w*" ]]; then
  if [[ ! -e "$HOME/$file" ]]; then
    cd $HOME
    ln -s "$DOTFILES/symlinks/$file" "$file"
  fi
else
  if [[ ! -e "$HOME/.$file" ]]; then
    cd $HOME
    ln -s "$DOTFILES/symlinks/$file" ".$file"
  fi
fi
done

#fix broken symlinks
find $HOME -maxdepth 1 -type l -xtype l -delete



#return to dir
cd $CURRENT_DIR
