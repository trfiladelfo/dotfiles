#track current dir
current_dir=$PWD

#load some functions
. $DOTFILES/scripts/functions.sh

#load all scripts in dotfiles/autoload
cd "$DOTFILES/autoload"
for script in `ls`
do
  echo "script: $script"
  if [ -f $script -a -x $script ]
  then
    ./$script
  fi
done

#read the PATH file and load all directories to path
for line in `awk '/^[^#]/ { print $1 }' $DOTFILES/PATH`
do
  line=`eval echo $line`
  if [ -d $line ] && [[ ":$PATH:" != *":$line:"* ]]; then
    export PATH=$PATH:$line
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
cd $HOME
find . -maxdepth 1 -type l -xtype l



#return to dir
cd $current_dir
