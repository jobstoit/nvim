" General
syntax on
filetype plugin indent on
set number

" set relateive numbers
set relativenumber

" Theming
colorscheme citylights
hi! Normal ctermbg=NONE guibg=NONE
hi! LineNr ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Key mapping
inoremap <C-Space> <C-x><C-o>
nmap - :Ex<CR>
nmap \ :vsp .<CR>
nmap <C-l> :lnext<CR>
nmap <C-h> :lprevious<CR>
nmap <C-j> :cnext<CR>
nmap <C-k> :cprevious<CR>
nmap <C-\> :tabe<CR>:terminal<CR><C-w>j:q<CR>

" Nvim Terminal remap
tnoremap <Esc> <C-\><C-n>

set completeopt-=preview

" Dart configuration
let g:dart_format_on_save = 1
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_enable_autocomplete = v:false
let g:dart_style_guide = 2

" Use all the defaults (recommended):
 let g:lsc_auto_map = v:true

" " Apply the defaults with a few overrides:
 let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" " Setting a value to a blank string leaves that command unmapped:
 let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" " ... or set only the commands you want mapped without defaults.
" " Complete default mappings are:
 let g:lsc_auto_map = {
     \ 'GoToDefinition': '<C-]>',
     \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
     \ 'FindReferences': 'gr',
     \ 'NextReference': '<C-n>',
     \ 'PreviousReference': '<C-p>',
     \ 'FindImplementations': 'gI',
     \ 'FindCodeActions': 'ga',
     \ 'Rename': 'gR',
     \ 'ShowHover': v:true,
     \ 'DocumentSymbol': 'go',
     \ 'WorkspaceSymbol': 'gS',
     \ 'SignatureHelp': 'gm',
     \ 'Completion': 'omnifunc',
     \}

" rust completion
"let g:ale_linters = {'rust': ['analyzer', 'rls', 'rustc']}
"let g:ale_fixers = { 'rust': ['rustfmt']}
"let g:rustfmt_autosave = 1
"set omnifunc=ale#completion#OmniFunc
"let g:ale_completion_enabled = 1
"
lua require'lspconfig'.rust_analyzer.setup({})
lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

EOF

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
