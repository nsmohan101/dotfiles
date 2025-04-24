if status is-interactive
end
neofetch
fish_vi_key_bindings
set -g -x fish_greeting ''

abbr -a -g gst git status
abbr -a -g gco git checkout
abbr -a -g gadd git add --all
abbr -a -g gcm git commit -a -m $1

source ~/.config/fish/.bash_aliases


