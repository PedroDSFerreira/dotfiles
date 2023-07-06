" Copy & Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+


" map ctrl + b to expand
nmap <C-b> :NvimTreeToggle<CR>

" Set Ctrl+Space as copilot completion
imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Set Ctrl+Right/Left as copilot next suggestion
imap <C-S-Right> <Plug>(copilot-next)
imap <C-S-Left> <Plug>(copilot-previous)

" Set Ctrl+Enter as copilot generate
" imap <C-Enter> :Copilot<CR>
" Not working

