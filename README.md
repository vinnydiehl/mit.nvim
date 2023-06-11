# mit.nvim

❤️ open source

A super lightweight Neovim plugin that does one and only one thing: adds an MIT license to your project.

## Installation

Install with your favorite plugin manager. For example, with
[Packer](https://github.com/wbthomason/packer.nvim):

```lua
use "vinnydiehl/mit.nvim"
```

## Configuration

This plugin adds one Lua function. Set a keybind for it like so:

```lua
vim.keymap.set("n", "<leader>mit", function() require("mit").create_license_file() end)
```

## Usage

mit.nvim will check your git config for a name. If it doesn't find one, it will
prompt you for your name at the bottom of the screen. The current year will be
filled in automatically.

If you do not have your name set in your git config, you can do so with:

```sh
git config --global user.name "YOUR NAME HERE"
```

## License

MIT, of course! I added the license to this plugin using this plugin. See
[`LICENSE.md`](https://github.com/vinnydiehl/mit.nvim/blob/main/LICENSE.md)
for an example of what yours will look like.

## Will you be adding other licenses?

Nah. If you have another license you would prefer to use, you are welcome to
modify
[`license_template.md`](https://github.com/vinnydiehl/mit.nvim/blob/main/lua/mit/license_template.md)
and put your own in. All you need to do is put the `<YEAR>` and `<NAME>` tags
wherever you would like those elements inserted.

For a more full-featured plugin with a Telescope picker, see
[telescope-software-licenses.nvim](https://github.com/chip/telescope-software-licenses.nvim).
