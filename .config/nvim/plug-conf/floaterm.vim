let g:floaterm_wintype='floating'
" let g:floaterm_height=6

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.9
let g:floaterm_borderchars='-'
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
hi Floaterm guibg=black
hi FloatermBorder guibg=DarkCyan 
"guifg=cyan


" Toggles
nnoremap <C-p> :FloatermNew fzf<CR>
nnoremap <leader>fs :FloatermNew zsh<CR>
nnoremap <leader>fl :FloatermNew lf<CR>
nnoremap <leader>fp :FloatermNew  wintype='normal' position='right' width=0.5 ipython<CR>
nnoremap <leader>ff :FloatermToggle<CR>
