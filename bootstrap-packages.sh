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
brew install git hub
brew install tree
brew install tmux
brew install drip                       # for faster jvm startup
brew install reattach-to-user-namespace # for vim clipboard in tmux
brew install the_silver_searcher

# languages
brew install leiningen
brew install ghc cabal-install
brew install erlang
brew install elixir
brew install rbenv ruby-build
brew install python
brew install nodejs npm # why??
brew install scala sbt
brew install boost valgrind cmake

brew tap homebrew/science
brew install r

# datastores
brew install postgresql

# editors
brew install macvim --override-system-vim
brew install emacs cask

# pointless
brew install sl cowsay

# cask stuff
brew install caskroom/cask/brew-cask
brew cask alfred link
brew cask install google-chrome
brew cask install pgadmin3
