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

" let g:SuperTabMappingForward = '<c-space>'
" let g:SuperTabMappingBackward = '<s-c-space>'

autocmd FileType make
    \ setlocal noexpandtab

autocmd FileType html
    \ setlocal ts=2
    \ setlocal sts=2
    \ setlocal sw=2

" Enable folding
set foldmethod=indent
set foldlevel=99

" Shift-Tab un-indents
inoremap <S-tab> <c-d>

" Enable supertab context sensitivity + code completion
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"

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


