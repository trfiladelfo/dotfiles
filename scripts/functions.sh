#add a directory to PATH only if it doesn't exist
function pathadd()
{
  if [ -d $1 ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH=$1:$PATH
  fi
}

