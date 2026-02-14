sudo mkdir -p /etc/systemd/system/getty@tty1.service.d

if [ ! -f /etc/systemd/system/getty@tty1.service.d/autologin.conf ]; then
  cat <<EOF | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --skip-login --nonewline --noissue --noclear %I $TERM
StandardOutput=null
StandardError=null
TTYVTDisallocate=no
EOF
fi

sudo systemctl daemon-reload
