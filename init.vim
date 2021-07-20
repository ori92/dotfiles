" Config downloaded from: https://github.com/sharkdp/config-files/blob/master/nvim/init.vim and modified to fit my needs.

" Set leader key to Space
let mapleader = " "

" spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Do not show startup message
set shortmess=atIO

" Use the mouse to move the cursor
set mouse=a

" Search settings
set ignorecase
set smartcase

" show current command, matching bracket and mode, line numbers
set noshowmatch
let g:loaded_matchparen=1
set number

" Save undo history permanently
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

" show a few lines below the current line
set scrolloff=12

" the same horizontally
set sidescrolloff=15

" Use backspace in normal mode
nnoremap <bs> X

" do not wrap lines automatically
set nowrap

" disable folding everywhere
set nofoldenable

" Use softwrapping in text documents
autocmd FileType text,markdown,tex,html setlocal wrap linebreak
if exists('+breakindent')
    set breakindent
endif

" Use Ctrl-q for quitting, Ctrl-s for saving
noremap <C-Q> :q<CR>
vnoremap <C-Q> <Esc>:q<CR>
inoremap <C-Q> <Esc>:q<CR>

noremap <silent> <C-S>          :write<CR>
vnoremap <silent> <C-S>         <Esc>:write<CR>
inoremap <silent> <C-S>         <Esc>:write<CR>

" Use Ctrl-b to close a buffer
noremap <C-B>   :bd<CR>
vnoremap <C-B>  <Esc>:bd<CR>
inoremap <C-B>  <Esc>:bd<CR>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq

" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'bronson/vim-visual-star-search'
Plug 'tommcdo/vim-exchange'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'terryma/vim-expand-region'
Plug 'derekwyatt/vim-fswitch'

Plug 'sheerun/vim-polyglot'
Plug 'groenewege/vim-less'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'rhysd/vim-clang-format'
Plug 'psf/black'

" Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

" UltiSnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'lambdalisue/suda.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'glepnir/lspsaga.nvim'

" Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Icons
Plug 'ryanoasis/vim-devicons'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"NerdTree
Plug 'preservim/nerdtree'

"Rainbow for colorizing parenthesis
Plug 'luochen1990/rainbow'

" Start page
Plug 'mhinz/vim-startify'

" Multi line select
Plug 'mg979/vim-visual-multi'

" Which key
Plug 'folke/which-key.nvim'

" LspSaga
Plug 'glepnir/lspsaga.nvim'

" Sneak for easy-motion
Plug 'justinmk/vim-sneak'

call plug#end()

" Colorize parenthesis on startup
let rainbow_active = 1

" NerdTree settings
let NERDTreeWinPos = "left" " Set NerdTree on the left side
let NERDTreeShowHidden = 1 " Show hidden files by default
let NERDTreeIgnore = ['\.DS_Store$', '\.git$'] " Ignore git
let NERDTreeWinSize = 24

" Auto install lsp servers (lspinstall)
lua << EOF
    local function setup_servers()
      require'lspinstall'.setup()
      local servers = require'lspinstall'.installed_servers()
      for _, server in pairs(servers) do
        require'lspconfig'[server].setup{}
      end
    end
setup_servers()
EOF

" Plugins default setup
lua << EOF
    require("which-key").setup()
    require('lspsaga').init_lsp_saga()
EOF

" Syntax highlighting
syntax on
colorscheme onedark

