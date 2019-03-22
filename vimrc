" General
execute pathogen#infect()
syntax on
filetype plugin indent on
set number

" Theming
colorscheme citylights
hi! Normal ctermbg=NONE guibg=NONE
hi! LineNr ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Key mapping
inoremap <C-Space> <C-x><C-o>
nmap - :Ex<CR>
nmap \ :vsp .<CR>

" Go configurations
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1

