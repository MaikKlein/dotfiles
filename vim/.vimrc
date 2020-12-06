" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
set shell=/bin/sh
let mapleader = " "
let g:racer_cmd = "/home/maik/.cargo/bin/racer"
let $RUST_SRC_PATH="/home/maik/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
"set completeopt-=preview

function! LocationNext()                                                                  
  try                                                                                     
    lnext                                                                                 
  catch                                                                                   
    try | lfirst | catch | endtry                                                         
  endtry                                                                                  
endfunction                                                                               


"tnoremap <Esc> <C-\><C-n>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
let g:lmap =  {}
let g:lmap.o = { 'name' : 'Tabs' }
let g:lmap.l = { 'name' : 'Navigation' }
let g:lmap.s = { 'name' : 'Search' }
let g:lmap.g = { 'name' : 'Git' }
let g:lmap.e = { 'name' : 'Error' }
nmap <Leader>dh :call histdel('/')<CR>
nmap <Leader>sf <Plug>(easymotion-bd-f)
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>pf :Files<CR>
nmap <Leader>bb :Buffers <CR>
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
nmap <leader>om1 :tabm 0<CR>
nmap <leader>om2 :tabm 1<CR>
nmap <leader>om2 :tabm 2<CR>
nmap <leader>om3 :tabm 2<CR>
nmap <leader>om4 :tabm 3<CR>
nmap <leader>om5 :tabm 4<CR>
nmap <leader>om6 :tabm 5<CR>
nmap <leader>om7 :tabm 6<CR>
nmap <leader>om8 :tabm 7<CR>
nmap <leader>om9 :tabm 8<CR>
map <leader>mf :mark ' <CR>:! rustup run stable rustfmt %<CR><CR>'':e<CR>
"map <leader>mf :mark '<CR>:RustFmt<CR>
nmap <leader>oc :tabnew<CR>:tabmove<CR>
let g:lmap.s.s = ['BLines', 'Lines']
map <leader>; :Commentary<CR>
nmap <leader>sc :noh<CR>
nmap <leader>ft :NERDTree<CR>
nmap <leader>fT :NERDTreeFind<CR>
nmap <leader>sd <Plug>(easymotion-overwin-f2)

inoremap <silent><expr> <C-SPACE>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<C-SPACE>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

nmap <leader>en :call LocationNext()<CR>
nmap <leader>eN :ALEPreviousWrap<CR>
nmap <leader>el :CocList diagnostics<CR>

"let g:lmap.e.n = ['lnext', 'Next error']
nmap <leader>ls :mark '<CR>:FindSymbols<CR>
nmap <leader>li :mark '<CR>:FindImpls<CR>
nmap <leader>lf :mark '<CR>:FindFunctions<CR>
nmap <leader>od :tabclose<CR>
"nnoremap gd :mark ' <bar> :call LanguageClient_textDocument_definition()<CR>
"nnoremap ga :call LanguageClient_textDocument_definition()<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gn <Plug>GitGutterNextHunk
nmap <leader>gN <Plug>GitGutterPrevHunk
nmap <leader>gS <Plug>GitGutterStageHunk
nmap <leader>gu <Plug>GitGutterUndoHunk
nnoremap <silent> <Leader>gk :call openterm#horizontal('lazygit', 0.8)<CR>
nmap <C-k> :echo "test"<CR>
nnoremap <C-k> :w<cr>
let g:lmap.g.s = ['Gstatus', 'Git status']

" Show all open buffers and their status
" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

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

"Use par for prettier line formatting
set formatprg=par\ -w72
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DoRemote(arg)
UpdateRemotePllugins
endfunction

if &compatible
 set nocompatible
endif
filetype off                  " required
"set rtp+=~/.vim/bundle/Vundle.vim
""call vundle#begin()
"call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle
" required!

call plug#begin('~/.vim/plugged')
Plug 'lambdalisue/fern.vim'
" Plug 'djoshea/vim-autoread'
Plug 'junegunn/vim-peekaboo'
Plug 'tikhomirov/vim-glsl'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-rhubarb'
Plug 'machakann/vim-highlightedyank'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'gmarik/vundle'
Plug 'chriskempson/base16-vim'
    " call dein#add( 'autozimu/LanguageClient-neovim', {)
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
    " call dein#add( 'prabirshrestha/vim-lsp')
    " call dein#add( 'prabirshrestha/async.vim')
    "" My Bundles here:
    "call dein#add( 'airblade/vim-gitgutter')
    "call dein#add( 'phildawes/racer')
