
"let g:floaterm_keymap_new    = '<F8>'
"let g:floaterm_keymap_kill   = '<A-w>'
"let g:floaterm_keymap_prev   = '<F9>'
"let g:floaterm_keymap_next   = '<F10>'
"let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']
if has('win32')
	let g:floaterm_shell = 'powershell -nologo'
endif

" Set color
hi Floaterm guibg=Grey15
hi FloatermBorder guifg=Orange guibg=DarkGreen
"hi FloatermNC guibg=darkred

"open terminal
nnoremap   <silent>   <C-x>   :FloatermToggle<CR>
tnoremap   <silent>   <C-x>   <C-\><C-n>:FloatermToggle<CR>
"
nnoremap   <F8>    :FloatermNew --position=bottomleft --height=0.8 --width=0.6 --title='Git' lazygit<CR>
