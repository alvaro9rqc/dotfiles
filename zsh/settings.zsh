typeset -U path PATH

alias vim="nvim"
alias graph='git log --all --graph --decorate --oneline'

# eza listings
alias l='eza --long --icons=auto --group-directories-first'
alias lg='eza --long --icons=auto --group-directories-first --git'
alias ll='eza --long --all --icons=auto --group-directories-first --binary'
alias t='eza --tree --icons=auto --group-directories-first'
alias tg='eza --tree --icons=auto --group-directories-first --git'

# Show only files Git tracks; unlike eza --git-ignore, this also excludes
# untracked files that are not listed in .gitignore.
li() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    print -u2 'li: not inside a Git repository'
    return 1
  }
  git ls-files -- . | awk 'index($0, "/") == 0' |
    eza --stdin --long --icons=auto --group-directories-first
}

ti() {
  local tree_root file

  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    print -u2 'ti: not inside a Git repository'
    return 1
  }

  tree_root=$(mktemp -d) || return 1
  while IFS= read -r -d '' file; do
    mkdir -p -- "$tree_root/${file:h}"
    : > "$tree_root/$file"
  done < <(git ls-files -z)

  (
    cd "$tree_root" || return
    eza --tree --icons=always --group-directories-first .
  )
  command rm -rf -- "$tree_root"
}

op() {
  xdg-open "$@" > /dev/null 2>&1 &
}

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/scripts:/home/alvaro9rqc/.cargo/bin:$PATH"
