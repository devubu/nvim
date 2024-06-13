<h1 align="center">Custom NvChad</h1>

## Installation
--------------------
    
    sudo apt update -y

    sudo apt upgrade -y

    sudo apt install -y kali-linux-everything

    sudo apt install -y xclip

    sudo apt install -y ripgrep
    
    sudo apt install -y fzf

    sudo apt install -y alacritty
    
    sudo apt install -y nodejs
    
    sudo apt install -y npm

    sudo apt install -y python3.11-venv
    
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    
    source "$HOME/.cargo/env"

    git clone https://github.com/devubu/tmux.git ~/.config/tmux
    
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
    
    ~/.tmux/plugins/tpm/bin/install_plugins

    git clone https://github.com/devubu/alacritty.git ~/.config/alacritty
    
    curl -o ~/Downloads/FiraCode.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip

    unzip -q ~/Downloads/FiraCode.zip -d ~/Downloads/FiraCode -x "LICENSE" "readme.md" && rm ~/Downloads/FiraCode.zip

    sudo chown -R root:root ~/Downloads/FiraCode
    
    sudo mv ~/Downloads/FiraCode /usr/share/fonts/truetype

    fc-cache -f -v

    curl -o ~/Downloads/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage
    
    sudo chown root:root ~/Downloads/nvim.appimage
    
    sudo chmod +x ~/Downloads/nvim.appimage
    
    sudo mv ~/Downloads/nvim.appimage /usr/bin/nvim

    echo "" >> ~/.zshrc

    echo "alias vim='nvim'" >> ~/.zshrc
    
    echo "" >> ~/.zshrc

    echo "aWYgW1sgIjokUEFUSDoiICE9ICoiOiRIT01FLy5ucG0tZ2xvYmFsL2JpbjoiKiBdXTsgdGhlbgogICBleHBvcnQgUEFUSD0iJEhPTUUvLm5wbS1nbG9iYWwvYmluOiRQQVRIIgpmaQoKaWYgW1sgIjokUEFUSDoiICE9ICoiOiRIT01FLy5jYXJnby9iaW46IiogXV07IHRoZW4KICAgZXhwb3J0IFBBVEg9IiRIT01FLy5jYXJnby9iaW46JFBBVEgiCmZpCgppZiBbIC16ICIkR09QQVRIIiBdOyB0aGVuCiAgIGV4cG9ydCBHT1BBVEg9IiRIT01FL2dvIgpmaQoKaWYgW1sgIjokUEFUSDoiICE9ICoiOiRHT1BBVEgvYmluOiIqIF1dOyB0aGVuCiAgIGV4cG9ydCBQQVRIPSIkUEFUSDokR09QQVRIL2JpbiIKZmkKCmlmIFtbICI6JFBBVEg6IiAhPSAqIjokSE9NRS8ubG9jYWwvYmluOiIqIF1dOyB0aGVuCiAgIGV4cG9ydCBQQVRIPSIkSE9NRS8ubG9jYWwvYmluOiRQQVRIIgpmaQo=" | base64 -d >> ~/.zshrc
    
    source ~/.zshrc
    
    git clone https://github.com/devubu/nvim.git ~/.config/nvim

    nvim --headless "+q"

## Showcase

<img src="https://nvchad.com/features/nvdash.webp">
<img src="https://nvchad.com/banner.webp">

<img src="https://nvchad.com/screenshots/onedark.webp">
<img src="https://nvchad.com/screenshots/rxyhn1.webp">

## What is it?

- NvChad is a neovim config written in lua aiming to provide a base configuration with very beautiful UI and blazing fast startuptime (around 0.02 secs ~ 0.07 secs). We tweak UI plugins such as telescope, nvim-tree etc well to provide an aesthetic UI experience. 

- Lazy loading is done 93% of the time meaning that plugins will not be loaded by default, they will be loaded only when required also at specific commands, events etc. This lowers the startuptime and it was like 0.07~ secs tested on an old pentium machine 1.4ghz + 4gb ram & HDD.

- NvChad is supposed to be used with its [starter config](https://github.com/nvchad/starter), so nvchad main repo ( this repo ) can be imported as a plugin via lazy's import feature and then you can easily use this repo's modules like autocmds etc.

## Theme Showcase

<details><summary> <b>Images (Click to expand!)</b></summary>

![4 themes](https://nvchad.com/screenshots/four_Themes.webp)
![radium 1](https://nvchad.com/screenshots/radium1.webp)
![radium 2](https://nvchad.com/screenshots/radium2.webp)
![radium 3](https://nvchad.com/screenshots/radium3.webp)


(Note: these are just 4-5 themes, NvChad has around 56 themes)
</details>

## UI related plugins used

<details><summary> <b>Images (Click to expand!)</b></summary>

<h3> Nvim-tree.lua </h3>

Fast file tree:

<kbd><img src="https://nvchad.com/features/nvimtree.webp"></kbd>

<h3> Telescope-nvim </h3>

A fuzzy file finder, picker, sorter, previewer and much more:

<kbd><img src="https://nvchad.com/features/telescope.webp"></kbd>

<h3> Our own statusline written from scratch  </h3>

[NvChad UI](https://github.com/NvChad/ui)

<kbd><img src="https://nvchad.com/features/statuslines.webp"></kbd>

<h3> Tabufline (our own pertab bufferline) </h3>

<kbd><img src="https://nvchad.com/features/tabufline.webp"></kbd>
- Here's a [video](https://www.youtube.com/watch?v=V_9iJ96U_k8&ab_channel=siduck) that showcases it.

<h3> NvCheatsheet ( our UI Plugin ) </h3>
<kbd> <img src="https://nvchad.com/features/nvcheatsheet.webp"/></kbd>

</details>

## Plugins list

- Many beautiful themes, theme toggler by our [base46 plugin](https://github.com/NvChad/base46)
- Lightweight & performant ui plugin with [NvChad UI](https://github.com/NvChad/ui) It provides statusline modules, tabufline ( tabs + buffer manager) , beautiful cheatsheets, NvChad updater, hide & unhide terminal buffers, theme switcher and much more!
- File navigation with [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- Beautiful and configurable icons with [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- Git diffs and more with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) 
- NeoVim Lsp configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason.nvim](https://github.com/williamboman/mason.nvim)
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- File searching, previewing text files and more with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Autoclosing braces and html tags with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Indentlines with [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- Useful snippets with [friendly snippets](https://github.com/rafamadriz/friendly-snippets) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
- Popup mappings keysheet [whichkey.nvim](https://github.com/folke/which-key.nvim)
- Navigate seamlessly between nvim and tmux splits using a consistent set of hotkeys [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## Credits

- https://github.com/NvChad/NvChad
- [Elianiva](https://github.com/elianiva) helped me with NeoVim Lua related issues many times, helped me in my initial neovim journey!
- @lorvethe for making the beautiful NvChad logo.

