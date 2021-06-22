" Basic Setup:

" disable vi compatibility
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Set elixir file extensions
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir

" " Finding Files:
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

" Allow mouse wheel without clicks
set mouse=a
map <LeftMouse> <nop>

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
map <F2> :NERDTreeToggle<CR>

" Airline buffer names
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Language Clients
"  let g:LanguageClient_serverCommands = {
" 	 \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
" 	 \ 'bash' : ['bash-language-server', 'start'],
" 	 \ 'sh' : ['bash-language-server', 'start'],
" 	 \ 'cpp' : ['clangd'],
" 	 \ 'c' : ['clangd'],
"	 \ 'elixir' : ['~/.bin/elixir-ls/language_server.sh']
"	 \ }


" Mappings for reasonml
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
" set omnifunc=LanguageClient#complete

" Mappings for Elixir
" nnoremap <F3> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F4> :call LanguageClient#textDocument_rename()<CR>

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'sbdchd/neoformat'
Plug 'ncm2/ncm2' " Nvim-completion-manager
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp' " Dependency for ncm2
Plug 'neomake/neomake'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'junegunn/fzf'
Plug 'elixir-lang/vim-elixir'
Plug 'whonore/Coqtail'
Plug 'machakann/vim-sandwich'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNGuyen/papercolor-theme'
" Plug 'luochen1990/rainbow'
Plug 'frazrepo/vim-rainbow'
call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Coquille Bindings
au FileType coq call coquille#FNMapping()
map <buffer> <silent> <F6> :CoqLaunch -Q ../plf PLF<CR>15<C-w>>
map <buffer> <silent> <F5> :CoqKill<CR>
imap <buffer> <silent> <F6> <C-\><C-o>:CoqLaunch -Q ../plf PLF<CR>15<C-w>>
imap <buffer> <silent> <F5> <C-\><C-o>:CoqKill<CR>

" Set leader to space
let mapleader = "\<Space>"

" Nerd Commenter Stuff
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckALlLines = 1

" Theming
let g:airline_theme='nord_minimal'
let g:rainbow_active=1
set t_Co=256
set termguicolors
colorscheme nord
set laststatus=2

" Easy terminal access
map <Leader>tt :20new term://zsh<CR>i

set splitbelow splitright

set guifont=FiraCode\ Nerd\ Font\ Mono

lua << EOF
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.rust_analyzer.setup{}
EOF
