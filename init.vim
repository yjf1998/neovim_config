
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
map T \le
map M <Leader>lv
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

" Vimtex-conceal
Plug 'PietroPate/vim-tex-conceal'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Deoplete
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }

" Wchich Key

Plug 'liuchengxu/vim-which-key'
call plug#end()

" Color Scheme
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" Setting of vimtex 
let g:tex_flavor= 'latex'
let g:Tex_BibtexFlavor = 'bibtex'
" let bibFileName = mainFileName_root.'.bcf'
let g:tex_indent_items                    = 0
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='xelatex -src-specials -synctex=1 -interaction=nonstopmode $*'   
" let g:Tex_CompileRule_pdf = 'mkdir -p build && xelatex -output-directory=build -interaction=nonstopmode $* && cp *. build && cd build && biber'
" let g:Tex_MultipleCompileFormats='pdf,bib,pdf,pdf'
let g:Tex_FormatDependency_pdf='pdf'
let g:vimtex_view_method='skim'
let g:livepreview_previewer = 'open -a Skim'
let g:vimtex_enabled=1
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_skim_sync = 1 
let g:vimtex_view_skim_activate = 1 
" Notice that \le is for error checking in vimtex

" NerdTree
map nt :NERDTreeToggle<CR>

" Ultisnips Configuration
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"Conquer of Completion
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-floaterm',
  \ 'coc-vimtex',
  \ 'coc-explorer',
  \ 'coc-json',
  \ 'coc-yank',
  \ ]
let g:coc_disable_startup_warning = 1
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Deoplete
  call deoplete#custom#var('omni', 'input_patterns', {
          \ 'tex': g:vimtex#re#deoplete
          \})

" WhichKey

 nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
 vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

 call which_key#register('<Space>', "g:which_key_map")
" Create map to add keys to
  let g:which_key_map =  {}

" Define a separator
  let g:which_key_sep = '→'

" Not a fan of floating windows for this
  let g:which_key_use_floating_win = 0

" SINGLE MAPPINGS
let g:which_key_map['e'] = [ ':CocCommand explorer'  , 'explorer' ]
let g:which_key_map['q'] = [ ':wqa!'                  , 'quit' ]
let g:which_key_map['w'] = [ ':w'                    , 'write' ]
let g:which_key_map['b'] = [ 'VimtexCompile'         , 'build' ]
let g:which_key_map['p'] = [ 'VimtexView'            , 'preview in PDF' ]
let g:which_key_map['i'] = [ 'VimtexTocOpen'         , 'index' ]
let g:which_key_map['k'] = [ 'VimtexClean'           , 'kill aux' ]
let g:which_key_map['l'] = [ 'VimtexErrors'          , 'error log' ]
let g:which_key_map['c'] = [ ':VimtexCountWords!'    , 'count' ]
" let g:which_key_map['t'] = [ ':OnlineThesaurusCurrentWord<CR>'      , 'thesaurus' ]
" let g:which_key_map['j'] = [ '<Plug>(easymotion-prefix)' , 'motion' ]


" END
" Register which key map
