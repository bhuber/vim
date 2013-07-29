set nocp
set ruler
set number
set smartindent
set expandtab
set ts=4
set shiftwidth=4
set bs=2
set hlsearch
set hidden 
set wrap


" Buffer switching
"noremap <C-TAB> :bnext<CR>
"noremap <C-S-TAB> :bprev<CR>

" Note: <leader> is '\'
" Tasklist shortcut to find TODO/FIXME
map <leader>td <Plug>TaskList
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>n :NERDTreeToggle<CR>

" These are for buffer switching
" Python-mode overrides <Leader>b
noremap <Leader>t :CommandT<CR>
noremap <Leader>b :CommandTBuffer<CR>

let g:pathogen_disabled = ["minibufexpl", "supertab", "snippets"]

" Pathogen load
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
syntax on

let g:pymode_folding = 0
" E222,E202,E401,
let g:pymode_lint_ignore = "E501,W391"
let g:pymode_breakpoint_key = ""
let g:pymode_options_indent = 0

let g:snips_author = 'Bennet Huber'

let g:syntastic_python_checkers=[]
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

" Autoload vimrc changes
augroup vimrc
    au!
    au BufWritePost ~/.vimrc so $MYVIMRC
augroup END



" Enable folding
set foldmethod=indent
set foldlevel=99

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


