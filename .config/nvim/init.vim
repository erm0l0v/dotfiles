" NeoBundle Scripts -----------------------------{{{
    if has('vim_starting')  
    set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
    set runtimepath+=~/.config/nvim/
    endif

    let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

    if !filereadable(neobundle_readme)  
    echo "Installing NeoBundle..."
    echo ""
    silent !mkdir -p ~/.config/nvim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
    let g:not_finsh_neobundle = "yes"
    endif

    call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
    NeoBundleFetch 'Shougo/neobundle.vim'

    " ------------------------------------
    " THIS IS WHERE YOUR PLUGINS WILL COME
    " ------------------------------------

    " NERDTree
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'Xuyuanp/nerdtree-git-plugin'
    NeoBundle 'ryanoasis/vim-devicons'

    " Add smart commands for comments like:
    " gcc - Toggle comment for the current line
    " gc  - Toggle comments for selected region or number of strings
    " Very usefull
    NeoBundle 'tomtom/tcomment_vim'

    " Airline
    NeoBundle 'bling/vim-airline'

    " Git
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'tpope/vim-fugitive'

    " Code
    NeoBundle 'cloudhead/neovim-fuzzy'
    NeoBundle 'Raimondi/delimitMate'
    NeoBundle 'vim-syntastic/syntastic'

    " Python
    NeoBundle 'jmcantrell/vim-virtualenv'

    " Themes
    NeoBundle 'altercation/vim-colors-solarized'

    call neobundle#end()  
    filetype plugin indent on

    " If there are uninstalled bundles found on startup,
    " this will conveniently prompt you to install them.
    NeoBundleCheck  
" }}}

" Base settings ------------------------------{{{
    let mapleader = ','

    " Auto reload changed files
    set autoread

    setlocal spell spelllang=en_us

    " Set character encoding to use in vim
    set encoding=utf-8

    " Let vim know what encoding we use in our terminal
    set termencoding=utf-8

    " Which EOl used. For us it's unix
    " Not works with modifiable=no
    if &modifiable
    set fileformat=unix
    endif

    " Display command which you typing and other command related stuff
    set showcmd

    " Display Line numbers
    set number

    " maximum text length at 80 symbols, vim automatically breaks longer lines
    set textwidth=120

    " higlight column right after max textwidth
    set colorcolumn=+1

    map <Leader>n :set rnu!<CR>

    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h

    vnoremap < <gv
    vnoremap > >gv

    " Round indent to multiple of 'shiftwidth'.
    " Indentation always be multiple of shiftwidth
    " Applies to  < and > command
    set shiftround

    map Y y$

    set mouse=a

    set clipboard=unnamed

    " Replace tabs with spaces
    set expandtab

    " Whe you hit tab at start of line, indent added according to shiftwidth value
    set smarttab

    " number of spaces to use for each step of indent
    set shiftwidth=4

    " Number of spaces that a Tab in the file counts for
    set tabstop=4

    " Same but for editing operation (not shure what exactly does it means)
    " but in most cases tabstop and softtabstop better be the same
    set softtabstop=4

    " Make < and > match as well
    set matchpairs+=<:>

    " toggle paste mode on \p
    set pastetoggle=<leader>p

    " Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
    set iskeyword+=-

    set laststatus=2

    " let g:python_host_prog = '/Users/kej/.pyenv/shims/python'
    " let g:python3_host_prog = '/usr/local/bin/python3'
" }}}

" Theme ------------------------------{{{
    syntax enable

    if has("gui_running")

        " Use solarized colorscheme
        colorscheme solarized

        " Setting up light color scheme
        set background=light

        set guifont=Ayuthaya:h13

        set guioptions=r

        let g:airline_theme='solarized'

        hi MatchParen gui=underline guibg=NONE guifg=blue

    else

        colorscheme desert

        hi! DiffAdd      ctermbg=65
        hi! DiffChange   ctermbg=237
        hi! DiffDelete   ctermbg=203
        hi! DiffText     ctermbg=8
        hi Pmenu ctermbg=black ctermfg=gray
        highlight ColorColumn ctermbg=darkGrey
        highlight LineNr ctermfg=grey
        hi! SpellBad cterm=underline ctermbg=none
        hi! SpellCap cterm=underline ctermbg=none
        hi! SpellRare cterm=underline ctermbg=none
        hi! SpellLocal cterm=underline ctermbg=none
        hi MatchParen cterm=underline ctermbg=none ctermfg=blue
        hi Comment ctermfg=gray
    endif
" }}}

" NERDTree settings ------------------------------{{{
    " Display current file in the NERDTree ont the left
    nmap <silent> <leader>f :NERDTreeFind<CR>

    map <Leader>t :NERDTreeToggle<CR>

    let NERDTreeWinSize = 40

    " files/dirs to ignore in NERDTree (mostly the same as my svn ignores)
    let NERDTreeIgnore=['\~$', '\.AppleDouble$', '\.beam$', 'build$', 'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$', '\.lo$', '\.\~lock.*#$', '\.mo$', '\.o$', '\.pt.cache$', '\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$', '\.rej$', '\.git$', '\.tags$', '\.ropeproject', '\.codekit-cache' ]

    " Close vim if the only window left open is a NERDTree?
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

" NERDTree git settings ------------------------------{{{
    " Custom symbols
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }

    " Show ignored status (a heavy feature may cost much more time)
    " let g:NERDTreeShowIgnoredStatus = 1
"}}}

" Airline ------------------------------{{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.maxlinenr = ' ☰'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.linenr = ''

    let g:airline#extensions#virtualenv#enabled = 1
    let g:airline#extensions#hunks#enabled = 1

    let g:airline#extensions#tabline#show_tabs = 1
    let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>+ <Plug>AirlineSelectNextTab
"}}}

" Devicons ------------------------------{{{
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
    let g:airline_powerline_fonts = 1
"}}}

" Neovim Fuzzy ------------------------------{{{
    nnoremap <C-p> :FuzzyOpen<CR>
    nnoremap <C-f> :FuzzyGrep<CR>
"}}}

" Fold, gets it's own section  ----------------------------------------------{{{
    function! MyFoldText() " {{{
        let line = getline(v:foldstart)
        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        " expand tabs into spaces
        let onetab = strpart('          ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')

        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines '
    endfunction " }}}

    set foldtext=MyFoldText()

    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

    autocmd FileType vim setlocal fdc=1
    set foldlevel=99
    " Space to toggle folds.
    nnoremap <Space> za
    vnoremap <Space> za
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
    autocmd FileType html setlocal fdl=99

    autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
    autocmd FileType css,scss,json setlocal foldmethod=marker
    autocmd FileType css,scss,json setlocal foldmarker={,}

    autocmd FileType coffee setl foldmethod=indent
    autocmd FileType html setl foldmethod=expr
    let g:xml_syntax_folding = 1
    autocmd FileType xml setl foldmethod=syntax
    autocmd FileType html setl foldexpr=HTMLFolds()

    autocmd FileType javascript,typescript,json setl foldmethod=syntax
" }}}

" DelimitMate ------------------------------{{{
" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1
" }}}

" Syntastic ------------------------------{{{
    let g:syntastic_python_checkers = ['pylint']
" }}}
