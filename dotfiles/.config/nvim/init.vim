let g:polyglot_disabled = ['sensible', 'twig']

call plug#begin('/usr/share/nvim/plugged')

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'antoinemadec/FixCursorHold.nvim'
  Plug 'lewis6991/impatient.nvim'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'tpope/vim-repeat'
  Plug 'moll/vim-bbye'
  Plug 'chomosuke/term-edit.nvim', {'tag': 'v1.*'}
  Plug 'simnalamburt/vim-mundo'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-live-grep-args.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'debugloop/telescope-undo.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'renerocksai/telekasten.nvim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'anuvyklack/middleclass'
  Plug 'anuvyklack/windows.nvim'
  Plug 'sindrets/winshift.nvim'
  Plug 'mrjones2014/legendary.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'nvim-telescope/telescope-dap.nvim'
  Plug 'stevearc/oil.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'kevinhwang91/promise-async'
  Plug 'kevinhwang91/nvim-ufo'
  Plug 'tpope/vim-fugitive'
  Plug 'sindrets/diffview.nvim'
  Plug 'NvChad/nvim-colorizer.lua'
  " Plug 'aaron-p1/match-visual.nvim'
  Plug 'AndrewRadev/inline_edit.vim'
  Plug 'levouh/tint.nvim'
  Plug 'andymass/vim-matchup'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'ckolkey/ts-node-action'
  Plug 'wellle/context.vim'
  Plug 'Hippo0o/iswap.nvim'
  Plug 'm-demare/hlargs.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'Darazaki/indent-o-matic'
  Plug 'arkav/lualine-lsp-progress'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'LostNeophyte/null-ls-embedded'
  Plug 'github/copilot.vim', {'commit': '324ec9eb69e20971b58340d0096c3caac7bc2089'}
  " Plug 'Hippo0o/copilot.lua'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'ray-x/cmp-treesitter'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'tamago324/cmp-zsh'
  Plug 'davidsierradz/cmp-conventionalcommits'
  Plug 'hrsh7th/cmp-cmdline'
  " Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
  Plug 'onsails/lspkind-nvim'
  Plug 'SmiteshP/nvim-navic'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}
  Plug 'rafamadriz/friendly-snippets'
  Plug 'phiter/phpstorm-snippets-for-vscode'
  Plug 'sdras/vue-vscode-snippets'
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Plug 'karb94/neoscroll.nvim'
  Plug 'Hippo0o/pounce.nvim'
  Plug 'rhysd/clever-f.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'kylechui/nvim-surround'
  " Plug 'simnalamburt/vim-mundo'
  Plug 'monaqa/dial.nvim'
  Plug 'windwp/nvim-spectre'
  Plug 'echasnovski/mini.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'kevinhwang91/nvim-hlslens'
  " Plug 'rmagatti/auto-session'
  Plug 'Shatur/neovim-session-manager'
  Plug 'stevearc/dressing.nvim'
  Plug 'eandrju/cellular-automaton.nvim'
  Plug 'chrisbra/csv.vim'

call plug#end()

if exists('$PLUG_INSTALL')
  finish
endif

" suppress error messages
lua << EOF
error = function()  end
local _schedule = vim.schedule
vim.schedule = function(f)
    _schedule(function()
        local ok, err = pcall(f)
        if not ok then
            print("Error in schedule", err)
        end
    end)
end
local _nvim_create_autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_autocmd = function(event, opts)
    for k, v in pairs(opts) do
        -- if value is a function
        if type(v) == "function" then
            -- wrap it in a pcall
            opts[k] = function(...)
                local ok, err = pcall(v, ...)
                if not ok then
                    print("Error in autocmd", err)
                end
            end
        end
    end
    _nvim_create_autocmd(event, opts)
end
EOF

lua require('impatient')

syntax on

set nowrap
" set numberwidth=2
set signcolumn=auto:2
set number relativenumber
set hidden
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set laststatus=3
set noshowmode
set nosmartcase
set ignorecase
" |—
set listchars=tab:├─,trail:~,extends:>,precedes:<
set showbreak=\\ "
set list
set mouse=
set backupdir-=.
set noswapfile
set undofile
set scrolloff=8
set cursorline
set termguicolors
set backspace=indent,eol,start
set wildmenu
set sessionoptions+=winpos,folds sessionoptions-=terminal
set completeopt=menu,menuone,noselect,noinsert
set timeoutlen=300
set ttimeoutlen=1
set synmaxcol=300
set winminwidth=0
set foldmethod=indent
set foldlevel=99
set foldlevelstart=99
set nomodeline
set formatoptions=cqjr
set iskeyword+=-
set iskeyword+=$


let $EDITOR='nvr'
let $VISUAL="nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"

let mapleader=" "
let g:cursorhold_updatetime=100

augroup force_settings
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=t formatoptions-=o indentkeys= autoindent
augroup END

" resize on launch with terminal
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

autocmd VimEnter * :clearjumps

autocmd VimResized * :wincmd =

autocmd FocusLost * :silent! wa

augroup neovim_terminal
    autocmd!
    autocmd BufLeave term://* stopinsert
    autocmd BufEnter term://* startinsert
    autocmd TermOpen * startinsert
    autocmd TermOpen * :setlocal nonumber norelativenumber
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
tnoremap <A-ESC> <ESC>
tnoremap <ESC> <C-\><C-N>
tmap <A-H> <C-\><C-N><A-H>
tmap <A-J> <C-\><C-N><A-J>
tmap <A-K> <C-\><C-N><A-K>
tmap <A-L> <C-\><C-N><A-L>
tmap <A-Tab> <C-\><C-N><A-Tab>
tmap <A-f> <C-\><C-N><A-f>
tmap <A-F> <C-\><C-N><A-F>
tmap <A-p> <C-\><C-N><A-p>
tmap <A-P> <C-\><C-N><A-P>
tmap <A-q> <C-\><C-N><A-q>
tmap <A-Q> <C-\><C-N><A-Q>
tmap <A-T> <C-\><C-N><A-T>
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'

command! ScratchBuffer new | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
"command! -nargs=1 CompareRemote execute "diffsplit " . <q-args> . "/" . expand('%:.')
command! CompareRemote execute "diffsplit " . $COMPARE_REMOTE_DIR . "/" . expand('%:.')

" colorscheme settings
set background=dark
let g:moonflyTransparent=0
let g:moonflyWinSeparator=2
let g:moonflyNormalFloat = v:true
colorscheme moonfly

highlight Normal guibg=#1b1e20
highlight NormalFloat guibg=#202426
highlight FloatBorder guibg=#202426
highlight LineNr guifg=#aaaaaa
highlight IncSearch guifg=#e4e4e4 guibg=#80a0ff
highlight Search guifg=#e4e4e4 guibg=#00875f
" highlight IncSearch guifg=#e3c78a guibg=#444444
highlight! link CurSearch IncSearch
highlight link FloatTitle MoonflyGrey241

highlight DiffAdd guifg=NONE guibg=#103b2c
highlight DiffText guifg=NONE guibg=#00326f

