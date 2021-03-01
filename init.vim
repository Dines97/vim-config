"
" ██████   █████                                ███                 
"░░██████ ░░███                                ░░░                  
" ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  
" ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ 
" ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ 
" ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ 
" █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████
"░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ 
"

call plug#begin()
  "One dark theme
  Plug 'joshdick/onedark.vim'

  "Language pack for syntax highlight
  Plug 'sheerun/vim-polyglot'
  
  "Language client
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  "File explorer
  Plug 'preservim/nerdtree'

  "Fancy start screen
  Plug 'mhinz/vim-startify'

  "Git diff markers in gutter
  Plug 'airblade/vim-gitgutter'

  "Configurable status line plugin 
  Plug 'itchyny/lightline.vim'

  "Indention level lines
  Plug 'Yggdroot/indentLine'


  Plug 'Xuyuanp/nerdtree-git-plugin'

  
  Plug 'ryanoasis/vim-devicons'

  
  Plug 'drmikehenry/vim-headerguard'


  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

  Plug 'dense-analysis/ale'
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

set tabstop=2 shiftwidth=2 expandtab

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
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd ColorScheme * match ExtraWhitespace /\s\+$/
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
command WW :execute ':silent w !sudo tee % > /dev/null' | :edit!


let NERDTreeShowHidden=1


tnoremap <Esc> <C-\><C-n>


nmap <leader>qf  <Plug>(coc-fix-current)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


