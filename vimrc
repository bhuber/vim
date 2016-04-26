let g:pep8_map = ''
let g:pathogen_disabled = ["ropevim", "minibufexpl", "supertab", "snippets", "gundo", "python-mode", "vim-javascript", "coquille"]

set background=dark

" Pathogen load
filetype off
execute pathogen#infect()
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
filetype plugin indent on

colorscheme solarized
" colorscheme default
syntax on
syntax sync minlines=500
hi Normal ctermbg=NONE

set nocp
set ruler
set number
" set smartindent
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
set undofile

" Ignore case on search
set ignorecase
set smartcase

" Enable folding
set foldmethod=indent
set foldlevel=99

" Allow comment formatting, auto-increment lists, don't break after 1-letter
" words
set formatoptions+=qn1

set colorcolumn=100

if v:version >= 703
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/undo,~/tmp,/tmp
endif

" Enable magic searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Better window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fuck help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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



" Note: <leader> is '\'
" Tasklist shortcut to find TODO/FIXME
map <leader>d <Plug>TaskList
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>n :NERDTreeToggle<CR>

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

let g:syntastic_python_checkers=['flake8']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=1

" Tabs are load bearing in makefiles
autocmd FileType make setlocal noexpandtab

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
augroup vimrc
    au!
    au BufWritePost ~/.vimrc so $MYVIMRC
augroup END

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
set listchars=tab:>.,trail:.

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
noremap <C-TAB> :bnext<CR>
noremap <C-S-TAB> :bprev<CR>

set relativenumber
