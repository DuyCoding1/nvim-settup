set mouse=a 				" Enable mouse
set tabstop=4 				" 
set shiftwidth=4 			" 
set listchars=tab:\|\ 		" Tab charactor 
set list
set foldmethod=indent 		" 
set foldlevelstart=99 		"  
set number 					" Show line number
set ignorecase 				" Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

syntax on

if has('win32')
	set clipboard=unnamed  
else
	set clipboard=unnamedplus
endif

au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
		\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
			\ | checktime 
		\ | endif
autocmd FileChangedShellPost *
		\ echohl WarningMsg 
		\ | echo "File changed on disk. Buffer reloaded."
		\ | echohl None
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

call plug#begin(stdpath('config').'/lua')
"theme
Plug 'joshdick/onedark.vim'

"tim kiem thu muc
Plug 'preservim/nerdTree' 						" File browser  
Plug 'Xuyuanp/nerdtree-git-plugin' 				" Git status
Plug 'ryanoasis/vim-devicons' 					" Icon
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync' 				" Sync current file 

"file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 			" Fuzzy finder 
Plug 'junegunn/fzf.vim'

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal
Plug 'voldikss/vim-floaterm' 

"langue server
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim' 
Plug 'preservim/nerdcommenter' 					" Comment code 
Plug 'liuchengxu/vista.vim' 					" Function tag bar 
Plug 'alvan/vim-closetag' 						" Auto close HTML/XML tag 

"highlight code
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Debugging
Plug 'puremourning/vimspector' 					" Vimspector
" support git 
Plug 'tpope/vim-fugitive' 
"phu
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

colorscheme onedark

if (has("autocmd"))
	augroup colorextend
		autocmd ColorScheme 
			\ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
		autocmd ColorScheme 
			\ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
	augroup END
endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor


