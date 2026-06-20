if status is-interactive
end
fastfetch
fish_vi_key_bindings
set -g -x fish_greeting ''

set -Ux FZF_OPEN_COMMAND "command find -L \$dir -mindepth 1 \
  \\( -path \$dir'*/.git/*' -o -path \$dir'*/.cache/*' -o -path \$dir'*/.local/share/Trash/*' \
     -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
  -o -type f -print -o -type d -print -o -type l -print 2> /dev/null | sed 's@^\./@@'"

abbr -a -g gst git status
abbr -a -g gco git checkout
abbr -a -g gadd git add --all
abbr -a -g gcm git commit -a -m $1

set -x LD_LIBRARY_PATH ~/.local/lib64 $LD_LIBRARY_PATH
set -gx STOCK_BL_IVW_PUBKEY_PEM /mnt/devshare/keys/ivwatch/public.pem
set -gx STOCK_BL_KEYPAIR_PEM /mnt/devshare/keys/ivwatch/private.pem

##--Uncomment if you have bash_aliases file --##
#source ~/.config/fish/.bash_aliases


