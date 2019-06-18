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

" Flutter configurations
let g:flutter_command = "flutter"
let g:flutter_hot_reload_on_save = 1

" Linting
:command GoLint !golangci-lint run
:command SimulatorStart !open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
:command SimulatorStop !osascript -e 'quit app "'Simulator'"'
