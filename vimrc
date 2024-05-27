""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."),"\#########################################################################")
        call append(line(".")+1, "\# File Name:".expand("%"))
        call append(line(".")+2, "\# Author:Donny")
        call append(line(".")+3, "\# Email:wdm666666@gmail.com")
        call append(line(".")+4, "\# Created Time: ".strftime("%c"))
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "")
    elseif expand("%:e") == 'py'
        call setline(1,"\#!/usr/bin/env python")
        call append(line("."),"\#########################################################################")
        call append(line(".")+1, "\# File Name: ".expand("%"))
        call append(line(".")+2, "\# Author:Donny")
        call append(line(".")+3, "\# Email:wdm666666@gmail.com")
        call append(line(".")+4, "\# Created Time: ".strftime("%c"))
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "")
    else
        call setline(1,"/*#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author:程序猴很懒")
        call append(line(".")+2, "\# 欢迎关注、点赞、评论、转发四连击")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "#########################################################################*/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include <bits/stdc++.h>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G


" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"按r编译运行
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc -std=c17 % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ -ltensorflow -std=c++20 % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time sh %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python %"
  elseif &filetype == 'go'
+   exec "!go build %<"
+   exec "!time go run %"
  elseif &filetype == 'html'
    exec "!google-chrome % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置LEADER键为空格
let mapleader=" "
"插件旧版本的一个东西
set nocompatible
"智能大小写
set smartcase
"自动切换工作目录
set autochdir
"打开文件恢复到原来打开的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 设置当文件被改动时自动载入
set autoread
"显示行尾有多余的空格（包括 Tab 键）
"set listchars=tab:»■,trail:■
"set list
"代码补全
set completeopt=preview,menu
"共享剪贴板
set clipboard=unnamed
"在底部显示，当前键入的指令
set showcmd
"从不备份
"set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 为正则表达式开启魔法
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 显示相对行号
set relativenumber
" 使用j+k为ESC
inoremap jk <ESC>
"检查英语单词拼写
"set spell spelllang=en_us
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"取消搜索高亮快捷键"
noremap <LEADER><CR> :nohlsearch<CR>
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
filetype plugin indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 自动补全命令时候使用菜单式匹配列表
set wildmenu
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent

" default updatetime 4000ms is not good for async update
set updatetime=100

"执行宏时不要重绘（良好的性能配置）
set lazyredraw

" 开启256配色
set t_Co=256

"设置分屏快捷键
"禁用s快捷键"
map s <nop>
"sl:右sh:左sk:上sj:下"
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

"设置分屏后光标移到方向
map \ <C-w><C-w>

"设置上下左右移动分屏大小
"map <up> :res +5<CR>
"map <down> :res -5<CR>
"map <left> :vertical resize-5<CR>
"map <right> :vertical resize+5<CR>
map <LEADER>k :res +5<CR>
map <LEADER>j :res -5<CR>
map <LEADER>h :vertical resize-5<CR>
map <LEADER>l :vertical resize+5<CR>

" MarkdownPreview Setting
"按两下空格跳转到下一个'<++>'并修改他'"
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l
inoremap ·· <ESC>/<++><CR>:nohlsearch<CR>c4l
inoremap ~! <++>
inoremap `1 #
inoremap `2 ##
inoremap `3 ###
inoremap `4 ####
inoremap ~1 --------

"上下翻页居中显示 zz居中显示
noremap j jzz
noremap k kzz

"删除Mark标记后面输入要删除的标记
noremap dm :delmarks 
"显示标记 '加上标记跳转到标记处
noremap mk :marks<CR>

" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe 
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map ti :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>

"用空格+sc做拼写检查<space>sc"
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <ESC>ea<C-x>s

"<Leader>T = 删除文件中的所有尾随空格
nmap <Leader>T :%s/\s\+$//<CR>

"<Leader>U = 删除不需要的空行
nmap <Leader>U :g/^$/d<CR>

"按Y 全选
noremap Y ggVGy

"按P 显示粘贴板内容
noremap P :reg<CR>

"按<Leader>B显示编辑过的文件
"按q退出上下翻阅然后按相应的数字选择编辑文件
noremap <LEADER>b :browse oldfiles<CR>

"相邻的重复词                                                                                                                                                                            
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

