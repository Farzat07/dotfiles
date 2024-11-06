" Highlight search results, turned off for a search by :noh.
set hlsearch

" Leave 5 lines above/below when scrolling.
set scrolloff=5

" Turn on line numbering.
set number
set relativenumber

" Use the wal colorscheme from the plugin if available.
colorscheme wal

" Add a red column after textwidth limit.
set colorcolumn=+1

" Set the indentation
set tabstop=4
set shiftwidth=0

" Format files linux style.
if &modifiable==1
    set fileformat=unix
endif

" Save swap files in the same directory as the edited file.
"let &directory=".," .. &directory

" Enable plugins to be loaded based on file type.
filetype plugin on

" Do not change the shape of the letter based on its position in the word.
" When viewing right-to-left shape change can be very confusing.
set noarabicshape

" Set keymap to Arabic in case typing in Arabic was desired.
" But set iminsert=0 to have English mapping at first. Switch using i_CTRL-^.
set keymap=arabic
set iminsert=0

" Folding based on treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Disable mouse.
set mouse=

" Specify the python3 host program.
let g:python3_host_prog = '/usr/bin/python3'