highlight LspReferenceText gui=bold guibg=#202426
highlight LspReferenceRead gui=bold guibg=#202426
highlight LspReferenceWrite gui=bold guibg=#202426

highlight CopilotSuggestion gui=italic guifg=#aaaaaa ctermfg=8


" highlight link vueTSPunctSpecial javascriptTSVariable

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=50}


" lots of ALTernative bindings
nnoremap <A-h> <c-w>h
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-l> <c-w>l
nnoremap <A-H> <cmd>WinShift left<CR>
nnoremap <A-J> <cmd>WinShift down<CR>
nnoremap <A-K> <cmd>WinShift up<CR>
nnoremap <A-L> <cmd>WinShift right<CR>
nnoremap <silent> <A-v> <cmd>vsplit<CR>
nnoremap <silent> <A-s> <cmd>split<CR>
nnoremap <silent> <A-w> <cmd>windo bwipeout!<CR>
nnoremap <silent> <A-q> <cmd>wincmd c<CR>
nnoremap <silent> <A-Q> <cmd>Bwipeout!<CR>
nnoremap <silent> <A-CR> <cmd>ScratchBuffer<CR>
nnoremap <silent> <A-T> <cmd>new <bar> terminal<CR>
nnoremap <silent> <expr> <A-t> ":edit term://" . expand("%:p:h") . "//zsh<CR>"

nnoremap <A-=> <c-w>=
nnoremap <C-A-k> <c-w>+
nnoremap <C-A-j> <c-w>-
nnoremap <C-A-l> 10<c-w>>
nnoremap <C-A-h> 10<c-w><

inoremap <A-h> <C-c><C-w>h
inoremap <A-j> <C-c><C-w>j
inoremap <A-k> <C-c><C-w>k
inoremap <A-l> <C-c><C-w>l
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" nnoremap <S-Down> <cmd>m .+1<CR>==
" nnoremap <S-Up> <cmd>m .-2<CR>==
" vnoremap <S-Down> :m '>+1<CR>gv=gv
" vnoremap <S-Up> :m '<-2<CR>gv=gv

nnoremap y "+y
vnoremap y "+y
vnoremap x "+x
map <leader>p o<Esc>p
map <leader>P O<Esc>p

inoremap <S-Tab> <C-d>
" C-h == C-BS
imap <C-h> <C-w>
cmap <C-h> <C-w>
imap <C-BS> <C-w>
cmap <C-BS> <C-w>

map <silent> <C-H> <cmd>join<cr>
map J 5j
map K 5k
nmap L <nop>
nmap H <nop>

nnoremap gl $
nnoremap gh ^
vnoremap gl g_
vnoremap gh ^

nnoremap gp `[v`]
nnoremap <expr> gP '`[' . strpart(getregtype(), 0, 1) . '`]'

nmap <silent> <Esc> <cmd>noh<cr>
map <silent> <leader>l :set wrap!<cr>

map <C-s> gq:w<CR>
imap <C-s> <c-o><cmd>w<CR>

" multicursor ish
" let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
" nnoremap cn *``cgn<C-R>"
" nnoremap cN *``cgN<C-R>"
" vnoremap <expr> <leader>cn g:mc . "``cgn<C-R>\""
" vnoremap <expr> <leader>cN g:mc . "``cgN<C-R>\""


" vim-asterisk
" map *  <Plug>(asterisk-z*)
" map #  <Plug>(asterisk-z#)
" map g* <Plug>(asterisk-gz*)
" map g# <Plug>(asterisk-gz#)


" inline_edit
let g:inline_edit_autowrite = 1
let g:inline_edit_modify_statusline = 0
let g:inline_edit_proxy_type = "tempfile"
vnoremap <silent> <leader>i :InlineEdit 
nnoremap <silent> <leader>i :InlineEdit 


" dial.nvim
nmap  <C-a>  <Plug>(dial-increment)
nmap  <C-x>  <Plug>(dial-decrement)
vmap  <C-a>  <Plug>(dial-increment)
vmap  <C-x>  <Plug>(dial-decrement)
vmap g<C-a> g<Plug>(dial-increment)
vmap g<C-x> g<Plug>(dial-decrement)
lua <<EOF
local augend = require("dial.augend")
require("dial.config").augends:register_group({
    default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.constant.alias.de_weekday,
        augend.constant.alias.de_weekday_full,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%d.%m.%Y"],
        augend.constant.new{ elements = {"public", "protected", "private"} },
        augend.constant.new{ elements = {"const", "let" } },
    },
})
EOF


" hlslens
map <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
map <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
map <silent> * <Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>
map <silent> # <Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>
map <silent> g* <Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>
map <silent> g# <Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>
lua <<EOF
require('hlslens').setup{
    calm_down = false,
}
EOF


" vim-matchup
let g:matchup_matchparen_nomode = 'i'
let g:matchup_surround_enabled = 1
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_offscreen = {'method': 'none', 'fullwidth': 1, 'syntax_hl': 0}


" vim-sandwich
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1
nmap <leader>srb <Plug>(sandwich-replace-auto)
nmap <leader>sr <Plug>(sandwich-replace)
xmap <leader>sr <Plug>(sandwich-replace)
nmap <leader>sdb <Plug>(sandwich-delete-auto)
nmap <leader>sd  <Plug>(sandwich-delete)
xmap <leader>sd  <Plug>(sandwich-delete)
omap <leader>sa  <Plug>(sandwich-add)
nmap <leader>sa  <Plug>(sandwich-add)
xmap <leader>sa  <Plug>(sandwich-add)
" omap ia <Plug>(textobj-sandwich-auto-i)
" xmap ia <Plug>(textobj-sandwich-auto-i)
" omap aa <Plug>(textobj-sandwich-auto-a)
" xmap aa <Plug>(textobj-sandwich-auto-a)


" spectre
nnoremap <silent> <leader>S <cmd>lua require('spectre').open()<CR>
" search current word
nnoremap <silent> <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <silent> <leader>ss :'<,'>lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <silent> <leader>sp <cmd>lua require('spectre').open_file_search()<cr>
lua <<EOF
require('spectre').setup({
  open_cmd = 'tabnew',
})
EOF


" clever-f
let g:clever_f_fix_key_direction=1
let g:clever_f_across_no_line=1
let g:clever_f_mark_direct=1
let g:clever_f_timeout_ms=1
highlight CleverFDefaultLabel guifg=#80a0ff gui=reverse,bold
highlight CleverFChar guifg=#e3c78a gui=bold
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)


" pounce
nmap s <cmd>Pounce<CR>
nmap S <cmd>PounceRepeat<CR>
vmap s <cmd>Pounce<CR>
vmap S <cmd>PounceRepeat<CR>
omap gs <cmd>Pounce<CR>
highlight PounceUnmatched guifg=#9e9e9e guibg=#1b1e20
highlight link PounceGap MoonflyWhite
highlight link PounceMatch MoonflyYellow
highlight PounceAcceptBest guifg=#ff5189 gui=reverse
highlight PounceAccept guifg=#80a0ff gui=reverse
lua <<EOF
require('pounce').setup{
  accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
  accept_best_key = "<enter>",
  multi_window = true,
}
EOF


