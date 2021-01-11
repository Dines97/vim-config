call plug#begin()
	Plug 'joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
	Plug 'mhinz/vim-startify'
	Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
call plug#end()

" Fast open main config files
command! EditConfig :vsplit $MYVIMRC
command! ApplyConfig :source $MYVIMRC
command! EditCocConfig :vsplit ~/.config/nvim/coc-settings.json 

" Faster move between splits
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Faster split resizing
" Want to change to Ctrl + Shift
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-


set number relativenumber

" Add italic for to some syntax groups 
if (has("autocmd"))
  augroup colorextend
    autocmd!
    let s:colors = onedark#GetColors()
    let s:purple = s:colors.purple
    autocmd ColorScheme * call onedark#set_highlight("Conditional", {"fg": s:purple, "cterm": "italic"})
    autocmd ColorScheme * call onedark#set_highlight("Repeat", {"fg": s:purple, "cterm": "italic"})
    autocmd ColorScheme * call onedark#set_highlight("Label", {"fg": s:purple, "cterm": "italic"})
    autocmd ColorScheme * call onedark#set_highlight("Exception", {"fg": s:purple, "cterm": "italic"})
  augroup END
endif

let g:onedark_terminal_italics = 1
syntax on
colorscheme onedark

" Move cursor to the new line at the end of line
set whichwrap+=<,>,h,l,[,]

" Add spell check 
set spelllang=en
set spell spelllang=en

" :W will save current file with sudo 
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

