echo ""
echo "************************************"
echo "bootstrap.sh: Bootstrapping packages"
echo "************************************"
echo ""

HOME_DIR=~
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! hash brew 2&> /dev/null ]; then
  echo "Homebrew is required"
  exit 1
fi

echo "Installing Homebrew packages" 
echo ""

# utilities
brew install git
brew install hub
brew install ack

# languages
brew install leiningen
brew install ghc
brew install cabal-install
brew install erlang
brew install elixir
brew install rbenv
brew install ruby-build
brew install python

brew tap homebrew/science
brew install r

# datastores
brew install postgresql

# editors
brew install macvim --override-system-vim
brew install emacs
brew install cask

# pointless
brew install sl
brew install cowsay

# cask stuff
brew install caskroom/cask/brew-cask
brew cask alfred link
brew cask install google-chrome