" telescope
nnoremap <leader><space> <cmd>Telescope jumplist fname_width=100<cr>
nnoremap <A-m> <cmd>Telescope marks<cr>
nnoremap <A-u> <cmd>Telescope undo<cr>
nnoremap <A-p> <cmd>Telescope git_files recurse_submodules=true show_untracked=false<cr>
vnoremap <A-p> "zy<cmd>exec 'Telescope git_files recurse_submodules=true show_untracked=false default_text=' . escape(@z, ' ')<cr>
nnoremap <A-P> <cmd>Telescope find_files hidden=true no_ignore=true<cr>
vnoremap <A-P> "zy<cmd>exec 'Telescope find_files hidden=true no_ignore=true default_text=' . escape(@z, ' ')<cr>
nnoremap <A-F> <cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nnoremap <A-f> <cmd>Telescope live_grep<cr>
vnoremap <A-f> "zy<cmd>exec 'Telescope live_grep default_text=' . escape(@z, ' ')<cr>
vmap <A-*> <A-f>
nmap <A-*> viw<A-f>
nnoremap <A-o> <cmd>Telescope lsp_document_symbols<cr>
vnoremap <A-o> "zy<cmd>exec 'Telescope lsp_document_symbols default_text=' . escape(@z, ' ')<cr>
nnoremap <A-O> <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
vnoremap <A-O> "zy<cmd>exec 'Telescope lsp_dynamic_workspace_symbols default_text=' . escape(@z, ' ')<cr>
nnoremap <A-Bs> <cmd>Telescope resume<cr>
nnoremap <A-Tab> <cmd>lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<cr>
highlight link TelescopeBorder FloatBorder
highlight link TelescopeNormal NormalFloat
highlight link TelescopeTitle FloatTitle
lua <<EOF
require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--fixed-strings",
            "--line-number",
            "--column",
            "--smart-case",
        },
        layout_strategy = "vertical",
        -- layout_strategy = 'flex',
        -- layout_config = {
        --   flex = {
        --       flip_columns = 160,
        --       flip_lines = 40,
        --   }
        -- },
        prompt_prefix = "",
        preview = {
            filesize_limit = 1, -- 1mb
            -- treesitter = false,
        }
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            prompt_title = "Live Grep Raw",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--unrestricted",
            },
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        undo = {
            side_by_side = true,
            layout_config = {
                preview_height = 0.7,
            },
            mappings = {
                i = {
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<A-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<A-BS>"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
})
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
require("telescope").load_extension("dap")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("undo")
EOF


" legendary.nvim
map <silent> <A-`> <cmd>Legendary<CR>
lua <<EOF
require('legendary').setup({
  which_key = {
    auto_register = true,
  }
})
EOF


" which-key
map <F1> <cmd>WhichKey<CR>
lua <<EOF
require("which-key").setup {
    -- triggers = {"'", '`', '"', '@'},
    -- triggers_nowait = {"'", '`', '"', '@'},
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt", "DressingInput" },
    },
}
EOF


" nvim-tree
highlight NvimTreeIndentMarker guifg=grey
highlight! link NvimTreeNormal Normal
highlight! link NvimTreeCursorLine CursorLine
nnoremap <silent> <A-n> :NvimTreeFocus<CR>
nnoremap <silent> <leader>nn :NvimTreeFocus<CR>
nnoremap <silent> <leader>nt :NvimTreeToggle<CR>
nnoremap <silent> <leader>nf :NvimTreeFindFile<CR>
lua <<EOF
require("nvim-tree").setup({
    open_on_setup = false,
    hijack_netrw = false,
    hijack_unnamed_buffer_when_opening = true,
    view = {
        width = "20%",
        adaptive_size = true,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = true,
            list = {
                { key = { "<CR>", "<2-LeftMouse>" }, action = "edit" },
                { key = "<C-e>", action = "edit_in_place" },
                { key = { "O" }, action = "edit_no_picker" },
                { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
                { key = "<C-v>", action = "vsplit" },
                { key = "<C-x>", action = "split" },
                { key = "<C-t>", action = "tabnew" },
                { key = "<", action = "prev_sibling" },
                { key = ">", action = "next_sibling" },
                { key = "P", action = "parent_node" },
                { key = "<BS>", action = "close_node" },
                { key = "<Tab>", action = "preview" },
                { key = "K", action = "first_sibling" },
                { key = "J", action = "last_sibling" },
                { key = "I", action = "toggle_git_ignored" },
                { key = "H", action = "toggle_dotfiles" },
                { key = "R", action = "refresh" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "D", action = "trash" },
                { key = "r", action = "rename" },
                { key = "<C-r>", action = "full_rename" },
                { key = "x", action = "cut" },
                { key = "c", action = "copy" },
                { key = "p", action = "paste" },
                { key = "y", action = "copy_name" },
                { key = "Y", action = "copy_path" },
                { key = "gy", action = "copy_absolute_path" },
                { key = "[c", action = "prev_git_item" },
                { key = "]c", action = "next_git_item" },
                { key = "-", action = "dir_up" },
                { key = "o", action = "system_open" },
                { key = "f", action = "live_filter" },
                { key = "F", action = "clear_live_filter" },
                { key = "q", action = "close" },
                { key = "g?", action = "toggle_help" },
                { key = "W", action = "collapse_all" },
                { key = "<C-F>", action = "search_node" },
                { key = "<C-k>", action = "toggle_file_info" },
                { key = ".", action = "run_file_command" },
                {
                    key = "<C-f>",
                    action = "grep_dir",
                    action_cb = function(node)
                        require("telescope.builtin").live_grep({
                            prompt_title = "Live Grep (" .. node.absolute_path .. ")",
                            additional_args = { "--unrestricted", "--hidden" },
                            search_dirs = { node.absolute_path },
                        })
                    end,
                },
                {
                    key = "<A-CR>",
                    action = "open_file",
                    action_cb = function(node)
                        require("nvim-tree.actions.node.open-file").fn("edit", node.absolute_path)
                    end,
                },
            },
        },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
    renderer = {
        highlight_git = true,
        -- highlight_opened_files = '0',
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        update_root = false,
        ignore_list = {},
    },
    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = false,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})
EOF


" git
nmap <leader>gs <cmd>tab G<CR>
nmap <A-g> <cmd>G<CR>
nmap <leader>gl <cmd>tabnew<bar>Gllog<CR>
nmap <leader>gp <cmd>G pull<CR>
nmap <leader>gP <cmd>G push<CR>
nmap <leader>gb <cmd>G blame<CR>
" nmap <leader>gd <cmd>Git diff %<CR>
" nmap <leader>gh :diffget //2<cr>
" nmap <leader>gl :diffget //3<cr>
nmap <silent> <leader>gt :Gitsigns toggle_linehl<CR>:Gitsigns toggle_numhl<CR>
nmap <silent> <leader>gf <cmd>DiffviewFileHistory %<CR>
nmap <silent> <leader>gh <cmd>DiffviewFileHistory<CR>
vmap <silent> <leader>gf <cmd>DiffviewFileHistory<CR>
nmap <silent> <leader>gd <cmd>DiffviewOpen<CR>
nmap <silent> <leader>gcm<Space> :Git merge<Space>
nmap <silent> <leader>gcm<CR> :Git merge<CR>
nmap <silent> <leader>gcmt :Git mergetool
nmap <silent> <leader>gco<Space> :Git checkout<Space>
nmap <silent> <leader>gco<CR> :Git checkout<CR>
nmap <silent> <leader>gcoo :<C-U>Git checkout <C-R>=substitute(<SID>SquashArgument(),"^$",get(<SID>TempState(),"filetype","") ==# "git" ? expand("<cfile>") : "","")<CR> --<CR>
nmap <silent> <leader>gcb<Space> :Git branch<Space>
nmap <silent> <leader>gcb<CR> :Git branch<CR>

lua <<EOF
-- diffview.nvim
require("diffview").setup {}

-- gitsigns.nvim
require("gitsigns").setup({
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 400,
        ignore_whitespace = false,
    },
})
EOF


" vim-mundo
" nnoremap <silent> <leader>u :MundoToggle<CR>
" nnoremap <silent> <leader>U :MundoHide<CR>


" init.lua
lua <<EOF
function close_all_floating(force)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_is_valid(win) then
            local config = vim.api.nvim_win_get_config(win)
            if config.relative ~= "" then
                pcall(function()
                    vim.api.nvim_win_close(win, force or false)
                end)
                print("Closing window", win)
            end
        end
    end
end

-- function buffer_file_size_below(buf, max_file_size)
--     local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
--     return byte_size < 1024 * max_file_size -- max_file_size=1024 == 1 Megabyte
-- end


require("colorizer").setup({
    filetype = {
        "*",
        css = { css = true, names = true },
        scss = { css = true, names = true },
    },
    user_default_options = {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        css = false,
        css_fn = true,
        names = false,
        tailwind = true,
    },
})


require("tint").setup({
    tint = -10, -- Darken colors, use a positive value to brighten
    saturation = 0.8, -- Saturation to preserve
})

-- windows.nvim
require("windows").setup({
    autowidth = {
        winwidth = 10,
    },
})
local function set_window_autowidth(buf)
    if vim.api.nvim_win_get_config(0).relative ~= "" then
        return
    end
    local width = 10
    if vim.bo.buftype ~= "terminal" and vim.bo.buftype ~= "nofile" then
        -- get width by longest line
        for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
            if #line > width then
                width = #line
            end
        end
    end

    -- get textwidth
    local tw = vim.bo.textwidth or 80
    if tw == 0 then
        tw = 80
    end

    -- calculate desired window width
    width = width - tw + 10
    if width < 10 then
        width = 10
    end

    -- overwrite config for autowidth
    require("windows.config").autowidth.winwidth = width
end
local text_changed = false
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(params)
        text_changed = false
        set_window_autowidth(params.buf)
    end,
})
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    callback = function(params)
        if vim.api.nvim_win_get_config(0).relative ~= "" then
            return
        end
        text_changed = true
    end,
})
local function handle_text_changed(buf)
    if text_changed then
        text_changed = false
        set_window_autowidth(buf)
        -- resize window width manually
        local curwin = require("windows.lib.api").Window(0)
        local winsdata = require("windows.calculate-layout").autowidth(curwin)
        if not vim.tbl_isempty(winsdata) then
            require("windows.lib.resize-windows").resize_windows(winsdata)
        end
    end
