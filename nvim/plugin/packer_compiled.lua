-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/pi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/pi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/pi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/pi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/pi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÎ\5\0\0\a\0!\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0005\4\4\0=\4\5\0034\4\0\0=\4\6\3=\3\b\0025\3\f\0004\4\3\0005\5\t\0005\6\n\0=\6\v\5>\5\1\4=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0034\4\3\0005\5\22\0005\6\23\0=\6\v\5>\5\1\4=\4\24\3=\3\25\0025\3\27\0005\4\26\0=\4\r\0034\4\0\0=\4\15\0034\4\0\0=\4\17\0034\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4\28\0=\4\24\3=\3\29\0024\3\0\0=\3\30\0025\3\31\0=\3 \2B\0\2\1K\0\1\0\15extensions\1\5\0\0\14nvim-tree\rquickfix\15toggleterm\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\0\0\1\2\0\0\rfilename\rsections\14lualine_z\1\0\1\nright\bÓÇ¥\1\2\1\0\rlocation\17left_padding\3\2\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\14separator\1\0\1\tleft\bÓÇ∂\1\2\1\0\tmode\18right_padding\3\2\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ¥\nright\bÓÇ∂\1\0\4\25component_separators\6|\25always_divide_middle\2\ntheme\14palenight\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(      call mkdp#util#install()\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n/\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\brun\blsp\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÀ\1\0\0\5\0\n\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0'\3\5\0'\4\6\0B\1\3\0016\1\a\0009\1\b\1'\3\t\0B\1\2\1K\0\1\0,highlight NvimTreeFolderIcon guibg=blue\bcmd\bvim :NvimTreeFindFileToggle<CR>\15<leader>ff\fnoremap\tvimp\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rainbow_csv = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/rainbow_csv",
    url = "https://github.com/mechatroner/rainbow_csv"
  },
  ["salt-vim"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/salt-vim",
    url = "https://github.com/saltstack/salt-vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nˆ\3\0\0\5\0\21\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\0019\1\2\0'\3\5\0'\4\6\0B\1\3\0019\1\2\0'\3\a\0'\4\b\0B\1\3\0019\1\2\0'\3\t\0'\4\n\0B\1\3\0019\1\2\0'\3\v\0'\4\f\0B\1\3\0019\1\2\0'\3\r\0'\4\14\0B\1\3\0019\1\2\0'\3\15\0'\4\16\0B\1\3\0019\1\2\0'\3\17\0'\4\18\0B\1\3\0019\1\2\0'\3\19\0'\4\20\0B\1\3\1K\0\1\0\29:Telescope registers<cr>\15<leader>fr\28:Telescope jumplist<cr>\15<leader>fj\27:Telescope loclist<cr>\15<leader>fl\28:Telescope quickfix<cr>\15<leader>fq\29:Telescope help_tags<cr>\15<leader>fh\24:Telescope tags<cr>\15<leader>ft\27:Telescope buffers<cr>\15<leader>fb\29:Telescope live_grep<cr>\15<leader>fg\30:Telescope find_files<cr>\15<leader>fs\fnoremap\tvimp\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\në\3\0\0\5\0\n\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0'\3\5\0'\4\6\0B\1\3\0016\1\a\0009\1\b\1'\3\t\0B\1\2\1K\0\1\0˚\1      augroup terminal\n        au!\n        au TermOpen * setlocal nonumber\n        au TermOpen * setlocal norelativenumber\n        au TermOpen * setlocal foldcolumn=0\n        au TermOpen * tnoremap <buffer> <Esc> <C-\\><C-n>\n      augroup end\n    \bcmd\bvim\20:ToggleTerm<cr>\15<Leader>tt\rnnoremap\tvimp\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ultisnips = {
    config = { "\27LJ\2\n≥\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0ì\2    let g:UltiSnipsExpandTrigger=\"<c-x><c-m>\"\n    let g:UltiSnipsListSnippets=\"<c-l>\"\n    let g:UltiSnipsJumpForwardTrigger=\"<c-j>\"\n    let g:UltiSnipsJumpBackwardTrigger=\"<c-k>\"\n    let g:UltiSnipsEditSplit=\"vertical\"\n    let g:UltiSnipsSnippetDirectories=[\"macros\"]\n  \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-boxdraw"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-boxdraw",
    url = "https://github.com/gyim/vim-boxdraw"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dogrun"] = {
    config = { "\27LJ\2\nè\4\0\0\3\0\n\0\0246\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\2\15\0\0\0X\1\4Ä6\0\0\0009\0\6\0+\1\2\0=\1\5\0006\0\0\0009\0\6\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0'\2\t\0B\0\2\1K\0\1\0È\2      syntax enable\n      hi CursorLineNr guifg=#7cbe8c ctermfg=108\n      hi LineNr guifg=#535f98 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE\n      hi FoldColumn guifg=#545c8c ctermfg=60 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE\n      hi IncSearch guibg=#9ea3c0 ctermbg=60\n      hi Search guifg=#9ea3c0 ctermfg=60 guibg=#5d6ad8 ctermbg=62\n    \tdark\15background\6o\18termguicolors\bhas\afn\23colorscheme dogrun\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-dogrun",
    url = "https://github.com/wadackel/vim-dogrun"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\nz\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\0019\1\5\0'\3\6\0'\4\4\0B\1\3\1K\0\1\0\14<Leader>a\rnnoremap\22<Plug>(EasyAlign)\f<Enter>\rvnoremap\tvimp\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-peekaboo",
    url = "https://github.com/junegunn/vim-peekaboo"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-swift"] = {
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-swift",
    url = "https://github.com/bumaociyuan/vim-swift"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n˜\2\0\0\5\0\16\0\0286\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\1\5\0'\3\6\0'\4\a\0B\1\3\0019\1\5\0'\3\b\0'\4\t\0B\1\3\0019\1\5\0'\3\n\0'\4\v\0B\1\3\0019\1\5\0'\3\f\0'\4\r\0B\1\3\0019\1\5\0'\3\14\0'\4\15\0B\1\3\1K\0\1\0\19:TestVisit<CR>\15<leader>tv\18:TestLast<CR>\15<leader>tl\19:TestSuite<CR>\15<leader>ts\18:TestFile<CR>\15<leader>tf\21:TestNearest<CR>\15<leader>tn\rnnoremap\tvimp\frequired      let test#strategy = 'neovim'\n      let test#javascript#jest#executable = 'yarn jest'\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  vimpeccable = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\brun\16keybindings\frequire\0" },
    loaded = true,
    path = "/Users/pi/.local/share/nvim/site/pack/packer/start/vimpeccable",
    url = "https://github.com/svermeulen/vimpeccable"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\në\3\0\0\5\0\n\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0'\3\5\0'\4\6\0B\1\3\0016\1\a\0009\1\b\1'\3\t\0B\1\2\1K\0\1\0˚\1      augroup terminal\n        au!\n        au TermOpen * setlocal nonumber\n        au TermOpen * setlocal norelativenumber\n        au TermOpen * setlocal foldcolumn=0\n        au TermOpen * tnoremap <buffer> <Esc> <C-\\><C-n>\n      augroup end\n    \bcmd\bvim\20:ToggleTerm<cr>\15<Leader>tt\rnnoremap\tvimp\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(      call mkdp#util#install()\n    \bcmd\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: vim-dogrun
time([[Config for vim-dogrun]], true)
try_loadstring("\27LJ\2\nè\4\0\0\3\0\n\0\0246\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\2\15\0\0\0X\1\4Ä6\0\0\0009\0\6\0+\1\2\0=\1\5\0006\0\0\0009\0\6\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0'\2\t\0B\0\2\1K\0\1\0È\2      syntax enable\n      hi CursorLineNr guifg=#7cbe8c ctermfg=108\n      hi LineNr guifg=#535f98 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE\n      hi FoldColumn guifg=#545c8c ctermfg=60 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE\n      hi IncSearch guibg=#9ea3c0 ctermbg=60\n      hi Search guifg=#9ea3c0 ctermfg=60 guibg=#5d6ad8 ctermbg=62\n    \tdark\15background\6o\18termguicolors\bhas\afn\23colorscheme dogrun\bcmd\bvim\0", "config", "vim-dogrun")
time([[Config for vim-dogrun]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÎ\5\0\0\a\0!\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0005\4\4\0=\4\5\0034\4\0\0=\4\6\3=\3\b\0025\3\f\0004\4\3\0005\5\t\0005\6\n\0=\6\v\5>\5\1\4=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0034\4\3\0005\5\22\0005\6\23\0=\6\v\5>\5\1\4=\4\24\3=\3\25\0025\3\27\0005\4\26\0=\4\r\0034\4\0\0=\4\15\0034\4\0\0=\4\17\0034\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4\28\0=\4\24\3=\3\29\0024\3\0\0=\3\30\0025\3\31\0=\3 \2B\0\2\1K\0\1\0\15extensions\1\5\0\0\14nvim-tree\rquickfix\15toggleterm\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\0\0\1\2\0\0\rfilename\rsections\14lualine_z\1\0\1\nright\bÓÇ¥\1\2\1\0\rlocation\17left_padding\3\2\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\14separator\1\0\1\tleft\bÓÇ∂\1\2\1\0\tmode\18right_padding\3\2\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ¥\nright\bÓÇ∂\1\0\4\25component_separators\6|\25always_divide_middle\2\ntheme\14palenight\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÀ\1\0\0\5\0\n\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0'\3\5\0'\4\6\0B\1\3\0016\1\a\0009\1\b\1'\3\t\0B\1\2\1K\0\1\0,highlight NvimTreeFolderIcon guibg=blue\bcmd\bvim :NvimTreeFindFileToggle<CR>\15<leader>ff\fnoremap\tvimp\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n˜\2\0\0\5\0\16\0\0286\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\1\5\0'\3\6\0'\4\a\0B\1\3\0019\1\5\0'\3\b\0'\4\t\0B\1\3\0019\1\5\0'\3\n\0'\4\v\0B\1\3\0019\1\5\0'\3\f\0'\4\r\0B\1\3\0019\1\5\0'\3\14\0'\4\15\0B\1\3\1K\0\1\0\19:TestVisit<CR>\15<leader>tv\18:TestLast<CR>\15<leader>tl\19:TestSuite<CR>\15<leader>ts\18:TestFile<CR>\15<leader>tf\21:TestNearest<CR>\15<leader>tn\rnnoremap\tvimp\frequired      let test#strategy = 'neovim'\n      let test#javascript#jest#executable = 'yarn jest'\n    \bcmd\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: vim-easy-align
time([[Config for vim-easy-align]], true)
try_loadstring("\27LJ\2\nz\0\0\5\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\0019\1\5\0'\3\6\0'\4\4\0B\1\3\1K\0\1\0\14<Leader>a\rnnoremap\22<Plug>(EasyAlign)\f<Enter>\rvnoremap\tvimp\frequire\0", "config", "vim-easy-align")
time([[Config for vim-easy-align]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\brun\blsp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nˆ\3\0\0\5\0\21\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\0019\1\2\0'\3\5\0'\4\6\0B\1\3\0019\1\2\0'\3\a\0'\4\b\0B\1\3\0019\1\2\0'\3\t\0'\4\n\0B\1\3\0019\1\2\0'\3\v\0'\4\f\0B\1\3\0019\1\2\0'\3\r\0'\4\14\0B\1\3\0019\1\2\0'\3\15\0'\4\16\0B\1\3\0019\1\2\0'\3\17\0'\4\18\0B\1\3\0019\1\2\0'\3\19\0'\4\20\0B\1\3\1K\0\1\0\29:Telescope registers<cr>\15<leader>fr\28:Telescope jumplist<cr>\15<leader>fj\27:Telescope loclist<cr>\15<leader>fl\28:Telescope quickfix<cr>\15<leader>fq\29:Telescope help_tags<cr>\15<leader>fh\24:Telescope tags<cr>\15<leader>ft\27:Telescope buffers<cr>\15<leader>fb\29:Telescope live_grep<cr>\15<leader>fg\30:Telescope find_files<cr>\15<leader>fs\fnoremap\tvimp\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vimpeccable
time([[Config for vimpeccable]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\brun\16keybindings\frequire\0", "config", "vimpeccable")
time([[Config for vimpeccable]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\n≥\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0ì\2    let g:UltiSnipsExpandTrigger=\"<c-x><c-m>\"\n    let g:UltiSnipsListSnippets=\"<c-l>\"\n    let g:UltiSnipsJumpForwardTrigger=\"<c-j>\"\n    let g:UltiSnipsJumpBackwardTrigger=\"<c-k>\"\n    let g:UltiSnipsEditSplit=\"vertical\"\n    let g:UltiSnipsSnippetDirectories=[\"macros\"]\n  \bcmd\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
