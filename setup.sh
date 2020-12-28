set -e

SETUP_DIR="$HOME" # Directory on which the setup will be run.
echo "Running on:" $SETUP_DIR

# TODO: Check if linking directory works
echo "Setting up Zsh..."
cp -r zsh/.my.zsh $SETUP_DIR
cp -r zsh/.zshrc $SETUP_DIR
echo "ZSH Done :)"

echo "Setting up NVIM..."
mkdir -p $SETUP_DIR/.config/nvim
cp -r nvim/init.vim $SETUP_DIR/.config/nvim
cp -r nvim/coc-settings.json $SETUP_DIR/.config/nvim
ln -s .config/nvim/init.vim $SETUP_DIR/.vimrc
echo "NVIM Done :)"

echo "Setting up Tmux..."
cp -r tmux/.tmux.conf $SETUP_DIR
echo "Tmux Done :)"

echo "Setting up Alacritty..."
mkdir -p $SETUP_DIR/.config/alacritty
cp -r alacritty/alacritty.yml $SETUP_DIR/.config/alacritty
echo "Alacritty Done :)"

echo "Setting up Kitty..."
mkdir -p $SETUP_DIR/.config/kitty
cp -r kitty/kitty.conf $SETUP_DIR/.config/kitty
echo "Kitty Done :)"
