" Copy & Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Open file in new tab
nmap <C-t> :tabnew<CR>:NvimTreeOpen<CR>

" Save file
nmap <C-s> :w<CR>

" Close tab
nmap <C-w> :BufferClose<CR>

" Quit
nmap <C-q> :q<CR>

" Find line
nmap <C-f> :Lines<CR>

" Find file
nmap <C-A-f> :Files<CR>

" map ctrl + b to expand
nmap <C-b> :NvimTreeToggle<CR>

" Set Ctrl+Space as copilot completion
imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Set Ctrl+Right/Left as copilot next suggestion
imap <C-Right> <Plug>(copilot-next)
imap <C-Left> <Plug>(copilot-previous)

" Set Ctrl+Enter as copilot generate
" imap <C-Enter> :Copilot<CR>
" Not working