"可视模式按 * 或 # 搜索当前选择
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" :W sudo 保存文件
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap { {}<ESC>i
:inoremap {<CR> {<CR>}<ESC>O
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"自动补全列表
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim Theme Colors
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'dracula/vim'
Plug 'justb3a/vim-smarties'

" wilder
Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"syntax highlighting
Plug 'sheerun/vim-polyglot'

"View and search LSP symbols, tags
Plug 'liuchengxu/vista.vim'


" Undo Tree
Plug 'mbbill/undotree/'

" File navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Code complete
Plug 'honza/vim-snippets'

"AI Code Complete
Plug 'github/copilot.vim'
Plug 'Exafunction/codeium.vim'

" ChatGPT Neural
Plug 'dense-analysis/neural'
Plug 'muniftanjim/nui.nvim'
Plug 'elpiloto/significant.nvim'

"Plug 'vim-syntastic/syntastic'

"vim terminal in the floating/popup window
Plug 'voldikss/vim-floaterm'   
  
"multiline comment
Plug 'tpope/vim-commentary'

"filetype glyphs (icons)                                                                                                                                                            
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Vim graphical debugger
"Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --force-enable-java'}

"Change Surround examples Press cs"'
Plug 'tpope/vim-surround'
+ 
+ "Rainbow Parentheses Improved
Plug 'luochen1990/rainbow'

" Java Complete
Plug 'artur-shaik/vim-javacomplete2'

" Dash
Plug 'rizzatti/dash.vim'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'kdheepak/lazygit.nvim'

call plug#end()

" ===
" === UNDOTree
" ===
map ut :UndotreeToggle<CR>

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }



" ===
" === wilder
" ===
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'vim',
      \       'fuzzy': 1,
      \     }),
      \     wilder#vim_search_pipeline(),
      \   ),
      \ ])
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
      \ 'border': 'rounded',
      \ 'max_height': '75%',
      \ 'min_height': 0,
      \ 'prompt_position': 'top',
      \ 'reverse': 0,
      \ })))



" ===
" === vim-nerdtree-syntax-highlight (change icons color)
" ===
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:WebDevIconsDefaultFolderSymbolColor = s:git_orange " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:lightGreen " sets the color for files that did not match any rule



" ===
" === Airline
" ===
let g:airline_powerline_fonts = 1

"javacomplete2 java自动补全
autocmd FileType java setlocal omnifunc=javacomplete#Complete



" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === MarkdownPreview
" ===
" 让互联网上的设备可以访问
"let g:mkdp_open_to_the_world = 1
" 回显预览地址链接，方便跳转
"let g:mkdp_echo_preview_url = 1
" 设置云服务器的ip，根据实际设置
" let g:mkdp_open_ip = '180.76.231.255'
"let g:mkdp_open_ip = 'www.codekbug.com'
" 指定端口号
"let g:mkdp_port = '8888'



" ===
" === Markmap
" ===
noremap <Leader>m :CocCommand markmap.watch<CR> " 观看模式
noremap <Leader>M :CocCommand markmap.create<CR> " 创建模式




" ===
" === Vim Theme Colors
" ===

" =====onedark=====
" syntax on
" colorscheme onedark

" =====PaperColor=====
" set background=dark
" colorscheme PaperColor

" =====shades-of-purple=====
" syntax enable
" colorscheme shades_of_purple

" =====dracula=====
" syntax enable
" colorscheme dracula

" =====smarties=====
set background=dark
colorscheme smarties



" ===
" ===Vista
" ===
" You can do the following to show the nearest method/function in your statusline:
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

noremap fv :Vista<CR>




" ===
" === vim terminal in the floating/popup window
" ===
noremap F :FloatermNew<CR>
tnoremap F <C-\><C-n>:FloatermNew<CR>
nnoremap FD :FloatermPrev<CR>
tnoremap FD <C-\><C-n>:FloatermPrev<CR>
nnoremap FG :FloatermNew fzf<CR>
" noremap FR :FloatermNew! g++ -std=c++20 % -o %< && time ./%<<CR>
noremap FR :call CompileRunFGcc()<CR>
func! CompileRunFGcc()
  exec "w"
  if &filetype == 'c'
    :FloatermNew! gcc -std=c17 % -o %< && time ./%<
  elseif &filetype == 'cpp'
    :FloatermNew! g++ -std=c++20 % -o %< && time ./%<
  elseif &filetype == 'java'
    :FloatermNew! javac % && time java %<
  elseif &filetype == 'sh'
    :FloatermNew! time sh %
  elseif &filetype == 'python'
    :FloatermNew! time python %
  endif
endfunc


" ===
" === Rainbow
" ===
let g:rainbow_active = 1

" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_border_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

" ===
" ==================== vimspector ====================
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/vimspector/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/vimspector',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad



" ===
" ===Copilot []选择代码片段
" ===                                                                                                                                                                                    
noremap C :Copilot<CR>


" ===
" ===Configure Neural
" ===
let g:neural = {
\   'source': {
\       'openai': {
\           'api_key': "your_api_key",                                                                                                            
\       },
\   },
\}



" ===
" ===coc.nvim
" ===

let g:coc_global_extensions =['coc-clangd','coc-java','coc-pyright','coc-snippets','coc-markdownlint','coc-markmap','coc-git','coc-cmake','coc-tabnine','coc-vimlsp','coc-json','coc-texlab']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>







