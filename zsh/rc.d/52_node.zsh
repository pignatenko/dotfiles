lazyload v vim nvim fnm npm node yarn ng -- "__lazy_load_node"

__lazy_load_node() {
  eval "$(fnm env --multi)"
  rehash
  disable_alias
  source "$ZDOTDIR/bundles/node.bundle.zsh"
  enable_alias
}

__load_node() {
  if [ -f package.json ] || [ -f .nvmrc ] || [ -f angular.json ] || [ -f tsconfig.json ] || [ -f .node-version ]; then
    node --version &> /dev/null
    chpwd_functions=(${chpwd_functions#__load_node})
  fi
}

chpwd_functions+=__load_node

__run_fnm_use() {
  if [ -f .nvmrc ] || [ -f .node-version ]; then
    fnm use
  fi
}

chpwd_functions+=__run_fnm_use
