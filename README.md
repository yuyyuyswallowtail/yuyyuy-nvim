# 💤 Neovim Configuration

A modern, clean, and modular **Neovim configuration** built with Lua and powered by **lazy.nvim** for plugin management.

Designed for productivity, performance, and a smooth development experience 🚀

---

## 📁 Project Structure

```
~/.config/nvim
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins
        ├── bufferline.lua
        ├── formatter-lint-debugger.lua
        ├── icons.lua
        ├── lsp-config.lua
        ├── lualine.lua
        ├── neo-tree.lua
        ├── others.lua
        ├── telescope.lua
        ├── theme.lua
        ├── tmux.lua
        └── treesitter.lua
```

---

## ⚙️ Core Configuration (`lua/config`)

### 🔹 `options.lua`

Basic Neovim settings:

- Line numbers
- Tab & indentation settings
- Search behavior
- UI preferences
- Performance tweaks

### 🔹 `keymaps.lua`

Custom keybindings for:

- Buffer navigation
- File explorer
- Telescope
- LSP actions
- Window management

### 🔹 `autocmds.lua`

Auto commands for:

- Formatting on save
- Filetype-specific settings
- Custom behaviors

### 🔹 `lazy.lua`

Plugin manager setup using **lazy.nvim** for:

- Fast startup
- Lazy loading plugins
- Lockfile support (`lazy-lock.json`)

---

## 🔌 Plugins (`lua/plugins`)

### 📂 File Explorer

- **Neo-tree** – Modern file explorer with icons and Git integration.

### 🔍 Fuzzy Finder

- **Telescope** – File search, live grep, buffers, and more.

### 🧠 LSP & Development

- Built-in LSP configuration
- Formatter & Linter integration
- Debugging support
- Treesitter for better syntax highlighting

### 🎨 UI Enhancements

- Lualine (statusline)
- Bufferline (tab/buffer UI)
- Custom theme
- Dev icons

### 🔗 Integration

- TMUX navigation support
- Additional utility plugins

---

## 🚀 Features

- ⚡ Fast startup with lazy loading
- 🎨 Clean and modern UI
- 🧠 Full LSP support
- 🔍 Powerful fuzzy searching
- 🌳 Syntax highlighting with Treesitter
- 📁 Elegant file management with Neo-tree
- 🧩 Modular & easy to maintain structure

---

## 📦 Installation

1. Backup your existing config:

   ```bash
   mv ~/.config/nvim ~/.config/nvim-backup
   ```

2. Clone this repository:

   ```bash
   git clone https://github.com/yuyyuyswallowtail/yuyyuy-nvim.git ~/.config/nvim
   ```

3. Open Neovim:

   ```bash
   nvim
   ```

4. Let `lazy.nvim` install all plugins automatically.

---

## 🛠 Requirements

- Neovim >= 0.9+
- Git
- Nerd Font (recommended for icons)

Optional:

- Node.js (for some LSP/formatters)
- Go / PHP / etc. depending on your development stack

---

## 📌 Customization

This configuration is modular:

- Add new plugins inside `lua/plugins/`
- Modify keybindings in `lua/config/keymaps.lua`
- Adjust settings in `lua/config/options.lua`
- Extend LSP inside `lua/plugins/lsp-config.lua`

---

# 👨‍💻 Author

## 🚀 Bintang Mesir – Software Engineer & Web Developer

Hello! I'm **Bintang Mesir**, a Software Engineer and Web Developer with a Bachelor's degree in Informatics Engineering from Universitas Muhammadiyah Jakarta.

I have experience building modern web applications using:

- React JS
- Express JS
- Golang Fiber
- Laravel

---

### 🌐 Live Portfolio

👉 https://portofolio-bintang-mesir.vercel.app/

### 📧 Contact

📧 Email: bintangmsr@gmail.com  
📱 Phone: +62 823 2197 3545  
🔗 LinkedIn: https://linkedin.com/in/bintang-mesir

---

If you like this configuration, feel free to ⭐ the repository and customize it to fit your workflow!
