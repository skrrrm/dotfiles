""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""
    call plug#begin('~/.config/nvim/plugged')
        Plug 'itchyny/lightline.vim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/goyo.vim'
        Plug 'arcticicestudio/nord-vim'
        Plug 'mcchrish/nnn.vim'
        Plug 'norcalli/nvim-colorizer.lua'
        Plug 'airblade/vim-gitgutter'
        Plug 'mhinz/vim-startify'
        Plug 'liuchengxu/vim-which-key'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'tpope/vim-commentary'
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'
        Plug 'vim-pandoc/vim-rmarkdown'
        Plug 'vim-pandoc/vim-markdownfootnotes'
        Plug 'mrmargolis/dogmatic.vim'
    call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Basic basic
        let mapleader=" "                       " Leader key
        colorscheme nord                        " Set color scheme
        syntax enable                           " Enables syntax highlighing
        set hidden                              " Required to keep multiple buffers open multiple buffers
        set nowrap                              " Display long lines as just one line
        set encoding=utf-8                      " The encoding displayed
        set pumheight=10                        " Makes popup menu smaller
        set fileencoding=utf-8                  " The encoding written to file
        set ruler                               " Show the cursor position all the time
        set cmdheight=2                         " More space for displaying messages
        set iskeyword+=-                        " treat dash separated words as a word text object"
        set mouse=a                             " Enable your mouse
        set splitbelow                          " Horizontal splits will automatically be below
        set splitright                          " Vertical splits will automatically be to the right
        set termguicolors                       " Support guiccolors
        set conceallevel=0                      " So that I can see `` in markdown files
        set number relativenumber               " Line numbers
        set cursorline                          " Enable highlighting of the current line
        set background=dark                     " tell vim what the background color looks like
        set showtabline=2                       " Always show tabs
        set noshowmode                          " We don't need to see things like -- INSERT -- anymore
        set nobackup                            " This is recommended by coc
        set nowritebackup                       " This is recommended by coc
        set updatetime=300                      " Faster completion
        set timeoutlen=500                      " By default timeoutlen is 1000 ms
        set formatoptions-=cro                  " Stop newline continution of comments
        set clipboard=unnamedplus               " Copy paste between vim and everything else
        set autochdir                           " Your working directory will always be the same as your working directory
        set ignorecase                          " Ignore uppercase when fx searching
        set smartcase                           " Smartcase when fx searching
    " Tab settings
        set tabstop=4                           " Insert 4 spaces for a tab
        set shiftwidth=4                        " Change the number of space characters inserted for indentation
        set softtabstop=4
        set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
        set expandtab                           " Converts tabs to spaces
        set smartindent                         " Makes indenting smart
        set autoindent                          " Good auto indent
    " Better tabbing - need to figure this out.
        vnoremap < <gv
        vnoremap > >gv
    " Center screen when toggling insert mode
        autocmd InsertEnter * norm zz
    " Remove trailing white space
        autocmd BufWritePre * %s/\s\+$//e
    " Autcompletion in vim command mode
        set wildmode=longest,list,full
    " Split navigation remapped
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
    " Disable arrow keys for breaking a habit
        map <Up> <NOP>
        map <Down> <NOP>
        map <Left> <NOP>
        map <Right> <NOP>
    " cusorline and column color - Must be after colorscheme
        highlight CursorLine cterm=bold guibg=#252a34
        highlight CursorColumn cterm=bold guibg=#252a34
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " set spellcheck in these filetypes - bound to leader+s
        autocmd FileType tex,latex,markdown,r setlocal spell! spelllang=da
        nmap <F7> :setlocal spell! spelllang=da<CR>
        nmap <F8> :setlocal spell! spelllang=en_us<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " colorscheme
        let g:lightline = {
            \ 'colorscheme': 'nord',
            \ }
    " more or less default - added spell
        let g:lightline.active = {
		    \ 'left': [ [ 'mode', 'paste' ],
		    \           [ 'readonly', 'filename', 'modified', 'spell' ] ],
		    \ 'right': [ [ 'lineinfo' ],
		    \            [ 'percent' ],
		    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
		let g:lightline.inactive = {
		    \ 'left': [ [ 'filename' ] ],
		    \ 'right': [ [ 'lineinfo' ],
		    \            [ 'percent' ] ] }
		let g:lightline.tabline = {
		    \ 'left': [ [ 'tabs' ] ],
		    \ 'right': [ [ 'close' ] ] }
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnn - filemanager in vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Disable default mappings
        let g:nnn#set_default_mappings = 0
    " Start nnn in the current file's directory
        nnoremap <leader>n :NnnPicker '%:p:h'<CR>
    " Opens the nnn window in a split
        "let g:nnn#layout = 'vnew' " or vnew, tabnew etc.
    " Or pass a dictionary with window size
        let g:nnn#layout = { 'left': '~20%' } " or right, up, down
    " Floating window (neovim latest and vim with patch 8.2.191)
        "let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
    " Open files from nnn in vim-splits
        let g:nnn#action = {
            \ '<c-t>': 'tab split',
            \ '<c-x>': 'split',
            \ '<c-v>': 'vsplit' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WhichKey - look up keybindings with space
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorizer
""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " must have for colorizer
        lua require'colorizer'.setup()
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-rmarkdown && vim-pandoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Compile to pdf with rmarkdown
        nmap <leader>c :w! \| :RMarkdown pdf<CR>
   " Open curent file in pdf via the opout script (/usr/local/bin/)
        nmap <leader>o :!opout <c-r>%<CR><CR>
    " Disable code folding
        let g:pandoc#modules#disabled = ["folding"]
    " not sure what this does
       " let g:pandoc#syntax#conceal#use = 0
    " sets the filetype as rmarkdown if the file ending is .rmd for the sake of vim
       autocmd BufRead,BufNewFile *.rmd set filetype=rmarkdown
