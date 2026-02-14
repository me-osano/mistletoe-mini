# Setup default projects directory (and tries)
mkdir -p "$HOME/Projects"
mkdir -p "$HOME/Projects/tries"

# Add ./bin to path for all items in ~/Projects
cat >"$HOME/Projects/.mise.toml" <<'EOF'
[env]
_.path = "{{ cwd }}/bin"
EOF

mise trust ~/Projects/.mise.toml

if [[ -n "${MISTLETOE_CHROOT_INSTALL:-}" ]]; then
  NODE_TARBALL=$(find /opt/packages -name "node-v*-linux-x64.tar.gz" -type f 2>/dev/null | head -n1)

  NODE_VERSION=$(basename "$NODE_TARBALL" | sed 's/node-v\(.*\)-linux-x64.tar.gz/\1/')
  NODE_INSTALL_DIR="$HOME/.local/share/mise/installs/node/$NODE_VERSION"

  mkdir -p "$NODE_INSTALL_DIR"
  tar -xzf "$NODE_TARBALL" \
      --strip-components=1 \
      -C "$NODE_INSTALL_DIR"

  mise use -g node@"$NODE_VERSION"
else
  mise use -g node@latest
fi