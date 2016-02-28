if has('vim_starting')
    set nocompatible " Be iMproved
endif

" Find pathogen
runtime bundle/pathogen/autoload/pathogen.vim


""""""""""""""""""""""""""""""""""

" # /apollo/env/envImprovement/var/vimruntimehook
" Contents here for reference
" let g:ApolloRoot = "/apollo/env/envImprovement"
" set runtimepath=$HOME/.vim,/apollo/env/envImprovement/vim/amazon/brazil-config,/apollo/env/envImprovement/vim/amazon/brazil_inc_path,/apollo/env/envImprovement/vim/amazon/dat,/apollo/env/envImprovement/vim/amazon/FLLog,/apollo/env/envImprovement/vim/amazon/ion,/apollo/env/envImprovement/vim/amazon/mail-after,/apollo/env/envImprovement/vim/amazon/mosel,/apollo/env/envImprovement/vim/amazon/object,/apollo/env/envImprovement/vim/amazon/Perforce,/apollo/env/envImprovement/vim/amazon/s3,/apollo/env/envImprovement/vim/amazon/syntax-override-mason,/apollo/env/envImprovement/vim/amazon/syntax-override-perl,/apollo/env/envImprovement/vim/amazon/syntax-override-ruby,/apollo/env/envImprovement/vim/amazon/wiki_browser,/apollo/env/envImprovement/vim,$VIMRUNTIME,/apollo/env/envImprovement/vim/amazon/mail-after/after,/apollo/env/envImprovement/vim/after,$HOME/.vim/after

""""""""""""""""""""""""""""""""""

let g:pathogen_disabled = ["ropevim", "minibufexpl", "supertab", "snippets", "gundo",
    \"python-mode", "vim-javascript", "coquille", "snipmate", "ultisnips", "NerdTree",
    \"vim-airline",
    \"pep8", "nerdtree",
    \"latex-suite", "/apollo/env/envImprovement/vim/plugin",
    \"/apollo/env/envImprovement/vim/ftplugin", "Perforce"
    \]

" Needs to be set for some amazon plugins
let g:ApolloRoot = "/apollo/env/envImprovement"

" let g:solarized_contrast = "high"
" let g:solarized_visibility = "low"
" let g:solarized_underline = 0
" let g:solarized_termcolors = 256

set background=dark		" Must be set before loading solarized

" Pathogen load
filetype off
execute pathogen#infect("/apollo/env/envImprovement/vim/{}", "/apollo/env/envImprovement/vim/amazon/{}", "bundle/{}")
"call pathogen#helptags()
filetype plugin indent on

" Set up colors
colorscheme solarized
syntax on
syntax sync minlines = 500
hi Normal ctermbg=NONE


" Set vim settings to sane values
set ruler
set number
set expandtab
set ts=4
set sts=4
set shiftwidth=4
set backspace=indent,eol,start
set hlsearch
set hidden
set wrap
set nomodeline     " modelines are a useless security hole

set encoding=utf-8
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set scrolloff=3
" set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set ttyfast
set ruler
set laststatus=2
set relativenumber

" Ignore case on search
set ignorecase
set smartcase

" Enable folding
set foldmethod=indent
set foldlevel=99

" Allow comment formatting, auto-increment lists, don't break after 1-letter
" words
set formatoptions+=qn1

" set colorcolumn=100
set cursorline

" Fix leader mappings
set timeout
set timeoutlen=800

" CommandT ignore build folders
set wildignore+=**/build/*

if v:version >= 703
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/undo,~/tmp,/tmp
endif

" Enable magic searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
"
" Better window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fuck help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Just lost 20 minutes from accidentally changing my sql query >:(
noremap <C-a> <NOP>
noremap! <C-a> <NOP>
noremap <C-x> <NOP>
noremap! <C-x> <NOP>

" Save on buffer switch
au FocusLost * :w

" Toggle quickfix
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Note: <leader> is '\'
" Tasklist shortcut to find TODO/FIXME
map <leader>d <Plug>TaskList
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
" map <leader>n :NERDTreeToggle<CR>

" These are for buffer switching
" Python-mode overrides <Leader>b
noremap <Leader>t :CommandT<CR>
noremap <Leader>b :CommandTBuffer<CR>

let g:ropevim_enable_shortcuts = 1

let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_lint_ignore = "E501,W391"
let g:pymode_breakpoint_key = ""
let g:pymode_options_indent = 0

let g:snips_author = 'Bennet Huber'

let g:syntastic_error_symbol='E'
let g:syntastic_warning_symbol='W'
let g:syntastic_auto_loc_list=1
let g:syntastic_zsh_zsh_exec = '/apollo/env/envImprovement/bin/zsh'
let g:syntastic_zsh_exec = '/apollo/env/envImprovement/bin/zsh'
let s:zsh_executable = '/apollo/env/envImprovement/bin/zsh'

" vim-airline
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols.space = "\ua0"
"set guifont=Inconsolata-dz\ for\ Powerline

" vim-expand-region
" il:  'inside line'. Available through https://github.com/kana/vim-textobj-line
" ie:  'entire file'. Available through https://github.com/kana/vim-textobj-entire
let g:expand_region_text_objects = {
      \ 'iw'  :1,
      \ 'iW'  :0,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :1,
      \ 'ie'  :0,
      \ }

" Tabs are load bearing in makefiles
autocmd FileType make setlocal noexpandtab

" Convention is to use real tabs in ion files
autocmd FileType ion setlocal noexpandtab
au BufRead,BufNewFile *.dp setfiletype ion

" Set html files to have 2 space tabs
augroup myHtml
    au!
    au FileType html,htmldjango setlocal ts=2
    au FileType html,htmldjango setlocal sts=2
    au FileType html,htmldjango setlocal sw=2
augroup END

" COQ stuff
let g:CoqIDEDefaultMap = 1

" Autoload vimrc changes
" Solarized breaks this :(
"augroup vimrc
    "au!
    "au BufWritePost ~/.vimrc|~/.vim/vimrc so $MYVIMRC
"augroup END

" Set json ft to json so vim-json recognizes it
autocmd BufNewFile,BufRead *.json set ft=json

" I like my json raw and uncut
let g:vim_json_syntax_conceal = 0

" Make markdown files wrap properly
au FileType markdown setlocal tw=100 formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=t

" Set F2 to toggle indent fixing for pasting
set pastetoggle=<F2>

"Show tabs and tailing space
set list
set listchars=tab:▸\ ,trail:.

" Backups/temp files in single directory
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp


" Shift-Tab un-indents
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

"Latex Stuff
"http://vim-latex.sourceforge.net/documentation/latex-suite/recommended-settings.html
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

set tags=tags;/     " Traverse directory upward when looking for tags

" Buffer switching
noremap <leader><TAB> :bnext<CR>
noremap <leader><S-TAB>  :bprev<CR>
" Delete current buffer without closing window
nnoremap <C-W>o :bp\|bd #<CR>


let g:expand_region_text_objects_ion = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ 'a]'  :1,
      \ 'ab'  :1,
      \ 'aB'  :1,
      \ }

" Due to a vim bug this must be set at the end of vimrc
set relativenumber
set t_ut=