Plug 'tpope/vim-commentary'
Plug 'cespare/vim-toml'
    "call dein#add( 'jansenm/vim-cmake')
    "call dein#add( 'rust-lang/rust.vim')
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
    "call dein#add( 'tikhomirov/vim-glsl')
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
    "call dein#add( 'bling/vim-airline')
    "call dein#add( 'vim-airline/vim-airline-themes')
    """"" Haskell stuff
Plug 'jiangmiao/auto-pairs'
    "call dein#add( 'Raimondi/delimitMate')
Plug 'hecal3/vim-leader-guide'
    "call dein#add( 'scrooloose/syntastic')
    "call dein#add( 'mattn/gist-vim')
    "call dein#add( 'gkz/vim-ls')
    "call dein#add( 'tpope/vim-dispatch')
    "call dein#add( '29decibel/codeschool-vim-theme')
    "call dein#add( 'croaker/mustang-vim')
Plug 'scrooloose/nerdtree'
    "call dein#add( 'Valloric/YouCompleteMe')
    "call dein#add( 'Shougo/deoplete.nvim')
    "call dein#add( 'sebastianmarkow/deoplete-rust')
    "call dein#add( 'SirVer/ultisnips')
    "call dein#add( 'honza/vim-snippets')
    "call dein#add( 'rhysd/vim-clang-format')
Plug 'morhetz/gruvbox'
    "call dein#add( 'edkolev/tmuxline.vim')
    "call dein#add( 'rust-lang/rust.vim')
    "call dein#add( 'MaikKlein/ale')
    "call dein#add( 'neomake/neomake')
Plug 'kbenzie/vim-spirv'
" Plug 'airblade/vim-gitgutter'
    "call dein#add( 'Yggdroot/indentLine')
    "call dein#add( 'luochen1990/rainbow')
    "call dein#add( 'SirVer/ultisnips')
    "call dein#add( 'honza/vim-snippets')
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-repeat'
    " call dein#add( 'autozimu/LanguageClient-neovim', {)
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
" Plug 'w0rp/ale'
    " call dein#add( 'roxma/nvim-completion-manager')
    " call dein#add( 'roxma/nvim-cm-racer')
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"    "call dein#add( 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
    "call dein#add( 'roxma/nvim-cm-racer')
Plug 'thaerkh/vim-workspace'
Plug 'rust-lang/rust.vim'
"Plug 'neomake/neomake'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
"Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'trevordmiller/nova-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'joshdick/onedark.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'beyondmarc/hlsl.vim'
Plug 'kburdett/vim-nuuid'
" Plug 'xolox/vim-session'
 Plug 'xolox/vim-misc'
" Plug 'tpope/vim-obsession'
" Plug 'ForkedRepos/vim-workspace'
 " Plug 'romgrk/vim-session'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vista.vim'
call plug#end()
"call vundle#end()            " required

filetype plugin indent on    " required
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
"set wildmenu
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
"set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

" Macvim fullscreen toggle
map <silent> <leader>ff :set invfu<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=light
" set termguicolors
" Enable true color 启用终端24位色
" set termguicolors
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:solarized_termcolors=256
let g:solarized_use16 = 1
colorscheme solarized8
" colorscheme onedark
" let g:gruvbox_termcolors=256
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

" " Don't blink normal mode cursor
" set guicursor=n-v-c:block-Cursor
" set guicursor+=n-v-c:blinkon0
set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif

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
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines


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
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction
set statusline=win:%{WindowNumber()}
set statusline+=win:%{WindowNumber()}
" set statusline+=%{coc#status()}
" Format the status line
"set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Close nerdtree after a file is selected
"let NERDTreeQuitOnOpen = 1

"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"function! ToggleFindNerd()
"  if IsNERDTreeOpen()
"    exec ':NERDTreeToggle'
"  else
"    exec ':NERDTreeFind'
"  endif
"endfunction

"" If nerd tree is closed, find current file, if open, close it
"map <silent> <C-s> <ESC>:call ToggleFindNerd()<CR>

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
nmap <leader>gs :Gstats<CR>
nmap <leader>gg :copen<CR>:GGrep
nmap <leader>gl :Extradite!<CR>
nmap <leader>gb :Gblame<CR>
nnoremap <silent> <C-\> :call NonintrusiveGitGrep(expand("<cword>"))<CR>
vnoremap <silent> <C-\> "*y:call NonintrusiveGitGrep(@*)<CR>

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" hi SpellBad ctermfg=088 ctermbg=234
" hi SpellCap ctermfg=088 ctermbg=234

if has('gui_running')
  set guioptions -=T  " no toolbar
  set guioptions -=m
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions=aiAc
endif
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

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
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"
"let g:deoplete#enable_at_startup = 1
"inoremap <expr> <Tab>  pumvisible() ? "" : deoplete#mappings#manual_complete()
let g:airline#extensions#tabline#formatter = 'default'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'ra_lps_server'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

nnoremap <leader>fed :e ~/.vimrc<CR>
hi VertSplit ctermbg=NONE guibg=NONE
"hi SpellBad ctermfg=NONE ctermbg=NONE guifg=#ffffff guibg=#ffffff
"hi SpellCap ctermfg=NONE ctermbg=NONE guifg=#ffffff guibg=#ffffff
hi NonText guifg=bg
set nonumber
"let g:solarized_visibility = "high"
let g:LanguageClient_autoStart = 1
"let g:spirv_current_id_highlight = ''
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
  \   'rg --column --line-number --no-heading --color=always "(type|enum|struct|trait)[ \t]+([a-zA-Z0-9_]+)" -g "*.rs" -S | rg -S '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindFunctions
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "fn +([a-zA-Z0-9_]+)" -g "*.rs" | rg -g "*.rs" -S '.substitute(shellescape(<q-args>), " ", "|rg -g '*.rs' -S", ""), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:20%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindImpls
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "impl([ \t\n]*<[^>]*>)?[ \t]+(([a-zA-Z0-9_:]+)[ \t]*(<[^>]*>)?[ \t]+(for)[ \t]+)?([a-zA-Z0-9_]+)" | rg -S '.substitute(shellescape(<q-args>), " ", "|rg ", ""), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" let g:LanguageClient_diagnosticsEnable=0
" let g:ale_linters = {
" \   'rust': ['rustc'],
" \}
let b:ale_linters = ['rustc']
" let g:ale_rust_rls_executable = 'rust-analyzer'
let b:ale_fixers = ['rustfmt']

"╎
"▶
"│
let g:ale_sign_warning = '▶'
let g:ale_sign_error = '▶'

highlight SignColumn guibg=NONE
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = '┃'
" highlight NeomakeErrorMsg guifg=DarkRed guibg=NONE
" highlight NeomakeWarningMsg guifg=DarkBlue guibg=NONE
" let g:neomake_error_sign = {'text': '▶', 'texthl': 'NeomakeErrorMsg'}
" let g:neomake_warning_sign={'text': 'W', 'texthl': 'NeomakeWarningMsg'}
" let g:neomake_info_sign={'text': 'W', 'texthl': 'NeomakeWarningMsg'}
" let g:neomake_message_sign={'text': 'W', 'texthl': 'NeomakeWarningMsg'}
" let g:neomake_highlight_columns = 0

" let g:ale_sign_warning = '┃'
" let g:ale_sign_error = '┃'
let g:ale_set_highlights=0
let g:ale_rust_cargo_use_clippy=1

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:magit_default_show_all_files=0
set shortmess+=c
let g:EasyMotion_smartcase = 1

"map <C-Space> <Plug>(cm_complete)
"imap <C-Space> <C-x><C-o>
"imap <C-Space> <Plug>(cm_force_refresh)
let g:cm_auto_popup=1


"let g:airline_theme = 'solarized'
"function MyOverride(...)
"    call a:1.add_section('StatusLine', 'All')
"    call a:1.add_section('Tag', 'your')
"    call a:1.add_section('Search', 'base')
"    call a:1.add_section('StatusLineNC', '%f')
"    call a:1.split()
"    call a:1.add_section('StatusLine', '%p%%')
"    call a:1.add_section('Error', '%p%%')
"    return 1
"endfunction
"call airline#add_statusline_func('MyOverride')
set grepprg=rg\ --vimgrep
"hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
let g:rustfmt_fail_silently = 1
let g:rustfmt_command = "rustfmt"
let g:fzf_layout = { 'down': '~25%' }
let g:delimitMate_quotes = 0
au FileType rust let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`', '|':'|', '<':'>'}
let g:AutoPairsMapBS = 1
let g:vimfiler_as_default_explorer = 1
let g:lightline = {
  \   'colorscheme': 'solarized',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified', ]
  \     ],
  \     'right': [ [ 'lineinfo'],
  \                ['percent']],
  \   },
  \   'inactive': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [ [ 'lineinfo' ],
  \                ['percent']],
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [  ] ] }
" let g:lightline.separator = {
"     \   'left': '', 'right': ''
"     \}
" let g:lightline.subseparator = {
"     \   'left': '', 'right': ''
"     \}
set noshowmode

let g:rust_fold = 0
autocmd FileType rust setlocal nosmartindent
let g:AutoPairsCenterLine=0
let g:AutoPairsMapCR=0
let g:AutoPairsMultilineClose=0


let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

let g:highlightedyank_highlight_duration = 300
highlight LineNr term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

highlight ALEWarningSign guifg=#268bd2
highlight ALEErrorSign guifg=#dc322f

hi Cursor guibg=#657b83

"hi Search guibg=white guifg=white

set number
set relativenumber
let g:spirv_enable_current_id = 0
let g:solarized_extra_hi_groups=0
let g:solarized_old_cursor_style=0
let g:LargeFile=10
" Protect large files from sourcing and other overhead.
" Files become read only
"if !exists("my_auto_commands_loaded")
"  let my_auto_commands_loaded = 1
"  " Large files are > 10M
"  " Set options:
"  " eventignore+=FileType (no syntax highlighting etc
"  " assumes FileType always on)
"  " noswapfile (save copy of file)
"  " bufhidden=unload (save memory when other file is viewed)
"  " buftype=nowrite (file is read-only)
"  " undolevels=-1 (no undo possible)
"  let g:LargeFile = 1024 * 1024 * 10
"  augroup LargeFile
"    autocmd BufEnter
"    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
"    augroup END
"  endif
"  set synmaxcol=200
noremap <C-Q> <ESC>:ALEPreviousWrap<CR>
noremap <C-E> <ESC>:ALENextWrap<CR>
" let b:deoplete_disable_auto_complete=1 
" let g:deoplete_disable_auto_complete=1
" call deoplete#custom#buffer_option('auto_complete', v:false)
" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif
" call deoplete#custom#option('ignore_sources', {'_': ['buffer']})
" if executable('rls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"         \ 'whitelist': ['rust'],
"         \ })
" endif
" call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
"     \ 'name': 'neosnippet',
"     \ 'whitelist': ['*'],
"     \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
"     \ }))
imap <c-space> <Plug>(asyncomplete_force_refresh)
" call neomake#configure#automake('w')
imap <C-f>     <Plug>(neosnippet_expand_or_jump)
smap <C-f>     <Plug>(neosnippet_expand_or_jump)
xmap <C-f>     <Plug>(neosnippet_expand_target)
" autocmd User asyncomplete_setup call asyncomplete#register_source(
"     \ asyncomplete#sources#racer#get_source_options())

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction
nmap gd <Plug>(rust-def)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gh :call <SID>show_documentation()<CR>
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>mo :CocList outline<CR>
nmap <leader>ms :CocList symbols<CR>
nmap <leader>ma :CocAction<CR>
" nmap <leader>mo :CocFzfList outline<CR>
" nmap <leader>ms :CocFzfList symbols<CR>

" let $CARGO_TARGET_DIR="target/ra-target"


" noremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
set noundofile
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
let g:coc_fzf_preview_available = 1

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
let g:clap_theme = 'solarized_light'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'
