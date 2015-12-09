" Усанавливаем 256 цветовую схему
set t_Co=256

" Показывать номера строк
set number

" Проверяем установлен ли NPM
let isNpmInstalled = executable("npm")

" Проставляем дефолтный путь к npm модулям
let s:defaultNodeModules = '~/.vim/node_modules/.bin/'

if 0 | endif
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 NeoBundle 'https://github.com/scrooloose/nerdtree'
 NeoBundle 'marijnh/tern_for_vim'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'https://github.com/Lokaltog/vim-easymotion'
 NeoBundle 'jistr/vim-nerdtree-tabs'
 NeoBundle 'Xuyuanp/nerdtree-git-plugin'
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'tpope/vim-fugitive' "Git integration
 NeoBundle 'elzr/vim-json'
 NeoBundle 'fatih/vim-go'
 NeoBundle 'airblade/vim-gitgutter'
if isNpmInstalled
    if !executable(expand(s:defaultNodeModules . 'jshint'))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
    if !executable(expand(s:defaultNodeModules . 'csslint'))
        silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
    endif
endif

 " Code complete
 NeoBundle 'Shougo/neocomplcache.vim'

 " Improve javascritp syntax higlighting, needed for good folding,
 " and good-looking javascritp code
 NeoBundle 'jelera/vim-javascript-syntax'

 "code-completion for jquery, lodash e.t.c
 NeoBundle 'othree/javascript-libraries-syntax.vim'

 " HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
 NeoBundle 'othree/html5.vim'

 " Most recent files source for unite
 NeoBundle 'Shougo/neomru.vim'

 "Google formating code...
 NeoBundle 'google/vim-maktaba'
 NeoBundle 'google/vim-codefmt'
 NeoBundle 'google/vim-glaive'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

 """""""""""""""""""""""""
 "NERDTree configuration.
 """""""""""""""""""""""""
 " Show when vim opened
 let g:nerdtree_tabs_open_on_console_startup=1
 " Tell NERDTree to display hidden files on startup
 let NERDTreeShowHidden=1
 " Disable bookmarks label, and hint about '?'
 let NERDTreeMinimalUI=1

 "Mapping toggle.
 map <C-n> :NERDTreeToggle<CR>

 """""""""""""""""""""""""
 "SOLARIZED THEME configuration
 """""""""""""""""""""""""
 syntax enable
 set background=dark
 " Принудительно заставляем использовать 256к цветов
 " Без это у меня просто были ужассные цвета...
 let g:solarized_termcolors=256
 colorscheme solarized

 "--------------------------------------------------
 "" Tab options

 " Copy indent from previous line
 set autoindent
 "
 " Enable smart indent. it add additional indents whe necessary
 set smartindent
 "
 " Replace tabs with spaces
 set expandtab
 "
 " Whe you hit tab at start of line, indent added according to shiftwidth
 " value
 set smarttab
 "
 " number of spaces to use for each step of indent
 set shiftwidth=4
 "
 " " Number of spaces that a Tab in the file counts for
 set tabstop=4
 "
 " Same but for editing operation (not shure what exactly does it means)
 " but in most cases tabstop and softtabstop better be the same
 set softtabstop=4
 "
 " Round indent to multiple of 'shiftwidth'.
 " Indentation always be multiple of shiftwidth
 " Applies to  < and > command
 " set shiftroundd

"--------------------------------------------------
" Display options

set title

" Mute error bell
set novisualbell

" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
set shortmess=atI

" Enable display whitespace characters
set list
"
" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Highlight line with cursor
set cursorline

"--------------------------------------------------
" Wildmenu

" Extended autocmpletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"---------------------------------------------------
" Syntastic options
"---------------------------------------------------


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
