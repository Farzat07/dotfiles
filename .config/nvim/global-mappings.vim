" Windows navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Mkdir for the current file.
command MkCurDir :!mkdir %:h:S -p

" Copy the last used register to the clipboard.
command Clipboard :call system('cclip', @")

" Reload settings.
command Source :source $MYVIMRC

" Automatically starts terminal emulator in insert mode.
autocmd TermOpen * startinsert
tnoremap <C-h> <C-\><C-n><C-w>h
" Workaround since <C-h> isn't working in neovim right now
" tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
