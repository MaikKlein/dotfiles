" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
let mapleader = " "
let g:racer_cmd = "/home/maik/.cargo/bin/racer"
let $RUST_SRC_PATH="/home/maik/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
"set completeopt-=preview



" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
let g:lmap =  {}
let g:lmap.o = { 'name' : 'Tabs' }
let g:lmap.l = { 'name' : 'Navigation' }
let g:lmap.s = { 'name' : 'Search' }
let g:lmap.g = { 'name' : 'Git' }
nmap <leader>o1 1gt
nmap <leader>o2 2gt
nmap <leader>o2 2gt
nmap <leader>o3 3gt
nmap <leader>o4 4gt
nmap <leader>o5 5gt
nmap <leader>o6 6gt
nmap <leader>o7 7gt
nmap <leader>o8 8gt
nmap <leader>o9 9gt
nmap <leader>oc :tabnew<CR>:tabmove<CR>
map <leader>mf :%! rustup run nightly rustfmt<CR>
let g:lmap.s.s = ['BLines', 'Lines']
map <leader>; :Commentary<CR>
nmap <leader>sc :noh<CR>
nmap <leader>sd <Plug>(easymotion-overwin-f2)
let g:lmap.l.s = ['FindSymbols', 'Find symbols']
let g:lmap.l.f = ['FindFunctions', 'Find functions']
let g:lmap.l.i = ['FindImpls', 'Find implementations']
nmap <leader>od :tabclose<CR>
let g:lmap.g.s = ['Gstatus', 'Git status']

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

set cmdheight=2

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Sections:
"    -> General
"    -> Vundle
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Slime
"    -> Turbux
"    -> NERDTree
"    -> Alignment
"    -> Tags
"    -> Git
"    -> Commenting
"    -> Conversion
"    -> Abbreviation
"    -> Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Use par for prettier line formatting
"set formatprg=par\ -w72
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DoRemote(arg)
UpdateRemotePllugins
endfunction

set nocompatible
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle
" required!
Plug 'gmarik/vundle'

