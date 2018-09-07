set -gx PATH ~/.bin $PATH

source ~/.config/fish/aliases.fish
source ~/.config/fish/ssh-agent.fish

status --is-interactive; and source (rbenv init -|psub)