end
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function(params)
        handle_text_changed(params.buf)
    end,
})
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function(params)
        handle_text_changed(params.buf)
        if vim.bo.buftype ~= "prompt" and vim.fn.mode() == "n" then
            -- reset window scroll
            vim.cmd.normal({"ze", bang = true})
        end
    end,
})

-- nvim-ufo
vim.keymap.set('n', '<leader>k', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)
require("ufo").setup({
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>'
        }
    },
    provider_selector = function(bufnr, filetype, buftype)
        if buftype == "terminal" then
            return ""
        end
        return { "lsp", "indent" }
    end,
})

require("indent-o-matic").setup({})


require('nvim-navic').setup({
    depth_limit = 4
})

-- copilot.lua
-- vim.defer_fn(function()
--   require("copilot").setup({
--     panel = {
--       enabled = true,
--       auto_refresh = false,
--       keymap = {
--         jump_prev = "[[",
--         jump_next = "]]",
--         accept = "<CR>",
--         refresh = "gr",
--         open = "<M-CR>",
--       },
--     },
--     suggestion = {
--       enabled = true,
--       auto_trigger = true,
--       debounce = 0,
--       keymap = {
--         accept = "<S-Right>",
--         accept_word = "<M-Right>",
--         accept_line = "<Right>",
--         next = "<M-]>",
--         prev = "<M-[>",
--         dismiss = "<C-]>",
--       },
--     },
--     filetypes = {
--       markdown = false,
--       help = false,
--       gitcommit = false,
--       gitrebase = false,
--       hgcommit = false,
--       svn = false,
--       cvs = false,
--       TelescopePrompt = false,
--     },
--     copilot_node_command = 'node', -- Node.js version must be > 16.x
--     server_opts_overrides = {},
--   })
-- end, 100)

require("session_manager").setup({
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
})

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")


-- mini.nvim
require('mini.ai').setup()
require('mini.align').setup()
require('mini.indentscope').setup({
  draw = {
    delay = 100,
    animation = require('mini.indentscope').gen_animation.none()
  },
  symbol = '│'
})
require('mini.move').setup({
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<S-Left>',
    right = '<S-Right>',
    down = '<S-Down>',
    up = '<S-Up>',

    -- Move current line in Normal mode
    line_left = '<S-Left>',
    line_right = '<S-Right>',
    line_down = '<S-Down>',
    line_up = '<S-Up>',
  },
})


-- better-macro
local function enhanced_macro()
    local namespace = vim.api.nvim_create_namespace("MacroInsertPaste")

    local key_c_o = vim.api.nvim_replace_termcodes("<C-o>", true, false, true)
    local key_esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
    local key_leader = vim.api.nvim_replace_termcodes("<leader>", true, false, true)
    local key_right = vim.api.nvim_replace_termcodes("<Right>", true, false, true)
    local key_back = vim.api.nvim_replace_termcodes("<BS>", true, false, true)

    local mode_key_map = { niI = key_c_o }
    local insert_entered = false
    local macro_register = 'm'
    local inserted_register = 'n'

    local function insert_enter()
        if insert_entered then
            local is_end_of_line = (vim.fn.col(".") == vim.fn.col("$"))
            vim.cmd.normal({ bang = true, "q" })
            if is_end_of_line then
                return vim.api.nvim_feedkeys(key_right, "n", false)
            end
        end
    end

    local function insert_leave()
        if insert_entered and (vim.v.event.new_mode ~= "c") then
            vim.cmd.normal({ bang = true, "`[v`]" .. key_back .. '"' .. inserted_register .. "y`]"})
            local current_macro = vim.fn.getreg(macro_register)
            local inserted = vim.fn.getreg(inserted_register)
            local mode_key = mode_key_map[vim.v.event.new_mode]
            local key_to_leave = (mode_key or key_esc)
            local new_macro = (current_macro .. inserted .. key_to_leave)
            vim.fn.setreg(macro_register, new_macro)
            vim.cmd.normal({ bang = true, ("q" .. string.upper(macro_register)) })
        end
    end

    local function start_macro()
        insert_entered = true

        return vim.api.nvim_feedkeys("q"..macro_register, "n", false)
    end

    local function stop_macro()
        insert_entered = false

        return vim.api.nvim_feedkeys("q", "n", false)
    end

    local function setup()
        vim.keymap.set("n", "<Leader>q", start_macro)
        vim.keymap.set("n", "q", stop_macro)
        local group = vim.api.nvim_create_augroup("MacroInsertPaste", {})
        vim.api.nvim_create_autocmd("ModeChanged", { group = group, pattern = "*:i", callback = insert_enter })
        vim.api.nvim_create_autocmd("ModeChanged", { group = group, pattern = "i:*", callback = insert_leave })
    end

    return { setup = setup, start_macro = start_macro, stop_macro = stop_macro }
