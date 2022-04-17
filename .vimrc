syntax on

set showcmd
set noerrorbells
set tabstop=2 softtabstop=2
set mouse=a
set shiftwidth=2
set expandtab
set smartindent
set number
set cursorline
set nowrap 
set smartcase
set noswapfile
set nobackup
set incsearch
set undodir=~/.vim/undodir
set undofile
set colorcolumn=80
set encoding=UTF-8
"different cursor 5->blinking bar in insert mode 1->blinking 
"block for different mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"



"copy and pasting in vim to other program
noremap <C-c> "+y
"to save current session
nmap SQ <ESC>:mksession! ~/.vim/Session.vim<CR>:wqa<CR>
function! RestoreSession()
  if argc() == 0  "vim called without arguments
    execute 'source ~/.vim/Session.vim'
  end
endfunction
autocmd VimEnter * call RestoreSession()


highlight ColorCoulmn ctermbg=0 guibg=lightgrey
imap ii <Esc>




set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"auto-save bundle
Bundle 'https://github.com/907th/vim-auto-save.git'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"auto save setting
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]





call plug#begin('~/.vim/plugged')
 "autocomplete
Plug 'deoplete-plugins/deoplete-jedi'

"The NERDTree is a file system explorer for the Vim editor. 
"Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, 
"and perform basic file system operations.
Plug 'preservim/nerdtree'

"" Save state of directory
Plug 'scrooloose/nerdtree-project-plugin' 

" Adds filetype-specific icons to NERDTree files and folders,
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin' "Shows Git status flags for files and folders in NERDTree.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Adds syntax highlighting to NERDTree based on filetype.
Plug 'scrooloose/nerdtree-project-plugin' "Saves and restores the state of the NERDTree between sessions.
Plug 'PhilRunninger/nerdtree-buffer-ops' "1) Highlights open files in a different color. 2) Closes a buffer directly from NERDTree.
Plug 'PhilRunninger/nerdtree-visual-selection' "Enables NERDTree to open, delete, move, or copy multiple Visually-selected files at once.

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"vim-nerdtree-syntax-highlight
"NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
"true snippet and additional text setup

"color scheme
Plug 'morhetz/gruvbox'

"auto bracket pairing"
"Plug 'jiangmiao/auto-pairs'

"python syntax higlighting
Plug 'sentientmachine/pretty-vim-python'

"PlugInstall to add latest plugins
call plug#end()

"Color scheme activation
let g:gruvbox_contrast_dark= 'soft'
let g:gruvbox_termcolors = 241
colorscheme gruvbox
set background=dark

" Syntax Highlighting for python
" colorscheme molokai
highlight Comment cterm=bold
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" Enable Emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango EmmetInstall
let g:user_emmet_leader_key='<Tab>'
" Key mapping for NERDTree
:map <C-n> :NERDTree

" Key mapping for below vertical Terminal
:map <C-t> :below vertical terminal
" coc config
