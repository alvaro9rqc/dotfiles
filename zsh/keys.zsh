# Bind navigation keys from the active terminal's terminfo. Foot uses SS3
# sequences while tmux-256color uses CSI sequences, so fixed bindings cannot
# correctly cover both environments.
zmodload zsh/terminfo

for keymap in emacs viins vicmd; do
  [[ -n "${terminfo[khome]}" ]] && bindkey -M "$keymap" -- "${terminfo[khome]}" beginning-of-line
  [[ -n "${terminfo[kend]}" ]] && bindkey -M "$keymap" -- "${terminfo[kend]}" end-of-line
done

unset keymap
