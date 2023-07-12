# Source the funcrc

[ -f "$HOME/harbs/static/funcrc" ] && source "$HOME/harbs/static/funcrc"

# Functions must be run in this order

mirrors
install_yay
install_base
mk_dirs
install_wm
install_zsh
install_brillo
graphic_driver
clean_up
