" must set first
if &compatible | set nocompatible | endif
let mapleader="\\"
let g:mapleader="\\"
let maplocalleader=","
let g:maplocalleader=","
set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

" install bundles by Vundle
if filereadable(expand("~/.vimrc.bundle"))
  source ~/.vimrc.bundle
endif

" boolean options
set autoindent
set autoread
set autowrite "Automatically save before commands like :next and :make
set hidden
set list ruler
set modeline
set backup undofile
set nocursorline nocursorcolumn
set nowrap nospell
set incsearch" Incremental search

" numerical options
set laststatus=2 " show the status line all the time
set history=1000
set timeoutlen=1000
set ttimeoutlen=10
set textwidth=100
set colorcolumn=+1
set synmaxcol=800
set undolevels=1000
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" string options
set encoding=utf-8
set fileencodings=utf-8,default,latin1
set helplang=en
set printoptions=paper:letter
set commentstring=\/\/\ %s
set virtualedit=block
set wildmode=list:longest,full
set backspace=indent,eol,start
set wildignore+=*.o,*.obj,*~,*.class,*.pyc
set wildignore+=*.png,*.jpg,*.gif,*.xpm,*.tiff
set spelllang=en_us
set complete=.,w,b,u,t,i
set completeopt=longest,menu,preview

if (&termencoding==#'utf-8'||&encoding==#'utf-8') && version >= 700
  " tab:▸ ,trail:␣
  let &listchars = "tab:\u25b8\u0020,trail:\u2423"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif
if has('clipboard') | set clipboard=unnamed | endif
let &backupdir = $HOME.'/.vim/tmp/backup,/tmp,.'
let &undodir = $HOME.'/.vim/tmp/undo,/tmp,.'
let &directory = $HOME.'/.vim/tmp/swap,/tmp,.'

if executable('grep')
  set grepprg=grep\ -rnH\
        \ --exclude='*.swp'\
        \ --exclude='*~'\
        \ --exclude='cscope.files'\
        \ --exclude='cscope.out'\
        \ --exclude='tags'\
        \ --exclude-dir='.git'
endif

if has('syntax') | syntax on | endif

if &t_Co==256
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if has('gui')&&has('gui_running')
  set background=light
  colorscheme solarized
else
  " let g:solarized_termcolors=256
  " let g:solarized_termtrans=1
  set background=dark
  colorscheme solarized
endif

" }}}

" autocmd related settings {{{1
if has('autocmd')
  filetype plugin indent on

  augroup MsicOption
    autocmd!
    autocmd FileType help,qf nnoremap <silent><buffer> q :q<CR>
    " Return to last edit position
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \     exe "normal! g`\"" |
          \ endif
  augroup END

  augroup FTDetect
    autocmd!
    autocmd Bufnew,BufRead *.md setlocal filetype=markdown
    autocmd Bufnew,BufRead *.sql setlocal filetype=mysql
  augroup END

endif "has('autocmd')

" }}}

" remove toolbar, scrolling bar, menu
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r guioptions-=m


" set guifont=Courier\ New:h10
set guifont=Consolas:h14
command! -bar -nargs=0 Bigger
            \ :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
command! -bar -nargs=0 Smaller
            \ :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')

" avoid chinese menu missing encoding
source $vimruntime/delmenu.vim
source $vimruntime/menu.vim

" set messages to English
language messages en_US.utf-8

" ctrlp
let g:ctrlp_cmd = 'CtrlPMRUFiles'

