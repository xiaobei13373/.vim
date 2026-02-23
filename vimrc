let mapleader=" "
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap j h
noremap i k
noremap k j
noremap h i
noremap I 5k
noremap K 5j
noremap J 7h
noremap L 7l
" N key: go to the start of the line
noremap <C-j> 0
" I key: go to the end of the line
noremap <C-l> $


map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map ; :

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tn :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" =============================================================================
" 插件配置 (使用 vim-plug 管理)
" =============================================================================
call plug#begin('~/.vim/plugged')

" --- 状态栏与主题 ---
" vim-airline: 强大的状态栏插件，显示模式、文件名、git 分支等信息
Plug 'vim-airline/vim-airline'
" vim-snazzy: Snazzy 配色主题，色彩鲜艳现代
Plug 'connorholyday/vim-snazzy'

" --- 文件导航 ---
" NERDTree: 文件树导航插件，可侧边栏显示项目文件结构
" 'on': 'NERDTreeToggle' 表示仅在调用命令时加载，提高启动速度
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" nerdtree-git-plugin: 在 NERDTree 中显示 git 状态（修改、新增、删除等）
Plug 'Xuyuanp/nerdtree-git-plugin'

" --- 代码结构导航 ---
" Tagbar: 显示代码标签列表（函数、类、变量等），支持多种语言
" 'on': 'TagbarOpenAutoClose' 表示按需加载
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" --- 代码检查 ---
" ALE (Asynchronous Lint Engine): 异步代码检查，支持多种语言的 lint 和修复
Plug 'w0rp/ale'

" --- 自动补全 ---
" YouCompleteMe: 强大的代码补全引擎（当前已禁用，需要编译安装）
" Plug 'Valloric/YouCompleteMe'

" --- 撤销树 ---
" Undotree: 可视化的撤销历史树，可回溯到任意历史状态
Plug 'mbbill/undotree/'

" --- 视觉增强 ---
" vim-indent-guides: 显示缩进参考线，帮助识别代码块结构
Plug 'nathanaelkane/vim-indent-guides'
" vim-cursorword: 自动高亮当前光标下的单词，方便查看重复出现的变量名
Plug 'itchyny/vim-cursorword'

" --- Git 工具 ---
" conflict-marker.vim: 高亮显示 git 合并冲突标记
Plug 'rhysd/conflict-marker.vim'
" vim-fugitive: 强大的 git 集成插件，可在 vim 内执行 git 操作
Plug 'tpope/vim-fugitive'
" vim-signify: 在符号栏显示 git 修改标记（新增、修改、删除的行）
Plug 'mhinz/vim-signify'
" vim-gitignore: 为 gitignore 文件提供语法高亮和自动补全
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" --- Python 开发 ---
" indentpython.vim: Python 缩进规则增强
Plug 'vim-scripts/indentpython.vim'

" --- Markdown 写作 ---
" markdown-preview.nvim: Markdown 实时预览，在浏览器中同步显示渲染效果
" 'do': 安装时执行回调函数进行插件安装
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
" vim-table-mode: 表格模式，自动格式化文本表格
" 'on': 'TableModeToggle' 表示按需加载
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" vimwiki: 个人维基系统，用于知识管理和笔记
Plug 'vimwiki/vimwiki'

" --- 书签 ---
" vim-signature: 管理 vim 书签（marks），可快速跳转和标记位置
Plug 'kshenoy/vim-signature'

" --- 效率工具 ---
" vim-multiple-cursors: 多光标编辑，类似 Sublime Text 的多重选择功能
Plug 'terryma/vim-multiple-cursors'
" goyo.vim: 专注写作模式，隐藏干扰元素，居中显示内容
Plug 'junegunn/goyo.vim'
" vim-surround: 快速操作周围字符（如添加/修改括号、引号等）
" 用法示例：ysks' 用单引号包裹单词，cs'` 将单引号改为反引号
Plug 'tpope/vim-surround'
" Tabular: 文本对齐工具，可按指定字符对齐代码
" 用法示例：选中代码后输入 :Tabularize /= 按等号对齐
Plug 'godlygeek/tabular'
" wildfire.vim: 智能选择文本对象（如引号、括号内的内容）
" 用法示例：在可视模式下输入 i' 选择引号内文本，i) i] i} ip 类似
Plug 'gcmt/wildfire.vim'
" NERDCommenter: 快速注释插件，支持多种语言
" 用法示例：<space>cc 注释当前行，<space>c<space> 切换注释状态
Plug 'scrooloose/nerdcommenter'

" --- 依赖插件 ---
" vim-addon-mw-utils: vim-addon 系列工具集，部分插件的依赖
Plug 'MarcWeber/vim-addon-mw-utils'
" vim-textobj-user: 自定义文本对象的基础库
Plug 'kana/vim-textobj-user'
" vim-FIGlet: 生成 FIGlet ASCII 艺术字体
Plug 'fadein/vim-FIGlet'

" 结束插件配置
call plug#end()

let g:SnazzyTransparent = 1
color snazzy

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "u"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "j"
let NERDTreeMapChangeRoot = "p"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
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
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/usr/local/bin/python3"
let g:ycm_python_binary_path = "/usr/local/bin/python3"


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
" map L :UndotreeToggle<CR>


