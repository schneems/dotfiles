" Environment
" Basics
set nocompatible        " must be first line
let g:Powerline_symbols = 'fancy'

" Bundles
if filereadable(expand("~/bin/dotfiles/vim/.vimrc.bundles"))
  source ~/bin/dotfiles/vim/.vimrc.bundles
endif

if has ("unix") && "Darwin" != system("echo -n \"$(uname)\"")
  " on Linux use + register for copy-paste
  set clipboard=unnamedplus
else
  " one mac and windows, use * register for copy-paste
  set clipboard=unnamed
endif
"
let g:markdown_fenced_languages = ['ruby', 'erb=eruby']

" General
set background=dark         " Assume a dark background
if !has('gui')
  "set term=$TERM          " Make arrow and other keys work
endif
filetype plugin indent on   " Automatically detect file types.
syntax on                   " syntax highlighting
set mouse=a                 " automatically enable mouse usage
scriptencoding utf-8

set shortmess+=filmnrxoOtTI      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set nospell                     " spell checking off. OMG FUCK SPELLCHECK. usually.
set hidden                      " allow buffer switching without saving

" Setting up the directories
set backup                      " backups are nice ...
if has('persistent_undo')
  set undofile                "so is persistent undo ...
  set undolevels=1000         "maximum number of changes that can be undone
  set undoreload=10000        "maximum number lines to save for undo on a buffer reload
endif

" Vim UI
colorscheme default
set tabpagemax=15               " only show 15 tabs
set showmode                    " display the current mode

set cursorline                  " highlight current line

if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set relativenumber              " Show relative numbers
set showmatch                   " show matching brackets/parenthesis
set mat=5                       " duration to show matching brace (1/10 sec)
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set foldenable                  " auto fold code
set list
set listchars=tab:»·,trail:·,extends:> " Highlight problematic whitespace
set nojoinspaces                " One space after ./?/! with join commands
set visualbell                  " shut the fuck up
set nohlsearch                  " don't highlight searches
set swapfile


" Formatting
set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set smartindent                 " be smart about it
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every two columns
set softtabstop=2               " let backspace delete indent
set nosmarttab                  " fuck tabs
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" autocmd filetype c set shiftwidth=4 tabstop=4

" Key (re)Mappings

let mapleader = ','

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" The following two lines conflict with moving to top and bottom of the
" screen

map <S-H> gT
map <S-L> gt

" Stupid shift key fixes
if has("user_commands")
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

let b:match_ignorecase = 1

" OmniComplete
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

highlight Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
highlight PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
highlight PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest

" Ctags
set tags=./tags;/,~/.vimtags,./.git/tags

" NerdTree {
" map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
" map <leader>e :NERDTreeFind<CR>
" nmap <leader>nt :NERDTreeFind<CR>

" let NERDTreeShowBookmarks=1
" let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
" let NERDTreeMouseMode=2
" let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1
" let g:nerdtree_tabs_open_on_gui_startup=0
" }

" ctrlp {
let g:ctrlp_working_path_mode = 2

let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_use_caching=1000

 "
 ""Configure ctrlp for SPEED
 "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 "let g:ctrlp_use_caching = 700
 "
 "if executable("ag")
 "  set grepprg=ag\ --nogroup\ --nocolor
 "  let g:ctrlp_user_command="ag %s -l --nocolor -g ''"
 "  let g:ctrlp_use_caching=1000
 "elseif executable("git")
 "  set grepprg=git\ grep
 "end
let g:ctrlp_show_hidden = 1

" indent_guides
let g:indent_guides_auto_colors = 1
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

if &term == 'xterm' || &term == 'screen'
  set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

" Functions

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory' }

  if has('persistent_undo')
    let dir_list['undo'] = 'undodir'
  endif

  for [dirname, settingname] in items(dir_list)
    let directory = parent . '/' . prefix . dirname . "/"
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()

" function! NERDTreeInitAsNeeded()
"   redir => bufoutput
"   buffers!
"   redir END
"   let idx = stridx(bufoutput, "NERD_tree")
"   if idx > -1
"     NERDTreeMirror
"     NERDTreeFind
"     wincmd l
"   endif
" endfunction

autocmd Filetype mail setlocal spell textwidth=72

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" Switch between the last two files
nnoremap <leader><leader> <c-^>

" " Get off my lawn
" nnoremap h :echoe "Try b, B, F, T, ^"<CR><Left>
" nnoremap l :echoe "Try w, t, f, e, E, $"<CR><Right>
" nnoremap k :echoe "Try ?, {"<CR><Up>
" nnoremap j :echoe "Try /, }"<CR><Down>

" vim-rspec mappings
nnoremap <Leader>a :call RunAllSpecs()<CR>
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch rspec --no-color {spec}"

vnoremap <Leader>i :call I18nTranslateString()<CR>

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

" Autosave when lost focus
au FocusLost * silent! wa
set autowrite

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
  hi link markdownError Normal
augroup END

" textwidth=0 prevents wrapping at an arbitrary 72 chars
" wrap turns on soft wrap
autocmd Filetype gitcommit setlocal spell textwidth=0 wrap

" Allow vim to follow source files
" https://github.com/vim-syntastic/syntastic/issues/1957
let g:syntastic_sh_shellcheck_args="-x"
