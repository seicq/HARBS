[ -f "$HOME/harbs/static/funcrc" ] && source "$HOME/harbs/static/funcrc"

git clone https://github.com/seicq/boiled-rice

mirrors
install_yay
install_base
mk_dirs
cp_files
install_wm
install_zsh
install_brillo
