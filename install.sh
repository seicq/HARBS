#!/bin/sh

# Functions ~
install_brillo(){
	git clone https://github.com/CameronNemo/brillo.git $HOME/brillo
	cd $HOME/brillo
	make
	sudo make install.setgid
	sudo rm -rf $HOME/brillo
}

install_zsh(){
	sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

# Variables ~
cdr="$HOME/.config"
hc="$HOME/harbs/config"
hm="$HOME/harbs/misc"
usname=$(whoami)

# Installing Packages ~
file="$hm/prog.csv"
for i in $(awk -F',' '{print $2}' "$file")
do
    sudo pacman -S "$i"
done

# Welcome ~
neofetch
echo "Installation Will Start Now"
sleep 3s

# Making Directories ~
mkdir -p $HOME/pix/wall 

# Copying Files ~
cp -r $hc/suckless $cdr/
cp -r $hc/sxhkd $cdr/
cp $hm/wall.png $HOME/pix/wall/

# Creating Color Themes
wal -i $HOME/pix/wall/wall.png
sed -i 'N;$!P;D' $HOME/.cache/wal/colors-wal-dwm.h

# Changing Username in Config Files ~
progc=("dwm" "st" "dmenu")
for i in "${progc[@]}"
do
	sed -i "s/\username/$usname/" $HOME/.config/suckless/$i/config.def.h
done

# Installing Suckless Utilities ~
progi=("dwm" "st" "dmenu" "slstatus" "slock")
for i in "${progi[@]}"
do
	cd $cdr/suckless/$i && sudo cp config.def.h config.h && sudo make install
done

install_brillo
install_zsh
