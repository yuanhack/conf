" 在处理未保存或只读文件的时候，弹出确认  
set confirm

" 不要使用vi的键盘模式，而是vim自己的  
set nocompatible

" history文件中需要记录的行数  
set history=500

set report=0

" 高亮显示匹配括号
set showmatch

" 正在被搜索的词句高亮显示
set hlsearch

" 正在被搜索的词句不高亮显示
"set nohlsearch

" 搜索输入时逐字符高亮显示和查找
set incsearch


set nonumber
set ruler
set showcmd
set tags+=~/.systag

"set nocompatible
filetype plugin indent on

set ts=4            " tabstop
set sw=4            " shiftwidth 
"set et              " expandtab tab自动转换空格
autocmd FileType c,cpp set sw=4 | set ts=4 | set et 

set pastetoggle=<F5>
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
set cindent 
set laststatus=2 " 总是显示状态栏
"set mouse=a      " 此开关当用鼠标选择时不选择行号, 关闭该项mouse=
"set cursorline   " 设置光标行标识后，下划线'_'导致在行中无法区分！
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white 
"hi CursorLine  cterm=bold ctermbg=0
"highlight StatusLine cterm=italic ctermfg=10 ctermbg=4
""highlight StatusLine cterm=none ctermfg=10 ctermbg=4
"highlight statusline term=bold ctermbg=5 guibg=DarkMagenta
" set foldmethod=syntax
syntax on

" 窗口切换
nmap <F2>       <ESC>
imap <F2>       <ESC>l

" 代码高亮开关键定义 Fangxm
nmap <silent> <F3> :if exists("syntax_on") <Bar>
	\   syntax off <Bar>
	\ else <Bar>
	\   syntax on <Bar>
	\ endif <CR>
nmap <F4> :Tlist

" map <F6> <Esc>:1,$g/^[  ]*$/d<CR><Esc> " 删除空白行，包括 空格和 tab键 的空行
" map <F6> <Esc>:1,$g/^$/d<CR><Esc> 		" 删除空行

" null line delete
"cmap nld 	<esc>:1,$g/^$/d<CR><esc>
"imap nld<cr> <esc>:1,$g/^$/d<CR><esc>
map dnl 	<esc>:1,$g/^$/d<CR><esc>

function Del()
	execute dnl
endfunction

" <F7> vimgdb 占用

"nmap <F8> :set number<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" FAST COMMENT OR DEL COMMENT
vmap // !awk '{print "//"$0}' 
vmap \\ !awk '{print substr($0,3)}' 
vmap # !awk '{ print "\# "$0}' 
vmap " !awk '{ print "\" "$0}' 
vmap 3 !awk '{ print substr($0,3)}' 

" 快捷设置查找高亮开关
" s + 回车
map s<cr>  :set hlsearch
map s<esc> :set nohlsearch

" 手工折叠
nmap fm<cr> :set foldmethod=manual<cr>
" 标记折叠
nmap fs<cr> :set foldmethod=syntax<cr>
" 折叠开关命令 zi

" cscope 快捷建库
" 虽然可以快速重新生成cscope.out和相关文件并建立联系,但是有这么一个问题存在:
"   当前编辑的一个文件时间会被修改，切换文件的时候会提示 .swp 
"   无法消除这个提示和 .swp文件只能退出vim才能删除, 必须退出vim重进, 让人很不舒服
" nmap <F11>      :cs kill 0<cr>:!cscope -Rbq<cr>:cs add cscope.out<CR>:!echo cscope has reconstruction<cr>
" imap <F11> <ESC>:cs kill 0<cr>:!cscope -Rbq<cr>:cs add cscope.out<CR>:!echo cscope has reconstruction<cr>

" 禁用ctrl+z切换vim到后台,不然ctrl+z之后,fg回到vim后,cscope的连接就失效了,没找到办法回复,重建连接也不行
map  :f

" ctags 快捷生成
nmap <F12>      :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .; echo ctags has reconstruction<CR>
imap <F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .; echo ctags has reconstruction<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Insert standard header according to the file name
" for example:
"   #ifndef _SOME_H_
"   #define _SOME_H_
"
"   #endif  /* _SOME_H_ */
" Usage:
"   :AddHdr     /* or */
"   :call AddH()
:command -nargs=* AddH call AddH(<f-args>)
function AddH()
	"let hdr = printf("__YH_%s__", toupper(tr(bufname("%"), ".", "_")))
  " 取文件名(含PATH)转换为宏, /和.都转换为_
	let hdr = printf("__YH_%s__", toupper(tr(tr(bufname("%"), ".", "_"), "/", "_")))
	call append("0", "#ifndef " . hdr)
	call append("1", "#define " . hdr)
	call append("2", "")
	call append("3", "")
	call append("4", "#ifdef __cplusplus")
	call append("5", "extern \"C\"") 
	call append("6", "{")
	call append("7", "#endif")
	call append("8", "")
	call append("9", "#pragma pack(push)")
	call append("10", "#pragma pack(1)")
	call append("11", "#pragma pack(pop)")
	call append("12", "")
	call append("13", "")
	call append("$", "")
	call append("$", "")
	call append("$", "#ifdef __cplusplus")
	call append("$", "}")
	call append("$", "#endif")
	call append("$", "#endif /* " . hdr . " */")
endfunction


" comment(//) or uncomment your selected(under visual mode) lines
vmap <silent> // :!sed 's/^/\/\//'<CR>
vmap <silent> \\ :!sed 's/^\/\///'<CR>

" comment(#) or uncomment your select (use visual mode) lines
vmap <silent> #  :!sed 's/^/\#/'<CR>
vmap <silent> \# :!sed 's/^\#//'<CR>

" comment(/*  */) or uncomment your selected(under visual mode) lines
vmap <silent> /* <Esc><Esc>:'< !sed 's/^/\/* /'<Esc>:'> !sed 's/$/ *\//'<CR>
vmap <silent> \* <Esc><Esc>:'< !sed 's/^\/\* //'<Esc>:'> !sed 's/ \*\/$//'<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" 设置cscope快捷键
cs add ./cscope.out
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR> 
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" 设置使用 QuickFix 窗口显示 cscope, make 等结果
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
nmap <F9>  :cp<cr>
nmap <F10> :cn<cr>

" 让vim记忆上次编辑的位置
if has("autocmd")
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif
"------------------------

" 加载vimgdb按键映射
:command -nargs=* GDB call GDB(<f-args>)
function GDB()
    run macros/gdb_mappings.vim
endfunction
nmap g<CR>      <ESC>:GDB<CR>
imap <ESC>g<CR> <ESC>:GDB<CR>li
nmap <F11>       <ESC>:bel 30vsplit gdb-variables<CR>
imap <F11>       <ESC>:bel 30vsplit gdb-variables<CR>li

