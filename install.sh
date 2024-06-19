#!/bin/zsh

# Update and upgrade
sudo apt update -y
sudo apt full-upgrade -y

# Install every metapackage
sudo apt install -y kali-linux-everything

# Install packages
sudo apt install -y xclip
sudo apt install -y ripgrep
sudo apt install -y fzf
sudo apt install -y bat
sudo apt install -y alacritty
sudo apt install -y nodejs
sudo apt install -y npm
sudo apt install -y python3.11-venv

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install Tmux configuration
git clone https://github.com/devubu/tmux.git ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Install Alacritty configuration
git clone https://github.com/devubu/alacritty.git ~/.config/alacritty

# Download and install FiraCode Nerd Font
curl -o ~/Downloads/FiraCode.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
unzip -q ~/Downloads/FiraCode.zip -d ~/Downloads/FiraCode -x "LICENSE" "readme.md" && rm ~/Downloads/FiraCode.zip
sudo chown -R root:root ~/Downloads/FiraCode
sudo mv ~/Downloads/FiraCode /usr/share/fonts/truetype
fc-cache -f -v

# Download and install Neovim
curl -o ~/Downloads/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage
sudo chown root:root ~/Downloads/nvim.appimage
sudo chmod +x ~/Downloads/nvim.appimage
sudo mv ~/Downloads/nvim.appimage /usr/bin/nvim

# Update .zshrc with aliases and environment variables
alias_lines=(
  "alias vim='nvim'"
  "alias bat='batcat'"
  "alias cbat='batcat --paging=never'"
  "alias claer='clear'"
  "alias celar='clear'"
  "alias clera='clear'"
  "alias caler='clear'"
  "alias clare='clear'"
  "alias caelr='clear'"
  "alias cealr='clear'"
  "alias celra='clear'"
  "alias copy='xclip -sel clip'"
  "alias paste='xclip -o -sel clip'"
)

path_blocks=(
  'if [[ ":$PATH:" != *":$HOME/.npm-global/bin:"* ]]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi'
  'if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi'
  'if [ -z "$GOPATH" ]; then
    export GOPATH="$HOME/go"
fi'
  'if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
    export PATH="$PATH:$GOPATH/bin"
fi'
  'if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi'
)

# To ensure the last line of ~/.zshrc is empty
ensure_last_line_empty() {
  if [ -n "$(tail -n 1 ~/.zshrc)" ]; then
    echo "" >> ~/.zshrc
  fi
}

ensure_last_line_empty

# Iterate over each alias line and check if it exists in ~/.zshrc
for alias_line in "${alias_lines[@]}"; do
  if ! grep -q "^$alias_line" ~/.zshrc; then
    # If not, append the alias line to ~/.zshrc
    echo "$alias_line" >> ~/.zshrc
    # echo "Alias added to ~/.zshrc: $alias_line"
  # else
    # echo "Alias already exists in ~/.zshrc: $alias_line"
  fi
done

# Iterate over each PATH export block and check if it exists in ~/.zshrc
for path_block in "${path_blocks[@]}"; do
  if ! grep -qF "$path_block" ~/.zshrc; then
    ensure_last_line_empty
    # If not, append the PATH export block to ~/.zshrc
    echo "$path_block" >> ~/.zshrc
    # echo "PATH export block added to ~/.zshrc"
  # else
    # echo "PATH export block already exists in ~/.zshrc"
  fi
done

# Source the updated .zshrc
source ~/.zshrc

# Download Neovim configuration
git clone https://github.com/devubu/nvim.git ~/.config/nvim

# Start Neovim headless to initialize plugins
nvim --headless "+q"
