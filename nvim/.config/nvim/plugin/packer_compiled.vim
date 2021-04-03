" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["diagnostic-nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/diagnostic-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["jest.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/jest.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-fish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-indent-guides"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-scala"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-scala"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-slumlord"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-slumlord"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  vimtex = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  vimwiki = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/yats.vim"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
