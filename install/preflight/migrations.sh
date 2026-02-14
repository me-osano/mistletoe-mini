MISTLETOE_MIGRATIONS_STATE_PATH=~/.local/state/mistletoe/migrations
mkdir -p $MISTLETOE_MIGRATIONS_STATE_PATH

for file in ~/.local/share/mistletoe/migrations/*.sh; do
  touch "$MISTLETOE_MIGRATIONS_STATE_PATH/$(basename "$file")"
done