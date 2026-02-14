# Ensure git settings live under ~/.config
mkdir -p ~/.config/git
touch ~/.config/git/config

# Set identification from install inputs
if [[ -n "${MISTLETOE_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$MISTLETOE_USER_NAME"
fi

if [[ -n "${MISTLETOE_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$MISTLETOE_USER_EMAIL"
fi