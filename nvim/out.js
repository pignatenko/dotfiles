const fs = require('fs');
const path = require('path');

const plugins = [
'junegunn/vim-easy-align',
'easymotion/vim-easymotion',
'junegunn/vim-peekaboo',
'tpope/vim-abolish',
'tpope/vim-projectionist',
'tpope/vim-dispatch',
'tpope/vim-rails',
'tpope/vim-repeat',
'tpope/vim-surround',
'tpope/vim-commentary',
'saltstack/salt-vim',
'leafgarland/typescript-vim',
'sheerun/vim-polyglot',
'janko/vim-test',
'bumaociyuan/vim-swift',
'plasticboy/vim-markdown',
'gyim/vim-boxdraw',
'SirVer/ultisnips',
'tpope/vim-fugitive',
'mechatroner/rainbow_csv',
'neovim/nvim-lspconfig',
'akinsho/toggleterm.nvim',
];
// 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
// 'ms-jpq/coq_nvim', {'branch': 'coq'}
// 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
// 'nvim-treesitter/nvim-treesitter-textobjects'
// 'ggandor/lightspeed.nvim', { 'branch': 'main' }
// 'junegunn/goyo.vim', { 'on': ['Goyo', 'GoyoEnter', 'GoyoLeave'] }
// 'junegunn/limelight.vim', { 'on': ['Limelight'] }
// 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
// 'vim-scripts/dbext.vim', { 'on': ['DBExecVisualSQL', 'DBExecVisualSQLTopX', 'DBExecSQLUnderCursor', 'DBExecSQLUnderCursorTopX', 'DBExecSQL', 'DBExecRangeSQL', 'DBSelectFromTable', 'DBSelectFromTableWithWhere', 'DBSelectFromTableAskName', 'DBSelectFromTableTopX', 'DBDescribeTable', 'DBDescribeTableAskName', 'DBDescribeProcedure', 'DBDescribeProcedureAskName', 'DBPromptForBufferParameters', 'DBListColumn', 'DBListTable', 'DBListProcedure', 'DBListView', 'DBOrientationToggle', 'DBHistory', 'DBGetStoredProcBody', 'DBGetStoredProcTemplate']}
// 'pangloss/vim-javascript', { 'for': [ 'javascript' ] }
//

const luaName = (name) => name.split('/')[1];
const luaLocation = (name) => path.join(__dirname, `lua/plugins/${luaName(name)}.lua`);
const pluginContents = (name) => `plugin = {
  '${name}'
}

return plugin
`;


plugins.forEach((plugin) => {
  console.log(`Creating ${luaLocation(plugin)} w/ contents\n${pluginContents(plugin)}`);

  fs.writeFileSync(luaLocation(plugin), pluginContents(plugin));
});
