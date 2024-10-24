#!/bin/bash

echo This is a setup script

echo Updating fedora to the latest version
sudo dnf update -y

echo Enabling Minimize Buttom - GNOME
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'

echo Downloading and setting up custom font
sudo dnf install curl wget -y
cd ~/Downloads
wget https://github.com/IdreesInc/Monocraft/releases/download/v4.0/Monocraft-nerd-fonts-patched.ttc
sleep 10
mkdir -p ~/.local/share/fonts
mv ~/Downloads/Monocraft-nerd-fonts-patched.ttc ~/.local/share/fonts 
fc-cache -fv

echo Install flatpak apps
sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install com.brave.Browser com.discordapp.Discord com.obsproject.Studio md.obsidian.Obsidian com.github.IsmaelMartinez.teams_for_linux dev.deedles.Trayscale -y

echo Install linux apps
sudo dnf install i3 i3status dmenu i3lock xbacklight feh conky polybar rofi solaar xrandr arandr dunst btop brightnessctl vim -y

echo Creating a custom dpi 120 is default
echo "Xft.dpi: 120" > ~/.Xresources
xrdb "-merge" ~/.Xresources
# exec i3 

echo Improving trackpad experience
sudo cp ~/Linux-Setup/Files/40-libinput.conf /usr/share/X11/xorg.conf.d/

echo Setting up aliases  
cp -f ~/Linux-Setup/Files/.bashrc ~/
cp -f ~/Linux-Setup/Files/.bash_aliases ~/
source ~/.bashrc
#use \cp -f .... if it doesn't work

echo Setting up wallpaper
mkdir ~/Pictures
mkdir -p ~/Pictures/Wallpapers
cp ~/Linux-Setup/Images/Wallpaper.png ~/Pictures/Wallpapers/

echo Setting up rofi
mkdir -p ~/.config/rofi
cp ~/Linux-Setup/Files/config.rasi ~/.config/rofi/

echo Setting up polybar
mkdir -p ~/.config/polybar
cp ~/Linux-Setup/Files/launch.sh ~/.config/polybar/
cp ~/Linux-Setup/Files/config.ini ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh

echo Setting up i3 config
mkdir -p ~/.config/i3/
cp ~/Linux-Setup/Files/i3-config ~/.config/i3/
mv ~/.config/i3/i3-config ~/.config/i3/config

echo Setting up scripts
mkdir ~/.scripts
cd ~/.scripts
echo "xdg-open https://www.youtube.com/watch?v=fMMEM-aGihA" > nerd-radar.sh
echo "xdg-open https://www.youtube.com/watch?v=dQw4w9WgXcQ" > rick-roll.sh
echo '#!/bin/bash' >> startup.sh
echo feh --bg-fill ~/Pictures/Wallpapers/Wallpaper.png >> startup.sh
echo bash ~/.config/polybar/launch.sh >> startup.sh
echo i3-msg restart >> startup.sh
chmod +x nerd-radar.sh rick-roll.sh startup.sh
cd ~

echo Setting up Sway
sudo dnf install sway waybar wdisplays grim slurp
mkdir -p ~/.config/sway ~/.config/waybar
cp ~/Linux-Setup/Files/Sway/config ~/.config/sway/
cp ~/Linux-Setup/Files/Sway/config.jsonc ~/.config/waybar/
cp ~/Linux-Setup/Files/Sway/style.css ~/.config/waybar/

echo ---- Setting Up Obsidian Directories - Personal Setup ----
cd ~
mkdir -p Documents/Obsidian
cd Documents/Obsidian
mkdir General-Vault Improvement-Vault School-Vault Technical-Vault Bible-Vault Trash-Bin
cd ~

echo ---- Setting Up Other Directories ----
cd Pictures
mkdir Wallpapers Icons Folder-Icons Screenshots
mkdir ~/Downloads/Trash
cd ~/Documents
mkdir Trash Important

echo Finished! for more info, reference the docs
echo also you may not know how to use my setup, reference the documentation on how to use
echo Rebooting in 15 seconds. After it reboots, when you go to log in, click the settings icon in the bottom right corner, and click i3. 
sleep 15

echo Rebooting
reboot
