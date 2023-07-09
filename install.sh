[ -f "$HOME/harbs/static/funcrc" ] && source "$HOME/harbs/static/funcrc"

git clone https://github.com/seicq/boiled-rice $HOME/boiled-rice

reap -p "Do you use artix ? (Y/n)" choice
case $choice in
	Y)
		artix;;
	n)
		echo " "
esac

mirrors
install_yay
install_base
mk_dirs
cp_files
install_wm
install_zsh
install_brillo
graphic_driver
srvces
clean_up