end

local em = enhanced_macro()
em.setup()

vim.keymap.set({ "v", "n" }, "\\", function()
    vim.api.nvim_feedkeys("*", "t", false)
    em.start_macro()
    vim.api.nvim_feedkeys("gn", "t", false)
end)
vim.keymap.set({ "v", "n" }, "|", function()
    vim.api.nvim_feedkeys("*", "t", false)
    em.start_macro()
    vim.api.nvim_feedkeys("gN", "t", false)
end)


require 'term-edit'.setup {
    prompt_end = '❯ ',
    mapping = { n = { s = false, S = false }, x = { s = false, S = false }, v = { s = false, S = false } }
}
EOF


" oil.nvim
autocmd BufRead * nnoremap <buffer> <silent> - <cmd>Oil<CR>
nnoremap <silent> <leader><CR> <cmd>ScratchBuffer<CR><cmd>Oil<CR>
highlight link OilDir Directory
lua <<EOF
require("oil").setup({
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["g."] = "actions.toggle_hidden",
    ["<A-t>"] = {
      desc = "Open a terminal in the current directory",
      callback = function()
        local dir = require("oil").get_current_dir()
        if dir then
          vim.cmd("split term://" .. dir .. "/zsh")
        end
      end,
    },
  },
})
EOF


" iswap
nnoremap <silent> gs <cmd>ISwapWith<CR>
vnoremap <silent> gs <cmd>ISwapWith<CR>
nnoremap <silent> gS <cmd>ISwapNodeWith<CR>
vnoremap <silent> gS <cmd>ISwapNodeWith<CR>
lua <<EOF
require('iswap').setup {
    grey = 'disable',
}
EOF


" zettelkasten
nnoremap <silent> <leader>zf <cmd>lua require('telekasten').find_notes()<CR>
nnoremap <silent> <leader>zd <cmd>lua require('telekasten').find_daily_notes()<CR>
nnoremap <silent> <leader>zg <cmd>lua require('telekasten').search_notes()<CR>
nnoremap <silent> <leader>zz <cmd>lua require('telekasten').follow_link()<CR>
nnoremap <silent> <leader>zT <cmd>lua require('telekasten').goto_today()<CR>
nnoremap <silent> <leader>zW <cmd>lua require('telekasten').goto_thisweek()<CR>
nnoremap <silent> <leader>zw <cmd>lua require('telekasten').find_weekly_notes()<CR>
nnoremap <silent> <leader>zn <cmd>lua require('telekasten').new_note()<CR>
nnoremap <silent> <leader>zN <cmd>lua require('telekasten').new_templated_note()<CR>
nnoremap <silent> <leader>zy <cmd>lua require('telekasten').yank_notelink()<CR>
nnoremap <silent> <leader>zi <cmd>lua require('telekasten').paste_img_and_link()<CR>
nnoremap <silent> <leader>zt <cmd>lua require('telekasten').toggle_todo()<CR>
nnoremap <silent> <leader>zb <cmd>lua require('telekasten').show_backlinks()<CR>
nnoremap <silent> <leader>zI <cmd>lua require('telekasten').insert_img_link({ i=true })<CR>
nnoremap <silent> <leader>zp <cmd>lua require('telekasten').preview_img()<CR>
nnoremap <silent> <leader>zm <cmd>lua require('telekasten').browse_media()<CR>
nnoremap <silent> <leader>za <cmd>lua require('telekasten').show_tags()<CR>
nnoremap <silent> <leader>zr <cmd>lua require('telekasten').rename_note()<CR>
lua <<EOF
local home = vim.fn.expand("~/Documents/Notes")
require('telekasten').setup({
    home = home,
    plug_into_calendar = false,
    insert_after_inserting = false,
    media_previewer = "catimg-previewer",
})
EOF


" nvim-dap
nnoremap <silent> <F4> :lua require'dap'.terminate()<CR>
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>dc :lua require'dapui'.close()<CR>
nnoremap <silent> <leader>dd :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>db :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <leader>dc <cmd>Telescope dap commands<cr>
" nnoremap <leader>dp <cmd>Telescope dap list_breakpoints<cr>
" nnoremap <leader>dv <cmd>Telescope dap variables<cr>
" nnoremap <leader>df <cmd>Telescope dap frames<cr>
nnoremap <leader>dl :lua require('dap.ext.vscode').load_launchjs()<CR>
nnoremap <silent> <leader>dt :lua require('dapui').close()<CR>
lua <<EOF
local dap, dapui = require('dap'), require('dapui')
dapui.setup {
    layouts = {
        {
            elements = {
                { id = "stacks", size = 0.1 },
                { id = "watches", size = 0.05 },
                { id = "scopes", size = 0.75 },
                { id = "breakpoints", size = 0.1 },
            },
            size = 60,
            position = "left",
        },
        -- {
        --   elements = {
        --     "console",
        --   },
        --   size = 10,
        --   position = "bottom",
        -- },
    },
}
dap.listeners.after.event_initialized["dapui.config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui.config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui.config"] = function()
    dapui.close()
end
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/usr/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
}
pcall(function() require('dap.ext.vscode').load_launchjs() end)
EOF


" neoscroll
" lua <<EOF
" require('neoscroll').setup {
"     -- All these keys will be mapped to their corresponding default scrolling animation
"     mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
"         '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
"     hide_cursor = true, -- Hide cursor while scrolling
"     stop_eof = true, -- Stop at <EOF> when scrolling downwards
"     use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
"     respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
"     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
"     easing_function = nil, -- Default easing function
"     pre_hook = nil, -- Function to run before the scrolling animation starts
"     post_hook = nil, -- Function to run after the scrolling animation ends
"     performance_mode = false, -- Disable "Performance Mode" on all buffers.
" }
" local t    = {}
" -- Syntax: t[keys] = {function, {function arguments}}
" t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '20' } }
" t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '20' } }
" t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '50' } }
" t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50' } }
" t['<C-y>'] = { 'scroll', { '-0.10', 'false', '50' } }
" t['<C-e>'] = { 'scroll', { '0.10', 'false', '50' } }
" t['zt']    = { 'zt', { '60' } }
" t['zz']    = { 'zz', { '60' } }
" t['zb']    = { 'zb', { '60' } }
" require('neoscroll.config').set_mappings(t)
" EOF


