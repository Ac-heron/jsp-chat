set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" ========================= Default Settings End =========================  
"                                    .                 
"                    ##############.....   #############  
"                    ##############....... #############   
"                      ##########..........###########     
"                      ##########........###########       
"                      ##########.......##########        
"                      ##########.....##########..        
"                     .##########....##########.....      
"                   ...##########..##########.........    
"                 .....##########.#########.............  
"                   ...################GGG............    
"                    . ################.............      
"                      ##############.GGG...GGGGGGGGGG      
"                      ############...GG...GG..GG  GG     
"                      ##########....GG...GG..GG  GG      
"                      ########.....GGG..GGG GGG GGG     
"                      ######    .........                
"                                  .....                  
"                                    .       
"
"
" 
"                         www.iacheron.com   
"                         2015.5.1 
"
"
"
"
" ========================= My Vim Settings Start =========================  

" 插件管理
execute pathogen#infect()


" 配色方案
set background=dark
"colorscheme molokai
colorscheme solarized

" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 禁止折行
set nowrap

" 代码折叠
set fdm=indent
" 选择代码折叠类型
set foldmethod=syntax
" 禁止自动折叠
set foldlevel=100

" No back up files 
set nobackup
set nowritebackup
set noswapfile
" 设置退格键可用
set backspace=2


" 命令行的高度，默认为1
set cmdheight=1

" Encoding setting
set encoding=utf-8
" 解决consle输出乱码
language messages zh_CN.utf-8
" 指定语言
set guifont=YaHei\ Consolas\ Hybrid:h12
" 设置文件编码支持格式
set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936
" Menu Language
" set langmenu=zh_CN.utf-8
set langmenu=en_US.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" ========================= Plugins Settings Start =========================  
filetype plugin on

" [ indent-guilde ]
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1 

" [ vim-airline ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" [ vim-multiple-cursors ]
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" [minibufexpl]
let g:miniBufExplUseSingleClick = 1

" [ctrlP]


" ========================= Key Mapping  Settings Start =========================  


" [ tagbar ] 
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='d:\javatools\ctags58\ctags.exe'
let g:tagbar_width=30
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" [ FullScreen ]
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
imap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
au GUIEnter * simalt ~x

" [ NERDTree ] 
map <F7> :NERDTreeToggle<CR> 
imap <F7> <ESC>:NERDTreeToggle<CR>

" [ undotree ]
nnoremap <F5> :UndotreeToggle<cr>

" [ Menu and Toor bar ]
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" ========================= Key Mapping  Settings End=========================  
