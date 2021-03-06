set nocompatible              " be iMproved, required
set undofile    " Maintain undo history between sessions
set undodir=~/.vim/undodir " Make sure this directory exists

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'heavenshell/vim-pydocstring'
Plug 'heavenshell/vim-jsdoc'
" markdown plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
" RestructuredText plugins
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

" Set vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" Set tab stops to be 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
"set number
"set statusline=%f         " Path to the file
"set statusline+=%=        " Switch to the right side
"set statusline+=%l        " Current line
"set statusline+=/         " Separator
"set statusline+=%L        " Total lines
"set laststatus=2
"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=buffer\                       " buffer label
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Set color scheme
set t_Co=256
colorscheme Tomorrow-Night22
imap kj <Esc>
set pastetoggle=<F2>


let g:netrw_liststyle=3
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<c-y>'

"Syntastic checkers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_html_checkers = ['w3']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': [] }

"Indent line
let g:indentLine_enabled = 1
let g:vim_json_syntax_conceal = 0
" Set key for pydocstring
nmap <silent> <C-I> <Plug>(pydocstring)
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" always save to same file, this triggers webpack hot reloading.
set backupcopy=yes
" allow mouse to move cursor
" set mouse=a

" arrow keys change buffer.
nmap <Left> :bp<CR>
nmap <Right> :bn<CR>

vmap <Up> [egv
vmap <Down> ]egv
vmap <Left> <gv
vmap <Right> >gv

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>

" Relative number
nmap <C-n> :set rnu!<CR>

" RIV: restructured text for taking notes
"let g:riv_auto_format_table = 0 "can't merge cells with it

"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
set conceallevel=0
"vim-instant-markdown
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