" dressing
lua <<EOF
require('dressing').setup{
    input = {
        win_options = {
            winblend = 0,
        },
        insert_only = false,
        min_width = { 70, 0.2 }
    },
}
EOF


" treesitter
lua <<EOF
local big_file_buffers = {}
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function(params)
        if big_file_buffers[params.buf] == true then
            return
        end
        local line_count = vim.api.nvim_buf_line_count(params.buf)
        local file_size = vim.api.nvim_buf_get_offset(params.buf, line_count)
        if file_size > 1024 * 1024 * 50 or file_size / line_count > vim.o.synmaxcol then -- >50mb
            big_file_buffers[params.buf] = true
            vim.bo.filetype = "bigfile"
            vim.wo.wrap = false
        end
    end,
})

function treesitter_cursor_lang(buf)
    local buf = buf or vim.api.nvim_get_current_buf()

    local ok, lang = pcall(function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        return vim.treesitter
            .get_parser(0)
            :language_for_range({ cursor[1] - 1, cursor[2], cursor[1] - 1, cursor[2] })
            :lang()
    end)

    if not ok then
        return nil
    end

    return lang
end

-- ts-context-language-hooks
local context_state = {
    default = {},
    lang = nil,
    buf = nil,
}
vim.api.nvim_create_autocmd({"BufNew", "BufRead"}, {
    callback = function(params)
        context_state.default[params.buf] = {
            iskeyword = vim.bo.iskeyword or vim.o.iskeyword,
            formatoptions = vim.bo.formatoptions or vim.o.formatoptions,
        }
    end
})

local function parse_lang_at_cursor(buf)
    local buf = buf or vim.api.nvim_get_current_buf()

    local lang = treesitter_cursor_lang(buf)

    if context_state.lang == lang and context_state.buf == buf then
        return nil
    end

    context_state.lang = lang
    context_state.buf = buf

    return lang
end

function treesitter_parsed_cursor_lang()
    return context_state.lang or ""
end

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function(params)
        local lang = parse_lang_at_cursor(params.buf)

        if lang == nil then
            return
        end

        local hooks = {
            default = function()
                vim.opt_local.iskeyword = context_state.default[params.buf].iskeyword
                vim.opt_local.formatoptions = context_state.default[params.buf].formatoptions
                vim.opt_local.formatoptions:remove("t")
                vim.opt_local.formatoptions:remove("o")
            end,
            php = function()
                vim.opt_local.iskeyword:remove("-")
            end,
            phpdoc = function()
                vim.opt_local.iskeyword:remove("-")
            end,
            vue = function()
                vim.opt_local.formatoptions:remove("r")
                vim.opt_local.formatoptions:remove("j")
            end,
        }

        hooks.default()
        if hooks[lang] ~= nil then
            pcall(hooks[lang])
        end
    end,
})

vim.opt.runtimepath:append(vim.fn.stdpath('data') .. "/nvim-treesitter")
require("nvim-treesitter.configs").setup({
    parser_install_dir = vim.fn.stdpath('data') .. "/nvim-treesitter",
    ensure_installed = {
        "c",
        "vim",
        "lua",
        "python",
        "bash",
        "javascript",
        "typescript",
        "vue",
        "yaml",
        "html",
        "twig",
        "php",
        "phpdoc",
        "css",
        "scss",
    },
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            if(bufnr == nil or big_file_buffers[bufnr] == true) then
                return false
            end
            local line_count = vim.api.nvim_buf_line_count(bufnr)
            local file_size = vim.api.nvim_buf_get_offset(bufnr, line_count)
            return file_size == -1 or file_size / line_count > vim.o.synmaxcol
        end,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    indent = {
        enable = true,
    },
    matchup = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "vv",
            node_incremental = "v",
            scope_incremental = "<c-v>",
            node_decremental = "V",
        },
    },
})


require('hlargs').setup {
    highlight = {
        link = '@parameter',
    },
}


require('Comment').setup {
    -- toggler = {
    --     line = 'gcc',
    --     block = 'gCC',
    -- },
    -- opleader = {
    --     line = 'gc',
    --     block = 'gC',
    -- },
    toggler = {
        line = '<leader>//',
        block = '<leader>??',
    },
    opleader = {
        line = '<leader>/',
        block = '<leader>?',
    },
    mappings = {
        basic = true,
        extra = false,
        extended = false,
    },
    pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        local U = require('Comment.utils')

        -- Determine whether to use linewise or blockwise commentstring
        local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

        -- Determine the location where to calculate commentstring from
        local location = nil
        if ctx.ctype == U.ctype.blockwise then
            location = require('ts_context_commentstring.utils').get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
        end

        return require('ts_context_commentstring.internal').calculate_commentstring({
            key = type,
            location = location,
        })
    end,
}

-- ts-node-action
require("ts-node-action").setup({})
vim.keymap.set({ "n" }, "<C-k>", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
EOF


" copilot.vim
highlight CopilotSuggestion gui=italic guifg=#aaaaaa ctermfg=8
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true
let g:copilot_filetypes = {
  \ 'TelescopePrompt': v:false,
  \ 'DressingInput': v:false,
  \ }
inoremap <silent><expr> <Right> v:lua.copilot_accept(v:true)
inoremap <silent><expr> <S-Right> v:lua.copilot_accept(v:false)
lua <<EOF
function _G.copilot_accept(first_line)
    local expr = vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Right>", true, false, true))
    if first_line then
        expr = expr:gsub(
            "copilot#TextQueuedForInsertion%(%)",
            "v:lua.copilot_insert_first_line()"
        )
    end
    return expr
end
function copilot_insert_first_line()
    local completed = vim.fn["copilot#TextQueuedForInsertion"]()
    local completeSplits = vim.split(completed, "\n");
    local result = completeSplits[1];

    if completed:match("^\n") then
      result = "\n" .. completeSplits[2]
    end

    return result
end
EOF


" lspconfig setup
" lsp
nnoremap <silent> [e <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]e <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>e <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <leader>E <cmd>Telescope diagnostics<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> gy <cmd>Telescope lsp_type_definitions<CR>
nnoremap <silent> gi <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> gr <cmd>Telescope lsp_references<CR>
inoremap <silent> <c-f> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
vnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.range_code_action()<CR>
nnoremap <silent> gq <cmd>lua vim.lsp.buf.format({ async = true })<CR>

lua <<EOF
vim.diagnostic.config({
    virtual_text = false,
    underline = true,
})

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    opts.stylize_markdown = true
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


-- mason
require("mason").setup({
    install_root_dir = '/usr/share/nvim/mason',
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
require("mason-lspconfig").setup({
    automatic_installation = true,
})


local function root_dir(pattern, bufnr, cwd)
    -- local home = vim.fn.expand("~")
    -- TODO
    local home = '/home/tobias'
    if cwd == nil then
        cwd = require("lspconfig.util").root_pattern(".git")(pattern)
        if cwd == home or cwd == nil then
            cwd = vim.loop.cwd()
        end
    end
    return cwd ~= home and cwd or vim.fn.stdpath("data")
end

local function on_attach(client, bufnr)
    -- if not buffer_file_size_below(bufnr, 1024) then
    --     vim.lsp.buf_detach_client(bufnr, client.id)
    --     return
    -- end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
                    if client.server_capabilities.documentHighlightProvider then
                        vim.lsp.buf.document_highlight()
                        return
                    end
                end
            end,
            buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
        })
    end
    -- print(vim.inspect(client.server_capabilities))
    if client.server_capabilities.documentSymbolProvider == true then
        vim.g.navic_silence = true
        require('nvim-navic').attach(client, bufnr)
    end

    -- useful??
    if client.server_capabilities.definitionProvider == true then
        vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end
    if client.server_capabilities.documentFormattingProvider == true then
        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    end
end

-- Add additional capabilities supported by nvim-cmp
capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Add additional capabilities required by nvim-ufo
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local nvim_lsp = require("lspconfig")
nvim_lsp.vimls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
nvim_lsp.html.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
    filetypes = { "html", "twig", "blade" },
})
nvim_lsp.emmet_ls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby", "twig" },
})
nvim_lsp.lemminx.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.sqls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.jdtls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.pyright.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})

