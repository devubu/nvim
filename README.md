<h1 align="center">Custom NvChad</h1>

Use Neovim and Tmux with Alacritty on Kali Linux.

## Features

- Custom Neovim configuration

- Custom Tmux configuration

- Custom Alacritty configuration

- Custom .zshrc configuration

## Installation

    git clone https://github.com/devubu/nvim.git ~/.config/nvim

    source ~/.config/nvim/install.sh

## Update

    git -C ~/.config/nvim pull
    
    zsh ~/.config/nvim/update.sh
    
    source ~/.config/nvim/install.sh

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

## Tmux Keybindings

- The prefix key for Tmux is Control + Space for more convenient access.
- 'ctrl + space + shift + |' in=> Bind | to split window horizontally and stay in the current directory
- 'ctrl + space + shift + _' => Bind _ to split window vertically and stay in the current directory
- 'ctrl + h' => Left
- 'ctrl + j' => Down
- 'ctrl + k' => Up
- 'ctrl + l' => Right

## Neovim Keybindings

- The leader key for neovim is Space.
- 'space + ch' or ':NvCheatsheet' to view neovim keybindings
- 'space + fw' to live grep
- 'space + ff' to find files
- 'space + e' to toggle nvimtree
- 'shift + zz' or ':wq' to save and exit
- 'shift + zq' or ':q' to exit without saving
- `h` or Left Arrow (`←`) to move the cursor left one character
- `j` or Down Arrow (`↓`) to move the cursor down one line
- `k` or Up Arrow (`↑`) to move the cursor up one line
- `l` or Right Arrow (`→`) to move the cursor right one character
- '/' to search for text within the current file

## Credits

- https://github.com/NvChad/NvChad
- @lorvethe for making the NvChad logo.
