if silent command -v go; then
  export PATH="$(go env GOPATH)/bin:$PATH"
fi