-- composer global require php-stubs/wordpress-globals php-stubs/wordpress-stubs php-stubs/woocommerce-stubs php-stubs/acf-pro-stubs wpsyntex/polylang-stubs php-stubs/genesis-stubs php-stubs/wp-cli-stubs
nvim_lsp.intelephense.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
    settings = {
        intelephense = {
            stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang",
            },
            files = {
                maxSize = 5000000,
            },
        },
    },
})
nvim_lsp.bashls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.marksman.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.tailwindcss.setup({
    capabilities = capabilities,
    root_dir = function(pattern)
        return root_dir(
            pattern,
            require("lspconfig.util").root_pattern(
                "tailwind.config.js",
                "tailwind.config.ts",
                "postcss.config.js",
                "postcss.config.ts"
            )(pattern)
        )
    end,
    on_attach = on_attach,
})
nvim_lsp.clangd.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.jsonls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.cssls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
})
nvim_lsp.yamlls.setup({
    capabilities = capabilities,
    root_dir = root_dir,
    on_attach = on_attach,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "openapi.yaml",
            },
        },
    },
})
nvim_lsp.tsserver.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        return on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    root_dir = root_dir,
})
nvim_lsp.volar.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        return on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    root_dir = root_dir,
})

-- null-ls setup
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.prettier.with({
            disabled_filetypes = { "html" },
            extra_args = function(params)
                return params.options
                    and params.options.tabSize
                    and {
                        "--tab-width",
                        params.options.tabSize,
                    }
            end,
        }),
        -- require("null-ls-embedded").nls_source
    },
})


-- Autocompletion
-- luasnip setup
local luasnip = require("luasnip")
luasnip.setup({
    update_events = { 'TextChanged', 'TextChangedI', 'InsertLeave' },
    delete_check_events = { 'InsertLeave', 'CursorHold' },
    region_check_events = { 'InsertEnter', 'CursorHold' },
    ft_func = function()
        local ft = require("luasnip.extras.filetype_functions").from_cursor_pos()
        if #ft > 0 then
            return ft
        end

        return require("luasnip.extras.filetype_functions").from_filetype()
    end
})

vim.keymap.set({ "i", "s" }, "<C-p>", function ()
  if luasnip.locally_jumpable(-1) then
    luasnip.jump(-1)
  end
end)
vim.keymap.set({ "i", "s" }, "<C-n>", function ()
  if luasnip.locally_jumpable(1) then
    luasnip.jump(1)
  end
end)

vim.defer_fn(function()
  require("luasnip.loaders.from_vscode").load()
end, 3000)

-- stupidly complicated snippet definitions
luasnip.add_snippets("php", {
    luasnip.snippet("p", {
        luasnip.text_node({ "<?php", "" }),
        luasnip.insert_node(0),
    }),
    luasnip.snippet("pp", {
        luasnip.text_node("<?php "),
        luasnip.insert_node(0),
        luasnip.text_node(" ?>"),
    }),
    luasnip.snippet("pe", {
        luasnip.text_node("<?= "),
        luasnip.insert_node(0),
        luasnip.text_node(" ?>"),
    }),
})

-- nvim-cmp setup
local cmp = require("cmp")

local mapping = {
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }),
    ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<Space>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_selected_entry() ~= nil then
            cmp.confirm()
        else
            fallback()
        end
    end, { "i", "c" }),
    ["<Tab>"] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        c = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, { "i", "c" }),
}
local lspkind = require("lspkind")
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[LuaSnip]",
    cmp_tabnine = "[AI]",
    path = "[Path]",
    omni = "[OMNI]",
    cmdline = "[CMD]",
    zsh = "[ZSH]",
    treesitter = "[TS]",
}
local buffer_src = {
    name = "buffer",
    option = {
        keyword_pattern = "\\K\\k*",
        get_bufnrs = function()
            local bufs = {}
            for _, nr in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_loaded(nr) then
                    bufs[nr] = true
                end
            end
            return vim.tbl_keys(bufs)
        end,
    },
}
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    -- view = {
    --     entries = 'native'
    -- },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = menu .. " " .. entry.completion_item.data.detail
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            vim_item.abbr = string.sub(vim_item.abbr, 1, 100)
            return vim_item
        end,
    },
    experimental = {
        ghost_text = false,
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            -- require("cmp_tabnine.compare"),
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    mapping = mapping,
    sources = {
        { name = "nvim_lsp", max_item_count = 32 },
        { name = "luasnip" },
        -- { name = "cmp_tabnine" },
        buffer_src,
        { name = "path" },
    },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
--     mapping = mapping,
--     sources = {
--         {
--             name = "buffer",
--             option = {
--                 keyword_pattern = "\\K\\k*",
--             },
--         },
--     },
-- })
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    completion = {
        autocomplete = false,
    },
    mapping = mapping,
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})
cmp.setup.filetype("gitcommit", {
    mapping = mapping,
    sources = {
        { name = "conventionalcommits" },
        { name = "path" },
        buffer_src,
    },
})
cmp.setup.filetype("TelescopePrompt", {
    enabled = false,
})
cmp.setup.filetype({ "deoledit", "zsh" }, {
    mapping = mapping,
    sources = {
        { name = "path" },
        { name = "zsh", zshrc = true },
        buffer_src,
    }
})
EOF