" My Bundles here:
"Plug 'phildawes/racer'
Plug 'tpope/vim-commentary'
Plug 'cespare/vim-toml'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
"Plug 'jansenm/vim-cmake'
"Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
"Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
"Plug 'itchyny/lightline.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"""" Haskell stuff
Plug 'Raimondi/delimitMate'
Plug 'hecal3/vim-leader-guide'
"Plug 'scrooloose/syntastic'
"Plug 'mattn/gist-vim'
"Plug 'gkz/vim-ls'
"Plug 'tpope/vim-dispatch'
"Plug '29decibel/codeschool-vim-theme'
"Plug 'croaker/mustang-vim'
Plug 'scrooloose/nerdtree'
"Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/deoplete.nvim'
"Plug 'sebastianmarkow/deoplete-rust'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'rhysd/vim-clang-format'
Plug 'morhetz/gruvbox'
"Plug 'edkolev/tmuxline.vim'
"Plug 'rust-lang/rust.vim'
"Plug 'MaikKlein/ale'
"Plug 'neomake/neomake'
Plug 'mckinnsb/rust.vim'
Plug 'kbenzie/vim-spirv'
"Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'lifepillar/vim-solarized8'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'w0rp/ale'
Plug 'roxma/nvim-completion-manager'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'boxofrox/neovim-scorched-earth'
Plug 'MaikKlein/nvim-example-python-plugin'
Plug 'thaerkh/vim-workspace'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

call plug#end()
"call vundle#end()            " required

filetype plugin indent on    " required
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=longest,list,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler
set number

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

set smartindent
" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

" Add a bit extra margin to the left
set foldcolumn=1

" Macvim fullscreen toggle
map <silent> <leader>ff :set invfu<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'flazz/vim-colorschemes'
Plug 'verbitan/Wombat'
set background=light
"colorscheme gruvbox
let g:solarized_use16 = 1
colorscheme solarized8
"let g:solarized_termcolors=256
"let g:LanguageClient_signColumnAlwaysOn=1
let g:LanguageClient_diagnosticsDisplay={
            \1: {
            \    "name": "Error",
            \    "texthl": "ALEError",
            \    "signText": "✖",
            \},
            \2: {
            \    "name": "Warning",
            \    "texthl": "ALEWarning",
            \    "signText": "⚠",
            \    "signTexthl": "ALEWarningSign",
            \},
            \3: {
            \    "name": "Information",
            \    "texthl": "ALEInfo",
            \    "signText": "ℹ",
            \    "signTexthl": "ALEInfoSign",
            \},
            \4: {
            \    "name": "Hint",
            \    "texthl": "ALEInfo",
            \    "signText": "➤",
            \    "signTexthl": "ALEInfoSign",
            \},
            \}
"set background=dark
" Enable syntax highlighting
syntax enable

" Enable filetype plugins
filetype plugin on
filetype indent on

" Match wombat colors in nerd tree
hi Directory guifg=#8ac6f2

" Searing red very visible cursor
hi Cursor guibg=red

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif
"set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use large font by default in MacVim
"set gfn=Monaco:h19


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Source the vimrc file after saving it
"augroup sourcing
"  autocmd!
"  autocmd bufwritepost .vimrc source $MYVIMRC
"augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
map <silent> <leader><cr> :noh<cr>:hi Cursor guibg=red<cr>

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END
" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"let g:Powerline_symbols = 'unicode'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup whitespace
  autocmd!
  autocmd BufWrite *.py :call DeleteTrailingWS()
  autocmd BufWrite *.coffee :call DeleteTrailingWS()
  autocmd BufWrite *.rb :call DeleteTrailingWS()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Slime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turbux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:no_turbux_mappings = 1
nmap <leader>rT <Plug>SendTestToTmux
nmap <leader>rt <Plug>SendFocusedTestToTmux


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
map <silent> <C-s> <ESC>:call ToggleFindNerd()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Alignment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent automatic ctag updates
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
let g:easytags_on_cursorhold = 0

" Generate tags manually
nmap <leader>tu :UpdateTags<CR>

" Scan recursively, not just current file
let g:easytags_autorecurse = 1
" Follow symbolic links
let g:easytags_resolve_links = 1

" Toggle tagbar
nmap <leader>tt :TagbarToggle<CR>
" Close tagbar after jumping to a tag
let g:tagbar_autoclose = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep
nmap <leader>gl :Extradite!<CR>
nmap <leader>gb :Gblame<CR>
nnoremap <silent> <C-\> :call NonintrusiveGitGrep(expand("<cword>"))<CR>
vnoremap <silent> <C-\> "*y:call NonintrusiveGitGrep(@*)<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list, '')
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conversion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert symbol to string
nnoremap <silent> <leader>2s F:r"Ea"<ESC>
" Convert string to symbol
nnoremap <silent> <leader>2y F"r:,x

" Convert name to snake_case
nmap <leader>2_ cr_
" Convert name to camelCase
nmap <leader>2c crc
" Convert name to MixedCase
nmap <leader>2m crm
" Convert name to SNAKE_UPPERCASE
nmap <leader>2u cru
" Convert name to dash-case
nmap <leader>2- cr-


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby debugger
iabbrev rdebug require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

hi SpellBad ctermfg=088 ctermbg=234
hi SpellCap ctermfg=088 ctermbg=234

if has('gui_running')
  set guioptions -=T  " no toolbar
  set guioptions -=m
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions=aiAc
endif
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

set ttimeoutlen=0

inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#show_tab_type = 0

" sign define transparent_sign
" augroup SignColFixAu
"   au!
"   au BufReadPost *.d,*.c,*.cc,*.h,*.cpp,*.hh,*.py,*.js,*.php,*.rs exe "sign place 1111 name=transparent_sign line=1 file=".@%
" augroup end
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_rust_src_path = '/home/maik/src/rust/src/'
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_Color = 0

let g:vim_markdown_folding_disabled = 1

command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!
" Move to word
" fugitive git bindings
nnoremap <Leader>ga :Silent Git add .<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :Silent Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Silent Git push<CR>
nnoremap <Leader>gpl :Silent Git pull<CR>


"let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 256
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = 'inc'

nnoremap <F3> :noh<CR>
"set omnifunc=syntaxcomplete#Complete

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['cargo', 'run', '--release', '--manifest-path=/home/maik/src/rls/Cargo.toml'],
"    \ }
"
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"
"let g:deoplete#enable_at_startup = 1
"inoremap <expr> <Tab>  pumvisible() ? "" : deoplete#mappings#manual_complete()
set timeoutlen=500
let g:airline_theme = 'solarized'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

nnoremap <leader>fed :e ~/.vimrc<CR>
nmap <Leader>pf :FZF .<CR>
nmap <Leader>bb :CtrlPBuffer <CR>
hi VertSplit ctermbg=NONE guibg=NONE
hi SpellBad ctermfg=NONE ctermbg=NONE guifg=#ffffff guibg=#ffffff
hi SpellCap ctermfg=NONE ctermbg=NONE guifg=#ffffff guibg=#ffffff
hi NonText guifg=bg
set nonumber
"let g:solarized_visibility = "high"
let g:LanguageClient_autoStart = 1
let g:spirv_current_id_highlight = ''
set signcolumn=yes

"set termguicolors
set foldcolumn=0

let g:deoplete#enable_at_startup = 1


"inoremap <silent> <C-Space> <ESC>:call deoplete#manual_complete()<CR>a
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindSymbols
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "(type|enum|struct|trait)[ \t]+([a-zA-Z0-9_]+)" -g "*.rs" | rg '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindFunctions
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "fn +([a-zA-Z0-9_]+)" -g "*.rs" | rg '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindImpls
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "impl([ \t\n]*<[^>]*>)?[ \t]+(([a-zA-Z0-9_:]+)[ \t]*(<[^>]*>)?[ \t]+(for)[ \t]+)?([a-zA-Z0-9_]+)" | rg '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


let g:LanguageClient_diagnosticsEnable=0
let g:ale_linters = {
\   'rust': ['cargo'],
\}

let g:ale_sign_warning = '┃'
let g:ale_sign_error = '┃'
let g:ale_set_highlights=0
highlight ALEWarningSign ctermfg=DarkBlue
highlight ALEErrorSign ctermfg=DarkRed
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:magit_default_show_all_files=0
let g:airline_inactive_collapse=0
set lazyredraw
set shortmess+=c
