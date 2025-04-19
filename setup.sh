# ensure installed apt
sudo apt install bat btop clang eza fastfetch fzf golang-go neovim python3 python3-debugpy python3-debugpy tmux zsh

# clone zsh plugins
git clone https://github.com/joshskidmore/zsh-fzf-history-search.git
git clone https://github.com/Aloxaf/fzf-tab.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# move zsh plugins
sudo mkdir /usr/share/zsh/plugins/

sudo mv ./zsh-fzf-history-search ./fzf-tab ./zsh-autosuggestions ./zsh-syntax-highlighting /usr/share/zsh/plugins/

# move config files
cp ./zshrc ~/.zshrc
cp ./tmux.conf ~/.tmux.conf

cp -r ./config/alacritty ~/.config/alacritty/
cp -r ./config/nvim/ ~/.config/nvim/

cp ./ip.sh ~/.config/ip.sh

# remove zsh plugins
sudo rm -r ./zsh-* ./fzf-tab