" lualine
lua <<EOF
local colors = {
    color3 = '#303030',
    color6 = '#9e9e9e',
    color7 = '#80a0ff',
    color8 = '#ae81ff',
    color0 = '#1c1c1c',
    color1 = '#ff5189',
    color2 = '#c6c6c6',
}
local navic = require("nvim-navic")
require('lualine').setup {
    options = {
        theme = {
            replace = {
                a = { fg = colors.color0, bg = colors.color1 },
                b = { fg = colors.color2, bg = colors.color3 }
            },
            inactive = {
                a = { fg = colors.color6, bg = colors.color3 },
                b = { fg = colors.color6, bg = colors.color3 },
                c = { fg = colors.color6, bg = colors.color3 }
            },
            normal = {
                a = { fg = colors.color0, bg = colors.color7 },
                b = { fg = colors.color2, bg = colors.color3 },
                c = { fg = colors.color2, bg = colors.color3 }
            },
            visual = {
                a = { fg = colors.color0, bg = colors.color8 },
                b = { fg = colors.color2, bg = colors.color3 }
            },
            terminal = {
                a = { fg = colors.color0, bg = colors.color2 },
                b = { fg = colors.color2, bg = colors.color3 }
            },
            insert = {
                a = { fg = colors.color0, bg = colors.color2 },
                b = { fg = colors.color2, bg = colors.color3 }
            }
        },
        icons_enabled = true,
        section_separators = { left = ' ', right = ' ' },
        component_separators = { left = '', right = '' },
    },
    tabline = {
        lualine_a = {},
        -- lualine_a = {'windows'},
        lualine_b = {{ navic.get_location, cond = navic.is_available },},
        lualine_c = {'lsp_progress'},
        lualine_x = {},
        lualine_y = {'windows'},
        lualine_z = {'tabs'}
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 
            'branch', {
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                path = 3, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 20 spaces in the window
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                }
            }
        },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat', 'filetype', { treesitter_parsed_cursor_lang } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
EOF


" context.vim
" let g:context_highlight_border = '<hide>'
let g:context_highlight_tag = '<hide>'
" let g:context_highlight_normal = 'Comment'
let g:context_add_mappings = v:false
let g:context_max_height = 6
let g:context_enabled = 0
let g:context_add_autocmds = 0
autocmd VimEnter * ContextActivate
autocmd WinLeave * silent! ContextDisableWindow
autocmd CursorHold * silent! ContextEnableWindow
autocmd BufEnter * silent! ContextEnableWindow
autocmd BufEnter term://* silent! ContextDisableWindow
autocmd BufAdd * silent! call context#update('BufAdd')
autocmd BufEnter * silent! call context#update('BufEnter')
" autocmd CursorMoved * silent! call context#update('CursorMoved')
" autocmd WinScrolled * silent! call context#update('WinScrolled')
autocmd CursorHold * silent! call context#update('CursorHold')
autocmd VimResized * silent! call context#update('VimResized')
autocmd WinResized * silent! call context#update('WinResized')
autocmd OptionSet number,relativenumber,numberwidth,signcolumn,tabstop,list 
        \ silent! call context#update('OptionSet')



" temporary treesitter highlight backwards compatibility
" lua <<EOF
" local hl = function(group, opts)
"     opts.default = true
"     vim.api.nvim_set_hl(0, group, opts)
" end
"
" -- Misc {{{
" hl('@comment', {link = 'Comment'})
" -- hl('@error', {link = 'Error'})
" hl('@none', {bg = 'NONE', fg = 'NONE'})
" hl('@preproc', {link = 'PreProc'})
" hl('@define', {link = 'Define'})
" hl('@operator', {link = 'Operator'})
" -- }}}
"
" -- Punctuation {{{
" hl('@punctuation.delimiter', {link = 'Delimiter'})
" hl('@punctuation.bracket', {link = 'Delimiter'})
" hl('@punctuation.special', {link = 'Delimiter'})
" -- }}}
"
" -- Literals {{{
" hl('@string', {link = 'String'})
" hl('@string.regex', {link = 'String'})
" hl('@string.escape', {link = 'SpecialChar'})
" hl('@string.special', {link = 'SpecialChar'})
"
" hl('@character', {link = 'Character'})
" hl('@character.special', {link = 'SpecialChar'})
"
" hl('@boolean', {link = 'Boolean'})
" hl('@number', {link = 'Number'})
" hl('@float', {link = 'Float'})
" -- }}}
"
" -- Functions {{{
" hl('@function', {link = 'Function'})
" hl('@function.call', {link = 'Function'})
" hl('@function.builtin', {link = 'Special'})
" hl('@function.macro', {link = 'Macro'})
"
" hl('@method', {link = 'Function'})
" hl('@method.call', {link = 'Function'})
"
" hl('@constructor', {link = 'Special'})
" hl('@parameter', {link = 'Identifier'})
" -- }}}
"
" -- Keywords {{{
" hl('@keyword', {link = 'Keyword'})
" hl('@keyword.function', {link = 'Keyword'})
" hl('@keyword.operator', {link = 'Keyword'})
" hl('@keyword.return', {link = 'Keyword'})
"
" hl('@conditional', {link = 'Conditional'})
" hl('@repeat', {link = 'Repeat'})
" hl('@debug', {link = 'Debug'})
" hl('@label', {link = 'Label'})
" hl('@include', {link = 'Include'})
" hl('@exception', {link = 'Exception'})
" -- }}}
"
" -- Types {{{
" hl('@type', {link = 'Type'})
" hl('@type.builtin', {link = 'Type'})
" hl('@type.qualifier', {link = 'Type'})
" hl('@type.definition', {link = 'Typedef'})
"
" hl('@storageclass', {link = 'StorageClass'})
" hl('@attribute', {link = 'PreProc'})
" hl('@field', {link = 'Identifier'})
" hl('@property', {link = 'Identifier'})
" -- }}}
"
" -- Identifiers {{{
" hl('@variable', {link = 'Normal'})
" hl('@variable.builtin', {link = 'Special'})
"
" hl('@constant', {link = 'Constant'})
" hl('@constant.builtin', {link = 'Special'})
" hl('@constant.macro', {link = 'Define'})
"
" hl('@namespace', {link = 'Include'})
" hl('@symbol', {link = 'Identifier'})
" -- }}}
"
" -- Text {{{
" hl('@text', {link = 'Normal'})
" hl('@text.strong', {bold = true})
" hl('@text.emphasis', {italic = true})
" hl('@text.underline', {underline = true})
" hl('@text.strike', {strikethrough = true})
" hl('@text.title', {link = 'Title'})
" hl('@text.literal', {link = 'String'})
" hl('@text.uri', {link = 'Underlined'})
" hl('@text.math', {link = 'Special'})
" hl('@text.environment', {link = 'Macro'})
" hl('@text.environment.name', {link = 'Type'})
" hl('@text.reference', {link = 'Constant'})
"
" hl('@text.todo', {link = 'Todo'})
" hl('@text.note', {link = 'SpecialComment'})
" hl('@text.warning', {link = 'WarningMsg'})
" hl('@text.danger', {link = 'ErrorMsg'})
" -- }}}
"
" -- Tags {{{
" hl('@tag', {link = 'Tag'})
" hl('@tag.attribute', {link = 'Identifier'})
" hl('@tag.delimiter', {link = 'Delimiter'})
" -- }}}
