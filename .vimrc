scriptencoding utf-8

let $VIM_ROOT=$HOME.'/.vim'
set nocompatible

filetype off
filetype plugin indent off

if has('vim_starting')
   set runtimepath+=$VIM_ROOT/bundle/neobundle.vim/
endif
 
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'neomake/neomake'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'davidhalter/jedi-vim'

" install check
NeoBundleCheck
call neobundle#end()

filetype on
filetype plugin indent on

" **basic settings**
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set mouse=n
set hlsearch
syntax enable
set laststatus=2
set statusline=%F%r%h%=
set number
set incsearch
set ignorecase
set wildmenu wildmode=list:full

" set tabstop=4
" set sts=4
" set autoindent
" set cindent
" set expandtab
" set shiftwidth=4

set matchpairs=(:),{:},[:],<:>

" **key map**
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>
nmap <silent> <C-n>      :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>
" quikurun \ + r
nmap <Leader>r <plug>(quickrun) 

" **color**
  " set background="dark"
  " colorscheme solarized
  " let g:solarized_termcolors=256
highlight StatusLine ctermfg=black ctermbg=gray
highlight CursorLine ctermfg=none ctermbg=darkgray cterm=none
highlight MatchParen ctermfg=none ctermbg=darkgray 
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE


" neocomplete setting
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#min_keyword_length = 4
let g:neocomplete#enable_ignore_case = 0
let g:neocomplete#skip_auto_completion_time = '0.3'
let g:neosnippet#snippets_directory = $VIM_ROOT.'/snippets'

imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
nnoremap <silent> <M-Space>ns :NeoSnippetEdit<CR>
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>\<Down>"

" python
let NERDTreeIgnore = ['\.pyc$']
autocmd! BufEnter,BufWritePost * Neomake
" let g:neomake_python_enabled_makers = ['python', 'flake8']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_python_checkers = ['python', 'flake8']
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" vim-powerline setting
let g:Powerline_symbols = 'fancy'

"ctags用キーバインド
nnoremap t  <Nop>
nnoremap tt  <C-]>           「飛ぶ」
nnoremap tj  :<C-u>tag<CR>   「進む」
nnoremap tk  :<C-u>pop<CR>   「戻る」
nnoremap tl  :<C-u>tags<CR>  履歴一覧

"filetypeの設定
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.tt setf html
    autocmd! BufNewFile,BufRead *.md setf markdown
augroup END

" encoding
set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,enc-jisx0213,euc-jp,ucs-bom,eucjp-ms,cp932

" 前回のカーソル位置から再開
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" coffeescript
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd FileType cpp        setlocal sw=2 sts=2 ts=2 et
