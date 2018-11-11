set -gx PATH ~/.bin $PATH
set -gx CDPATH ~ ~/Code .

source ~/.config/fish/aliases.fish
source ~/.config/fish/ssh-agent.fish

status --is-interactive; and source (rbenv init -|psub)
