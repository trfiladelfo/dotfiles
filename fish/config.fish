# Path to your oh-my-fish.
set fish_path $HOME/.dotfiles/fish

# Theme
set fish_theme tomorrow-night

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump git

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish cofiguration.
. $fish_path/fish.fish

set -x DOTFILES $HOME/.dotfiles
bash $DOTFILES/scripts/init.sh
