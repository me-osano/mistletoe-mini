# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/mistletoe/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$MISTLETOE_USER_NAME"
<Multi_key> <space> <e> : "$MISTLETOE_USER_EMAIL"
EOF
