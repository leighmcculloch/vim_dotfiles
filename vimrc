call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'maralla/completor.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

let g:rehash256 = 1

silent! colorscheme molokai

nmap cn :cnext<cr>
nmap cp :cprevious<cr>

au FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
au FileType json setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

let g:go_list_type = "quickfix"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'

let g:airline#extensions#ale#enabled = 1

au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gr :GoRun<cr>
au FileType go nmap gi :GoInfo<cr>
au FileType go nmap gt :GoTest!<cr>
au FileType go nmap gf :GoTestFunc!<cr>
au FileType go nmap gc :GoCoverageToggle<cr>
au FileType go nmap gd <Plug>(go-def)

nmap <Leader>nt :NERDTreeToggle<cr>

" CTRL-H/J/K/L in popups
inoremap <expr> <c-j> (pumvisible()?"\<C-n>":"\<c-j>")
inoremap <expr> <c-k> (pumvisible()?"\<C-p>":"\<c-k>")

" Auto open NERDTree
silent! autocmd VimEnter * if @% == "" | NERDTree | endif
