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

if executable('cargo')
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
endif
