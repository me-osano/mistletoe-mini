# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(MISTLETOE_CHROOT_INSTALL|MISTLETOE_ONLINE_INSTALL|MISTLETOE_USER_NAME|MISTLETOE_USER_EMAIL|USER|HOME|MISTLETOE_REPO|MISTLETOE_REF|MISTLETOE_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
