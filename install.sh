#!/usr/bin/env zsh

# Update and upgrade
sudo apt update -y
sudo apt full-upgrade -y

# Install every metapackage
sudo apt install -y kali-linux-everything

# Install packages
sudo apt install -y xclip
sudo apt install -y fd-find
ln -s /usr/bin/fdfind ~/.local/bin/fd
sudo apt install -y ripgrep
sudo apt install -y fzf
sudo apt install -y bat
ln -s /usr/bin/batcat ~/.local/bin/bat
sudo apt install -y alacritty
sudo apt install -y npm


# Install Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# source "$HOME/.cargo/env"
sudo apt install -y rustc

# Install Tmux configuration
git clone https://github.com/devubu/tmux.git ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Install Alacritty configuration
git clone https://github.com/devubu/alacritty.git ~/.config/alacritty

# Download and install FiraCode Nerd Font
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip"
FONT_DIR=~/Downloads/FiraCode
FONT_ZIP=~/Downloads/FiraCode.zip
FONT_INSTALL_DIR=/usr/share/fonts/truetype/FiraCode

install_font() {
    curl -o "$FONT_ZIP" -L "$FONT_URL"
    unzip -q "$FONT_ZIP" -d "$FONT_DIR" -x "LICENSE" "readme.md"
    rm "$FONT_ZIP"
    sudo chown -R root:root "$FONT_DIR"
    sudo mv "$FONT_DIR" "$FONT_INSTALL_DIR"
    
    # Update the font cache
    fc-cache -f -v
}

# Check if the font is already installed
if [ -d "$FONT_INSTALL_DIR" ]; then
    echo "FiraCode Nerd Font is already installed."
else
    # Ensure necessary directories exist
    mkdir -p "$FONT_DIR"

    # Check if the zip file already exists
    if [ ! -f "$FONT_ZIP" ]; then
        install_font
    else
        echo "Font zip file already downloaded. Skipping download."

        # If the installation directory does not exist, reinstall the font
        if [ ! -d "$FONT_INSTALL_DIR" ]; then
            echo "Font installation appears incomplete. Re-installing..."
            install_font
        else
            echo "FiraCode Nerd Font is already installed."
        fi
    fi
fi

# Download and install Neovim
APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage"
APPIMAGE_PATH=~/Downloads/nvim.appimage
INSTALL_PATH=/usr/bin/nvim
EXPECTED_VERSION="v0.12.0"

get_installed_version() {
    if [ -x "$INSTALL_PATH" ]; then
        "$INSTALL_PATH" --version | head -n 1 | awk '{print $2}'
    else
        echo "not_installed"
    fi
}

install_neovim() {
    curl -o "$APPIMAGE_PATH" -L "$APPIMAGE_URL"
    sudo chown root:root "$APPIMAGE_PATH"
    sudo chmod +x "$APPIMAGE_PATH"
    sudo mv "$APPIMAGE_PATH" "$INSTALL_PATH"
}

installed_version=$(get_installed_version)

# Check if Neovim is already installed and up-to-date
if [ "$installed_version" = "$EXPECTED_VERSION" ]; then
    echo "Neovim $EXPECTED_VERSION is already installed."
else
    # Ensure necessary directories exist
    mkdir -p ~/Downloads

    # Install or update Neovim
    install_neovim
fi

# Update ~/.zshrc with aliases and environment variables
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

ensure_last_line_empty

# Check and append a block if not found
append_block() {
    local block=("$@")
    local block_str=$(printf '%s\n' "${block[@]}")
    local block_found=1

    # Use grep to search for the entire block in ~/.zshrc
    for line in "${block[@]}"; do
        if ! grep -qF -- "$line" ~/.zshrc; then
            block_found=0
            break
        fi
    done

    # If any line of the block is not found, append the block
    if [ "$block_found" -eq 0 ]; then
        ensure_last_line_empty
        printf '%s\n' "${block[@]}" >> ~/.zshrc
        # echo "Block appended to ~/.zshrc"
    # else
        # echo "Block already present in ~/.zshrc"
    fi
}

# Define each block as an array of lines
block1=(
    'if [[ ":$PATH:" != *":$HOME/.npm-global/bin:"* ]]; then'
    '   export PATH="$HOME/.npm-global/bin:$PATH"'
    'fi'
)

block2=(
    'if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then'
    '   export PATH="$HOME/.cargo/bin:$PATH"'
    'fi'
)

block3=(
    'if [ -z "$GOPATH" ]; then'
    '   export GOPATH="$HOME/go"'
    'fi'
)

block4=(
    'if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then'
    '   export PATH="$PATH:$GOPATH/bin"'
    'fi'
)

block5=(
    'if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then'
    '   export PATH="$HOME/.local/bin:$PATH"'
    'fi'
)

# Call the function for each block
append_block "${block1[@]}"
append_block "${block2[@]}"
append_block "${block3[@]}"
append_block "${block4[@]}"
append_block "${block5[@]}"

# Source the updated .zshrc
source ~/.zshrc

# Download Neovim configuration
git clone https://github.com/devubu/nvim.git ~/.config/nvim

# Start Neovim headless to initialize plugins
nvim --headless "+q"
