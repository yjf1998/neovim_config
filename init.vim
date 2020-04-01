
noremap l h
noremap ; j
noremap p k
noremap ' l
noremap <c-f><CR> :nohlsearch<CR>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR> 
map K \ll
map :goyo :Goyo

let mapleader=" "

syntax on
set wrap
set number
set showcmd
set wildmenu
set cul

set linebreak

set encoding=utf-8
filetype plugin indent on "open file type dection

"Setting of search"
set hlsearch
set incsearch
set smartcase

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("&") | exe "normal! g'\"" | endif 


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'lervag/vimtex'

Plug 'connorholyday/vim-snazzy'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Show files in the folder
Plug 'preservim/nerdtree' 

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Goyo focus on writing
Plug 'junegunn/goyo.vim'

" OceanNext Theme
Plug 'mhartington/oceanic-next'

call plug#end()

" Color Scheme
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" Setting of vimtex 
let g:tex_flavor                     = 'latex'
let g:tex_indent_items                    = 0
let g:Tex_DefaultTargetFormat        = 'pdf'                                                    
let g:Tex_CompileRule_pdf = 'xelatex -src-specials -synctex=1 -interaction=nonstopmode $*'   
let g:Tex_FormatDependency_pdf        = 'pdf'
let g:vimtex_view_method = 'general'
let g:vimtex_enabled = 1
let g:vimtex_complete_img_use_tail = 1

" NerdTree
map tt :NERDTreeToggle<CR>

" Ultisnips Configuration
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-e>"



