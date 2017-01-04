" Do not keep compatibility with Vi, use all of Vim's features
set nocompatible
set hlsearch
" Do not use select mode, only use visual mode (see next option)
set selectmode=
" This option controls the behaviour of the buttons when selecting
" text.  I dont like selectmode, since it is useless <g>.  Using
" visual mode all the time when selecting text allows you to perform
" a lot more functions over the selected range.
" selectmode is really there to make Vim more like Windows.
" This also forces the buttons on the mouse to perform like Unix, not
" Windows
behave xterm
set cursorline
"set cursorcolumn
set laststatus=2
set shortmess=at
set whichwrap=<,>,h,l
set history=500
set nobackup
set nowritebackup
set incsearch
set showcmd
set cmdheight=3
set showbreak=>>
set nostartofline
set joinspaces
set nrformats-=octal
set ignorecase smartcase
set virtualedit=
set modelines=10
set shiftwidth=4
set nodigraph
set esckeys
set hidden
set ruler
set showmatch
set visualbell
set wildmenu
set noerrorbells
set autoindent
set autochdir
set foldopen+=jump
set hidden
set expandtab
set tabstop=4
set backspace=eol,start,indent
set so=7
set ruler
set hid
set mouse=a
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
set number
set mat=2
set novisualbell
set tm=500

set shortmess+=A

" PATHOGEN
execute pathogen#infect()

" Useful mappings for managing tabs
map <leader>t :tabmove
nnoremap <C-t>     :tabnew<CR>
:imap ` <Esc>
:nmap ` <Esc>
:vmap ` <Esc>
nnoremap <S-RIGHT> <C-W><C-L>
nnoremap <S-LEFT> <C-W><C-H>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation Settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-l> <C-W><C-L>
nnoremap <S-h> <C-W><C-H>
nnoremap <s-w> :exec 'normal!' '#' <cr>
nnoremap <s-s> :exec 'normal!' '*' <cr>
nnoremap <s-up> :exec 'normal!' '#' <cr>
nnoremap <s-down> :exec 'normal!' '*' <cr>
nnoremap <s-up> :exec 'normal!' '#' <cr>
nnoremap <s-down> :exec 'normal!' '*' <cr>
inoremap <C-W> <esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>f #<CR>

"""""""""""""'"""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set guioptions-=T
set guioptions+=e
set t_Co=256
set guitablabel=%M\ %t
let g:hybrid_use_Xresources = 1

highlight Pmenu ctermbg=darkcyan
highlight ColorColumn ctermbg=Black
colorscheme molokai

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" characters used to represent invisibles
set listchars+=tab:»\         " 187 followed by a space (032) (and no, it
                        " doesn't *need* to be escaped with a
                        " backslash for me on Windows or Linux)
set listchars+=eol:¶          " 182
set listchars+=trail:•        " 183
if has("win32")
     set listchars+=extends:…  " 133
     set listchars+=precedes:… " 133
elseif has("unix")
     set listchars+=extends:_  " underscore (095)
     set listchars+=precedes:_ " underscore (095)
endif
set nolist
nnoremap <F4> :set list!<CR>   " Toggle showing unprintable characters
nnoremap <F7> :nohlsearch<CR>   " Toggle highlighting searches

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search and Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

execute "set colorcolumn=" . join(range(101,335), ',')

syntax on
filetype on
filetype plugin on

" VimInfo
" \"50      - save only the first 50 lines of each register
" '1000     - save 1000 local marks
" h         - disable 'hlsearch' highlighting when starting
" f1        - global marks are stored A - Z
" rA:       - A: is a removable media, dont store stuff about it
" r...:     - ...=directory, $TEMP: are temporary files, dont store stuff about it
" :500      - lines of history
" /500      - size of the search history
" !         - save and restore global variables
" n...      - viminfo file name and location
set viminfo=\"50,'1000,h,f1,rA:,r$TEMP:,r$TMP:,r$TMPDIR:,:500,/500,!,n$HOME/.viminfo
" Avoid command-line redraw on every entered character by turning off Arabic shaping
if has('arabic')
    set noarabicshape
endif
set fileformats=unix,dos      " Leave files in Mac format first


" BufExplorer mappings  /*{{{*/
" Author: Jeff Lanzarotta
" http://vim.sourceforge.net/script.php?script_id=42
" \be initiates it (default mapping)
nnoremap <silent> <F3> :BufExplorer<CR>
inoremap <silent> <F3> :BufExplorer<CR> 

" MRU - Most Recently Used options:/*{{{*/
" http://vim.sourceforge.net/script.php?script_id=521
let MRU_Max_Entries = 500
" Exclude storing any:
"      a) temporary files ($TEMP)
"      b) temporary internet files
"      c) files created by Xnews
"      d) files created by Mutt
let MRU_Exclude_Files = '\c^c:\\WINDOWS\\temp\\.*\|temp\|Temporary\|__edit_\'
" let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" " Unix (notice the added '^') in order not to match tmp anywhere.
let MRU_File = (has('win32')?expand('$VIM'):expand('$HOME')).'/mru_list.txt'
" Sometimes it is useful to use MRU to get to a filename that
" is close to what you want and then edit the file name.
" But you then need to flip :MRU to :e, this cmap will
" perform the replacement at a key stroke.
cmap <C-e> <C-\>esubstitute(getcmdline(), '^MRU\>', 'e', '')<CR>
nnoremap <C-e> :exec :MRU <CR> 
" /*}}}*/

" Maintain history between different startup and shutdown of Vim
" let g:dbext_default_history_size = 11
" Besides the documented defaults for variable definitions
"    {\w\+}Wq
"    For PHP files handle variables of this format
"        "select * from employee where name = {var_name} "
"    {\w\+}   - a word surrounded by curly braces
"    W        - cannot have word characters after the braces
"    q        - quotes do not matter
let g:dbext_default_variable_def = '?WQ,@wq,:wq,$wq,{\w\+}Wq,http_varu)'


"NERDTree configs
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

"FuzzyFinder Configs
"nmap <silent> <F3> <Plug>:FufDir
nnoremap <silent> <S-f>     :FufFile<CR>
" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TAGBAR 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""g:tagbar_ctags_bin = /usr/bin/ctags
nmap <F2> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" ADD ctrl V and Ctrl c commands "

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" On OSX
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
map <C-v> :call setreg("\"",system("pbpaste"))<CR>p
imap <C-v> <esc> :call setreg("\"",system("pbpaste"))<CR>p i
nnoremap Q     <C-v>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'Ggrep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

func GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endf
nmap <C-g> :call GitGrepWord()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SYNTASTIC 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_loc_list_height = 6
"let g:syntastic_ignore_files = ['\m^/usr/include/', '\m\c\.hbs$','\m\c\.h$', '\m\c\.java$']

"""""""""""""""""
" LINE BREAKS""
""""""""""""""""
let g:indentLine_char = '┆'

ino jj <esc>
cno jj <c-c>
