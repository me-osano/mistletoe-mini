# Copy over Mistletoe configs
mkdir -p ~/.config
cp -R ~/.local/share/mistletoe/config/* ~/.config/

# Use default bashrc from Mistletoe
cp ~/.local/share/mistletoe/default/bashrc ~/.bashrc
cp ~/.local/share/mistletoe/default/bash_profile ~/.bash_profile