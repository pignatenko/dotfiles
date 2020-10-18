lazyload rbenv ruby rails rake bundle gem bundler -- "__lazy_load_ruby"

__lazy_load_ruby() {
  eval "$(command rbenv init -)"
  compinit
  disable_alias
  source "$ZDOTDIR/bundles/ruby.bundle.zsh";
  enable_alias
}

__load_ruby() {
  if [ -f Gemfile ] || [ -f Rakefile ] || [ -f config.ru ] || [ -f .ruby-version ]; then
    __lazy_load_ruby &> /dev/null
    chpwd_functions=(${chpwd_functions#__load_ruby})
  fi
}

chpwd_functions+=__load_ruby
