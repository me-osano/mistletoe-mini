source $MISTLETOE_INSTALL/preflight/guard.sh
source $MISTLETOE_INSTALL/preflight/begin.sh
run_logged $MISTLETOE_INSTALL/preflight/show-env.sh
run_logged $MISTLETOE_INSTALL/preflight/pacman.sh
run_logged $MISTLETOE_INSTALL/preflight/migrations.sh
run_logged $MISTLETOE_INSTALL/preflight/disable-mkinitcpio.sh