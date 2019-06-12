" Basic Setup:

" disable vi compatibility
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Finding Files:

" Search down into subfolders
" Provided tab-completion for all file-related tasks
set path+=**

" Display all matching files when tab completing
set wildmenu

" Hit tab to :find by partial match
" Use * to make it fuzzy

" :b lets you autocomplete any open buffer

" Tag Jumping

" Create the 'tags' file
command! MakeTags !ctags -R .

" Use ^] to jump to tag under cursor
" use g^] for ambiguous tags
" Use ^t to jump back up the tag stack

" This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:
" ^x^n for just this file
" ^x^f for filenames (requires path+=**)
" ^x^] for tags only
" ^n for anything specified by the 'complete' option
" ^p to search in reverse

" FILE BROWSING:

" browsing
let g:netrw_banner=0		" disable banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" :edit a folder to open a file browser
" <CR>/v/t o open in an h-split/v-split/tab
" check |netrw-browse-maps| for more mappings

set number

" Closing braces
inoremap { {}<Left>
inoremap {<CR> {<CR><BS>}<Esc>O
inoremap {{ {
inoremap {} {}

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap (( (
inoremap () ()

inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[ [
inoremap [] []

" Close quotes
inoremap " ""<Left>
inoremap "" ""
inoremap "; "

inoremap ' ''<Left>
inoremap '' ''
inoremap '; '

tnoremap <Esc> <C-\><C-n>

" autoindent
" set expandtab
set tabstop=4
" set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4

" OCaml Merlin
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" NERDTree autostart
autocmd vimenter * NERDTree

" Airline buffer names
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Language Client for ocaml
 let g:LanguageClient_serverCommands = {
     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
	 \ 'ocaml': ['ocaml-language-server', '--stdio'],
	 \ 'bash' : ['bash-language-server', 'start'],
	 \ 'sh' : ['bash-language-server', 'start'],
	 \ 'cpp' : ['cquery', '--log-file=/tmp/cq.log'],
	 \ 'c' : ['cquery', '--log-file=/tmp/cq.log'],
     \ 'python' : ['pyls'],
	 \ 'php' : ['php', '~/vendor/felixfbecker/language-server/bin/php-language-server.php']
	 \ }

" Mapings for reasonml
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
set omnifunc=LanguageClient#complete

call plug#begin()
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
