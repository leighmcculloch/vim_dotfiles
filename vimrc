call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'maralla/completor.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
"Plug 'myitcv/govim'
Plug 'fatih/vim-go'
Plug 'benmills/vimux'
Plug 'sebdah/vim-delve'
Plug 'janko/vim-test'
Plug 'kaicataldo/material.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'justinmk/vim-sneak'
Plug 'pgr0ss/vim-github-url'
Plug 'scrooloose/nerdcommenter'
Plug 'haya14busa/incsearch.vim'
Plug 'ziglang/zig.vim', { 'for': 'zig' }
Plug 'rhysd/vim-crystal', { 'fot': 'crystal' }
call plug#end()

runtime vimrc.lock

set nomore

set termguicolors

set background=dark
silent! colorscheme material

set backspace=indent,eol,start

nmap cn :lnext<cr>
nmap cp :lprevious<cr>

autocmd FileType * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

" Navigating within wrapped lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" CTRL-H/J/K/L in popups
inoremap <expr> <c-j> (pumvisible()?"\<C-n>":"\<c-j>")
inoremap <expr> <c-k> (pumvisible()?"\<C-p>":"\<c-k>")

" CTRL-H/L to iterate through buffers
noremap <c-h> :bprev<CR>
noremap <c-l> :bnext<CR>

" CTRL-Q to delete a buffer
noremap <c-q> :bdelete<CR>

" Search word under cursor
nnoremap <leader>gw :Ggrep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Incremental search
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

set undodir=~/.vim/undodir
set undofile
nmap <Leader>nu :UndotreeToggle<cr>

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save_no_updatetime = 0

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:ctrlp_show_hidden = 1

let g:test#preserve_screen = 0
let g:test#strategy = 'vimux'
let test#go#gotest#executable = 'gotestsum'
let g:test#go#gotest#options = {
  \ 'nearest': '-f standard-verbose --',
\}
let g:test#go#delve#options = {
  \ 'nearest': '-test.v',
\}
let g:test#ruby#rspec#options = {
  \ 'nearest': '--backtrace',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}

let g:VimuxOrientation = 'h'
let g:VimuxHeight = '35'

nmap <Leader>nt :NERDTreeToggle<cr>
nmap <Leader>nf :NERDTreeFind<cr>
function! NERDTreeFindOrToggle()
  if @% == ""
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfun
nmap <c-e> :call NERDTreeFindOrToggle()<cr>
au FileType nerdtree nmap <buffer> <c-e> :NERDTreeClose<cr>

noremap <Leader>gh :GitHubURLRepo<cr>
noremap <Leader>gf :GitHubURLBlob<cr>
noremap <Leader>gb :GitHubURLBlame<cr>

nmap <Leader>rf :wa<cr> :TestNearest<cr>
nmap <Leader>rb :wa<cr> :TestFile<cr>
nmap <Leader>ra :wa<cr> :TestSuite<cr>
nmap <Leader>rl :wa<CR> :VimuxRunLastCommand<cr>
nmap <Leader>vl :wa<CR> :VimuxRunLastCommand<cr>
nmap <Leader>vx :VimuxInterruptRunner<cr>
nmap <Leader>vz :call VimuxZoomRunner()<cr>

function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
nmap <Leader>rd :wa<cr> :call DebugNearest()<cr>

" delve
let g:delve_use_vimux = 1
au FileType go nmap gb :DlvToggleBreakpoint<cr>
au FileType go nmap gp :DlvToggleTracepoint<cr>

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 0
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
au FileType go nmap gs :GoDeclsDir<cr>
au FileType go nmap <c-i> :GoInfo<cr>
au FileType go nmap gt :GoTest!<cr>
au FileType go nmap gf :GoTestFunc!<cr>
au FileType go nmap gi :GoDescribe<cr>
au FileType go nmap <c-]> <Plug>(go-def)
au FileType go nmap gr <Plug>(go-referrers)
au FileType go nmap gv :GoVet<cr>
au FileType go nmap gc :GoCoverage<cr>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" govim
"au FileType go nmap <c-i> :call GOVIMHover()<CR>
"au FileType go nmap gr :GOVIMReferences<CR>

" vim-lsp config
"au User lsp_setup call lsp#register_server({
"  \ 'name': 'java-language-server',
"  \ 'cmd': {server_info->['/home/leighmcculloch/devel/java-language-server/dist/mac/bin/launcher']},
"  \ 'whitelist': ['java'],
"  \ })
"au User lsp_setup call lsp#register_server({
"  \ 'name': 'go-lang',
"  \ 'cmd': {server_info->['gopls']},
"  \ 'whitelist': ['go'],
"  \ })
"au FileType java,go nmap <C-e> <plug>(lsp-document-diagnostics)
"au FileType java,go nmap <C-i> <plug>(lsp-hover)
"au FileType java,go nmap <C-]> <plug>(lsp-definition)
"au FileType java,go nmap gr <plug>(lsp-references)
"au FileType java,go nmap go <plug>(lsp-document-symbol)
"au FileType java nmap gS <plug>(lsp-workspace-symbol)
"au FileType go nmap <buffer> ,n <plug>(lsp-next-error)
"au FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
"au FileType go setlocal omnifunc=lsp#complete