" Do not copy on d
nnoremap d "_d
vnoremap d "_d
nnoremap X dd
vnoremap X dd

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Clear search highlight (and redraw screen) with C-l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Toggle NerdTree with leader+t
nnoremap <Leader>t <cmd>NERDTreeToggle<cr>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Autocompletion in command mode
set wildmenu
set wildignore+=*/dist/*,*.pdf,*/output/*,*/bower_components/*,*/target/*,Cargo.lock

" Call make
nmap <silent> <Leader>m :make<CR>

" Swap the current word with the next word (which can be on a newline and
" punctuation is skipped):
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>:noh<CR>

" Move to beginning/end of line while in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Go in and out of paste mode with F10
set pastetoggle=<F10>

" Remember last position when reopening files
set viminfo='10,\"100,:20,%,n~/.viminfo
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Do not insert comment leaders automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Bubble-move (inspired by http://vimcasts.org/episodes/bubbling-text/)
nmap <C-k> [e`]        " single lines
nmap <C-j> ]e`]
vmap <C-k> [e`[V`]     " visual mode
vmap <C-j> ]e`[V`]

" Switch off octal/hex number detection for <C-a>, <C-x>
set nrformats=

" In addition to C-w: delete word around/after the cursor
imap <C-d> <C-o>daw
nmap <C-d> daw

" Duplicate a line / selection and comment out the first
nmap <Leader>c Ypkgccj
vmap <Leader>c gcgvyPgvgc

" Typing gcc is too much
nmap <C-e> gcc
imap <C-e> <C-o>gcc
vmap <C-e> gc

" Copy and paste to system clipboard with <Leader>p and <Leader>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Gnuplot
autocmd BufNewFile,BufRead *.gp set filetype=gnuplot
autocmd FileType gnuplot set commentstring=#\ %s

" Suda
let g:suda_smart_edit = 1

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='onedark'
set noshowmode  " airline already shows it

" Vim Markdown
let g:vim_markdown_folding_disabled=1

" Faster TeX syntax highlighting (disables some highlighting features)
let g:tex_fast="M"

" Use english messages
language en_US.UTF-8

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Add quick mappings for sideways.vim that allow shifting of arguments
nmap <Leader>h :SidewaysLeft<CR>
nmap <Leader>l :SidewaysRight<CR>

" GitGutter keymappings
nmap <Leader>j <Plug>(GitGutterNextHunk)
nmap <Leader>k <Plug>(GitGutterPrevHunk)
nmap <Leader>r <Plug>(GitGutterUndoHunk)
nmap <Leader>a <Plug>(GitGutterStageHunk)
nmap <Leader>v <Plug>(GitGutterPreviewHunk)

let g:tex_flavor='latex'

" Help in detecting the filetype of config files
au BufRead,BufNewFile bashrc.symlink set filetype=sh
au BufRead,BufNewFile alias.symlink set filetype=sh
au BufRead,BufNewFile shellrc.symlink set filetype=sh

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = "<leader>f"  " reFactor

" CartoCSS
autocmd BufNewFile,BufRead *.mss set filetype=less

" jshint
autocmd BufNewFile,BufRead .jshintrc set filetype=json

" LaTeX class files
autocmd BufNewFile,BufRead *.cls set filetype=tex

" Octave
autocmd FileType octave set commentstring=%\ %s

" SSH config
autocmd BufNewFile,BufRead .ssh/config set filetype=sshconfig

" Special indentation for some files
au FileType purescript setl sw=2 st=2
au FileType html setl sw=2 st=2
au FileType markdown setl sw=2
au FileType haskell setl sw=2 st=2
au FileType javascript setl sw=2 st=2
au FileType yaml setl sw=2 st=2
au FileType cpp setl sw=2 st=2

" Insert current date
map <Leader>i "=strftime("%b %d, %Y")<CR>p

" Switch between corresponding files
map <Leader>z :FSHere<CR>

autocmd! BufEnter *.purs let b:fswitchdst = 'js'
autocmd! BufEnter *.js   let b:fswitchdst = 'purs'

" Switch between more files
autocmd! BufEnter *.cpp let b:fswitchdst = 'h'   | let b:fswitchlocs = '../h'
autocmd! BufEnter *.h   let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'

autocmd! BufEnter *.buildconf   let b:fswitchdst = 'rebuildconf' | let b:fswitchlocs = './'
autocmd! BufEnter *.rebuildconf let b:fswitchdst = 'buildconf'   | let b:fswitchlocs = './'

" Scons
map <Leader>s :!scons -D -j1<CR>

" Other ~/ip files
autocmd BufNewFile,BufRead SConscript,SConstruct set filetype=python
autocmd BufNewFile,BufRead *.buildconf,*.rebuildconf set filetype=python
autocmd BufNewFile,BufRead .reporter set filetype=python

" ctags
set tags=TAGS;/

" fzf
nnoremap <C-p> :FZF<cr>

" gitgutter update time [ms]
set updatetime=300
 
" timeout for for which-key popup
set timeoutlen=300

" Copy to clipboard by default
set clipboard+=unnamedplus

" Autoformat
nnoremap <Leader>b :Black<CR>

"Use 24-bit (true-color) mode.
set termguicolors