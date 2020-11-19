"Installing Vim-Plug if doesn't exists.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
set nocp
syntax enable
filetype indent plugin on

" set shell=/bin/bash
set hidden
set wildmenu
set nobackup
set noswapfile
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set noerrorbells
set smartindent
set undodir=~/.vim/undodir
set undofile
set backspace=indent,eol,start
set laststatus=2
set autowrite
set hls ic is " Turning on Highlighting, Case insensitive and Incremental Search. 
set nu rnu numberwidth=5 " Setting Number + Relative number
set shortmess-=S

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set diffopt=vertical


call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rhubarb'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary' 
Plug 'rust-lang/rust.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'
" Use ctrl-y, to complete.
Plug 'mattn/emmet-vim'
Plug 'evanleck/vim-svelte'

" Themes
Plug '~/vim-plugins/pleasant.vim'
" Plug 'RohanPoojary/pleasant.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()

" let g:netrw_banner = 1
let g:netrw_winsize = 20
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:deoplete#enable_at_startup = 1

let g:sneak#label = 1

" Ultisnips controls
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:UltiSnipsEditSplit="vertical"

" Rust Options
let g:rustfmt_autosave = 1

" Go Options
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_updatetime = 200
let g:go_decls_mode='fzf'
let g:go_imports_autosave = 1

" Vim Wiki Settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]



set termguicolors
let &t_ZH="\e[3m"
let &t_ZR="\e[24m"
" let g:pleasant_bold = 1
" let g:pleasant_italic = 1
let g:pleasant_bold = 1
" let g:pleasant_italic = 1
let g:sql_type_default='mysql'
colorscheme pleasant
" colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme = 'pleasant'

autocmd FileType svelte setlocal commentstring=<!--\ %s\ -->

let s:jira = 'NONE'
function! UpdateJira() abort
    let s:jira = ''
    let s:git_log_splits = split(system('git log -1'), '\n\n')
    if len(s:git_log_splits) > 1
        let s:git_log = trim(s:git_log_splits[1])
        let s:jira = matchstr(s:git_log,  '^\w\+-\d\+')
    endif
endfunction!


augroup jira
    autocmd!
    autocmd BufReadPost,BufNewFile * call UpdateJira()
augroup END


augroup Abbrevations
    autocmd!
    autocmd FileType go,python iabbrev <buffer> ret return
augroup end

iabbrev rrp rohanrp23@gmail.com

" Inserts results of unix command
function! ExternalCommandResult()                                                                                                                         
  return system(input('Command: '))[:-2]                                                                                                                  
endfunction                                                                                                                                               

inoremap <C-R>! <C-R>=ExternalCommandResult()<cr>

function! RecentJira() abort
    " If Jira exists then the current one is sent.
    if s:jira != 'NONE'
        return s:jira
    endif

    " Loading latest jira.
    call UpdateJira()
    return s:jira
endfunction!

" let g:airline_theme = 'pleasant'


let g:lightline = {
      \ 'colorscheme': 'pleasant',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'recentjira' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'recentjira': 'RecentJira'
      \ },
      \ }


" All Bindings
nnoremap <up> :res -3<CR>
nnoremap <down> :res +3<CR>
nnoremap <left> :vertical resize -3<CR>
nnoremap <right> :vertical resize +3<CR>

" Map Ctrl+P to open Fuzzy Finder.
noremap <c-p> :FZF<CR>
nmap // :BLines<CR>
nmap ?? :Rg<CR>

" Quick window movements
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Persist tabbing in visual mode.
vnoremap < <gv
vnoremap > >gv


imap jj <Esc>
nnoremap <C-c> <Esc>

" To move across Buffers
nnoremap gb :Buffers<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Alt + {j, k} moves a line or selection up or down resp.
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv


" Custom Bindings

let mapleader = ' '
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

nnoremap <c-s> :w<CR>
nnoremap <c-q> :q<CR>

nnoremap <leader>so :so ~/.vimrc<CR>

command! BufOnly silent! execute ":%bd|e#|bd#"
nnoremap <leader>D :BufOnly<CR>

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lex!
    endif
endfunction

" Remap NerdTree Open
nmap <leader>m :Lex!<CR>

" Coc Handling
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gD <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)
nmap <silent><leader>rn <Plug>(coc-rename)

" Remap Go controls
nnoremap <leader>god :GoDeclsDir<CR>
nnoremap <leader>goD :GoDecls<CR>
nnoremap <leader>goh :GoSameIdsAutoToggle<CR>
nnoremap <leader>t :GoTest<CR>

" Git Controls
nmap <leader>ga :Gwrite<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>a :diffget //2<CR>
nnoremap <leader>f :diffget //3<CR>

nnoremap <leader>no :noh<CR>


" Remap Window Navigations
noremap <leader>j :cnext<CR>
noremap <leader>k :cprevious<CR>

" Toggles Limelight Plugin
nnoremap <leader>L :Limelight!!<CR>

" Copies visually selected to clipboard in mac
map <leader>c "+

" close if final buffer is netrw or the quickfix
" autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif


" Highlighting Terminal Cursor
" hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

