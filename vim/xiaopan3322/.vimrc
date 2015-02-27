set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nocp
filetype plugin on
set history=0
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nobackup
set shiftwidth=4
set cinoptions=(0,:0
set expandtab
set uc=0        "do not use swap file when editing
set nu

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal tabstop=4
  autocmd FileType text setlocal textwidth=78
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType xml setlocal shiftwidth=2
else
  set autoindent		" always set autoindenting on
endif

if has("gui_running")
    set guifont=Monaco\ 9
    colorscheme railscasts
else
    colorscheme 256-jungle
endif

"settings for taglist
nnoremap <silent> <F5> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window=1

"settings for minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"winmanager
map<c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr> 

nnoremap <silent> <F2> :WMToggle<CR>

"settings for cscope
if has("cscope")
    set cst
endif


"""""""""""""""""""""""""""""""
" TAGS
"""""""""""""""""""""""""""""""
"set tags=./tags,/home/xiabao/workspace/BF1010/TAGS/COMMON_APPL_ENV/tags,/home/xiabao/workspace/BF1010/TAGS/GLOBAL_ENV/tags,/home/xiabao/workspace/BF1010/TAGS/ENV/tags,/home/xiabao/workspace/BF1010/TAGS/PS_REL/tags,/home/xiabao/workspace/BF1010/TAGS/CPLANE/tags,/home/xiabao/workspace/BF1010/TAGS/COMMON/tags,/home/xiabao/workspace/BF1010/TAGS/ASN1_IF/tags,/home/xiabao/workspace/BF1010/TAGS/OAM_IF/tags,/home/xiabao/workspace/BF1010/TAGS/ISAR_VALFCT/tags,/home/xiabao/workspace/BF1010/TAGS/ISAR_PRTFCT/tags;
