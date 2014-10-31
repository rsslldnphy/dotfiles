echo ""
echo "************************************"
echo "bootstrap.sh: Bootstrapping dotfiles"
echo "************************************"
echo ""

HOME_DIR=~
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function ensure-link {
  if [ ! -L $HOME_DIR/.$1 ]; then
    echo "Linking .$1"
    ln -s $DOTFILES_DIR/$1 $HOME_DIR/.$1
  fi
}

ensure-link aliases
ensure-link prompt
ensure-link inputrc

ensure-link ackrc

ensure-link gitconfig
ensure-link cvsignore

ensure-link bash
ensure-link bash_profile

ensure-link vim
ensure-link vimrc

ensure-link bin
ensure-link tmux.conf
ensure-link slate


mkdir -p ~/.lein
if [ ! -L $HOME_DIR/.lein/profiles.clj ]; then
  echo "Linking .lein/profiles.clj"
  ln -s $DOTFILES_DIR/lein-profiles.clj $HOME_DIR/.lein/profiles.clj
fi
