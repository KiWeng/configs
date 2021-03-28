" Vim with all enhancements
"source $VIMRUNTIME/vimrc_example.vim
"

"" START OF NEO VIM FOR VSCODE
"" THEME CHANGER

"" THEME CHANGER
"function! SetCursorLineNrColorInsert(mode)
"    " Insert mode: blue
"    if a:mode == "i"
"        call VSCodeNotify('nvim-theme.insert')

"    " Replace mode: red
"    elseif a:mode == "r"
"        call VSCodeNotify('nvim-theme.replace')
"    endif
"endfunction


"function! SetCursorLineNrColorVisual()
"    set updatetime=0
"    call VSCodeNotify('nvim-theme.visual')
"endfunction

"vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
"nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
"nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
"nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual

"function! SetCursorLineNrColorVisual()
"    set updatetime=0
"    call VSCodeNotify('nvim-theme.visual')
"endfunction

"vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
"nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
"nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
"nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual


"augroup CursorLineNrColorSwap
"    autocmd!
"    autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
"    autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
"    autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
"augroup END
"" END OF NEO VIM FOR VSCODE

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

syntax on
filetype plugin on
runtime macros/matchit.vim
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" Adding python support for nvim
let g:python3_host_prog="/usr/bin/python3"

set shiftwidth=4
set softtabstop=4
set expandtab
set history=200
set nocompatible
set nu
set wildmode=full
set fillchars=vert:\
set shortmess+=c    "Disable completion info at statuesbar"

" Disable visual bell
set visualbell
set t_vb=

" Disalbe deoplete's preview window
set completeopt-=preview

" Plugin management using vim-plugs
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" Auto install vim-plug if its not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/vimplgins')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Airline
Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline.git'

" Airline Themes
Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline-themes.git'

" Base16 color theme
Plug 'https://github.com.cnpmjs.org/chriskempson/base16-vim.git'

" Haskell support
Plug 'https://github.com.cnpmjs.org/neovimhaskell/haskell-vim.git', { 'for': 'haskell' }

" Rust support
Plug 'https://github.com.cnpmjs.org/rust-lang/rust.vim.git', { 'for': 'rust' }

" Surround.vim
Plug 'https://github.com.cnpmjs.org/tpope/vim-surround.git'

" Nerdcommenter
Plug 'https://github.com.cnpmjs.org/preservim/nerdcommenter.git'

" Goyo
Plug 'https://github.com.cnpmjs.org/junegunn/goyo.vim.git'

" Rainbow Parenthesis
Plug 'https://github.com.cnpmjs.org/kien/rainbow_parentheses.vim.git'

" Auto-Pairs
Plug 'https://github.com.cnpmjs.org/jiangmiao/auto-pairs.git'

" Surround.vim
Plug 'https://github.com.cnpmjs.org/tpope/vim-surround.git'

" Tabnine ### WARNING this might take AGES to install ###
"Plug 'https://github.com.cnpmjs.org/codota/tabnine-vim.git'

" Prequesition of vim-markdown, tabular
Plug 'https://github.com.cnpmjs.org/godlygeek/tabular.git', {'for': 'markdown'}

" Markdown support
Plug 'https://github.com.cnpmjs.org/plasticboy/vim-markdown.git', {'for': 'markdown'}

" " Language server support for vim
" Plug 'https://github.com.cnpmjs.org/autozimu/LanguageClient-neovim.git', {
"     \'branch': 'next',
"     \'do': 'bash install.sh',
"     \}

" ALE
Plug 'https://github.com.cnpmjs.org/dense-analysis/ale.git'

" Auto completion using deoplete.nvim
" ATENTION deoplet.nvim requires python3 
if has('nvim')
    Plug 'https://github.com.cnpmjs.org/Shougo/deoplete.nvim.git', {'do': 'UpdateRemotePlugins'}
else
    Plug 'https://github.com.cnpmjs.org/Shougo/deoplete.nvim.git'
    Plug 'https://github.com.cnpmjs.org/roxma/nvim-yarp.git'
    Plug 'https://github.com.cnpmjs.org/roxma/vim-hug-neovim-rpc.git'
endif
let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

" airline-smart tab line, tweak the formatter
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Set airline theme
let g:airline_theme='powerlineish'

"haskell-vim settings
let g:haskell_enable_quantification = 1
" to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1
" to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1
" to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1
" to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1   
" to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1
" to enable highlighting of `static`
let g:haskell_backpack = 1
" to enable highlighting of backpack keywords

" Nerdcomment settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Rainbow parenthesis settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-markdown settings
let g:vim_markdown_math = 1

" deoplete.nvim settings
call deoplete#custom#option('sources', {
    \'_': ['ale'],
    \})
call deoplete#custom#option({
    \'auto_complete_delay': 200,
    \'max_list': 10,
    \})

" " LanguageClient configurations
" let g:LanguageClient_serverCommands = {
"     \ 'rust':[  '~/.cargo/bin/rustup', 'run', 'stable', 'rls' ]
"     \ }
" " Mapping
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <F5> <Plug>(lcn-menu)

" ALE configurations
let g:ale_sign_column_always = 1
" let g:ale_completion_enable = 1
" set omnifunc=ale#completion#OmniFunc
nmap  gd <Plug>(ale_go_to_definition)

" Gvim specific settings
if has("gui_running")
    colorscheme base16-summerfruit-dark
    "set guifont=JetBrains\ Mono:h13
    set guioptions=
    "set renderoptions=type:directx
    set encoding=utf-8
endif
