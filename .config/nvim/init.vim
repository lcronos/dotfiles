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
inoremap (<CR> (<CR><BS>)<Esc>O
inoremap (( (
inoremap () ()

inoremap [ []<Left>
inoremap [<CR> [<CR><BS>]<Esc>O
inoremap [[ [
inoremap [] []

" Close quotes
inoremap " ""<Left>
inoremap "" ""
inoremap "; "

inoremap ' ''<Left>
inoremap '' ''
inoremap '; '

" autoindent
set expandtab
set shiftwidth=5
set smarttab
set autoindent
set smartindent
