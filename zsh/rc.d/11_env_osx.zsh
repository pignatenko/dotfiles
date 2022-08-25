if [[ "$OPERATING_SYSTEM" == "Darwin" ]]; then
  # OSX readline
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/readline/lib/pkgconfig"

  # OSX Brew Open SSL
  export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"

  #OSX mysql-client
  export PATH="/usr/local/opt/mysql-client/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
  export CPPFLAGS="-I/usr/local/opt/mysql-client/include"
  export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"

  #OSX mysql
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

  #OSX Core utils - g prefix
  export PATH="/usr/local/opt/coreutils/bin:$PATH"
  export PATH="/usr/local/anaconda3/bin:$PATH"

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
