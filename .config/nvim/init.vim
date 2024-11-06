" Some settings need to be made before loading the plugins.
for fileName in globpath(stdpath("config") .. '/early-settings', '*', 0, 1)
    execute 'source ' . fnameescape(fileName)
endfor

" Install and manage the plugins.
source <sfile>:p:h/plugins.vim

" Regular settings.
source <sfile>:p:h/regular.vim

" Global mappings.
source <sfile>:p:h/global-mappings.vim

" Plugin config.
for fileName in globpath(stdpath("config") .. '/plugin-settings', '*', 0, 1)
    execute 'source ' . fnameescape(fileName)
endfor

" Emmit.vim settings.
let g:user_emmet_expandabbr_key = '<C-y>y'
