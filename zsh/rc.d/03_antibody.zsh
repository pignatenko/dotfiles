export ANTIBODY_HOME="$ZDOTDIR/antibody"

function antibody_install() {
  curl -sfL git.io/antibody > "$ZDOTDIR/antibody/antibody_installer.sh"
  chmod +x "$ZDOTDIR/antibody/antibody_installer.sh"
  "$ZDOTDIR/antibody/antibody_installer.sh" -b "$ZDOTDIR/bin/"
}

function antibody_bundle_all() {
  for MANIFEST in $ZDOTDIR/manifests/*.manifest; do
    BUNDLE="$ZDOTDIR/bundles/${MANIFEST:t:r}.bundle.zsh"
    antibody bundle < "$MANIFEST" > "$BUNDLE"
  done
}

