if has('vim_starting')
    set nocompatible
    set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage itself
NeoBundleFetch 'Shougo/neobundle.vim'

set viminfo='1000,f1,:1000,/1000
" Store vim session information.
" The ' option specifies how many files for which to save marks.
" The f option controlls whether global marks are stored (`1' causes marks to be stored).
" The : option specifies how many lines to save from the command line history.
" The / option specifies the number of lines to save from the search history.

" --- VISUAL OPTIONS ---
syntax on          " Enable syntax highlighting
set number         " Enable line numbers
set nowrap         " Disable word wrap

" --- BEHAVIOUR ---
set tabstop=4     " Tab = 4 spaces
set shiftwidth=4  " Indent to 4 spaces
set softtabstop=4
set expandtab     " Use spaces instead of ^I
set hidden        " Switch between unsaved buffers without needing to save, preserves history.
filetype on
filetype indent on
filetype plugin on
set autoindent
set smartindent
set modeline
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
                  " Ignore these files when completing names.

" --- COFFEESCRIPT BEHAVIOUR ---
au BufNewFile,BufReadPost *.coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" --- JAVASCRIPT BEHAVIOUR ---
au BufNewFile,BufReadPost *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" --- MARKDOWN BEHAVIOUR ---
au BufNewFile,BufReadPost *.md setlocal filetype=markdown

" --- YAML BEHAVIOUR ---
au BufNewFile,BufReadPost *.yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" --- RUBY BEHAVIOUR ---
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" --- PHP BEHAVIOUR ---
autocmd FileType php setlocal keywordprg=pman
autocmd FileType php setlocal comments+=://

" --- R BEHAVIOUR ---
autocmd BufNewFile,BufReadPost *.R setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
let vimrplugin_objr_place="console,right"
let vimrplugin_openpdf=1
let vimrplugin_openhtml=1
let vimrplugin_applescript=0
let vimrplugin_tmux=1
autocmd BufNewFile,BufReadPost *.R vmap <F5> <Plug>RDSendSelection
autocmd BufNewFile,BufReadPost *.R vmap <F5> <Plug>RDSendLine
let g:ScreenImpl="Tmux"
let vimrplugin_only_in_tmux=1

" --- (LA)TEX BEHAVIOUR ---
autocmd BufNewFile,BufReadPost *.tex setlocal spell
autocmd BufNewFile,BufReadPost *.tex setlocal spelllang=en_au
autocmd BufNewFile,BufReadPost *.tex syntax spell toplevel
autocmd BufNewFile,BufReadPost *.tex setlocal textwidth=80
let g:tex_flavor='latex'

" --- NIX BEHAVIOUR ---
au BufNewFile,BufReadPost *.nix setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" --- MAIL BEHAVIOUR ---
autocmd FileType mail setlocal spell
autocmd FileType mail setlocal spelllang=en_au

" --- GO BEHAVIOUR ---
autocmd BufNewFile,BufReadPost *.go setlocal filetype=go

" --- PUPPET BEHAVIOUR ---
autocmd BufNewFile,BufReadPost *.pp setlocal filetype=puppet

" --- NGINX BEHAVIOUR ---
autocmd BufNewFile,BufReadPost nginx.conf setlocal filetype=nginx

" -- NIX BEHAVIOUR --
autocmd BufNewFile,BufReadPost *.nix setlocal filetype=nix

" --- SEARCHING ---
set incsearch " Search while typing.
set smartcase " When searching, lowercase = case insensitive, any uppsercase = case sensitive.
set hlsearch  " Highlight all search results.

" --- NERDTREE OPTIONS ---
" let NERDTreeChDirMode=2 " Setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" --- COMMAND-T OPTIONS ---
let g:CommandTAcceptSelectionMap = '<C-t>'   " Open files in the same tab by pushing Ctrl+T.
let g:CommandTAcceptSelectionTabMap = '<CR>' " Open files in a new tab by pushing <CR>.
let g:CommandTSelectNextMap = ['<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-k>', '<ESC>OA']

" --- TAGLIST OPTIONS ---
let Tlist_Auto_Update=1
let Tlist_GainFocus_On_ToggleOpen=1

" --- POWERLINE OPTIONS ---
set encoding=utf-8 " From README.md: The statusline has strange characters like ^B in it!
set noshowmode " Hide the default -- INSERT -- below the statusline

" --- COLOUR OPTIONS ---
set t_Co=256
colorscheme kolor
set background=dark
highlight SpecialKey ctermfg=8

" --- EIGHTIES OPTIONS ---
let g:eighties_extra_width=1

" --- WHITESPACE ---
set listchars=
set listchars+=tab:>-
set listchars+=tab:>-
set listchars+=trail:.
" set listchars+=eol:$
set list

set backspace=indent,eol,start

if &modifiable
	set fileformat=unix
endif
set noruler
set laststatus=2
set number
set guioptions-=T

set backupdir=~/.vim/backups/
set directory=~/.vim/temp/

set scrolloff=3

set gfn=Monospace\ 12

" reload a document with Shift-F5 (go to the end of the document)
map <silent> <S-F5> :e!<CR>G
" reload a document with F5 (stay at the same position)
map <silent> <C-c> "+y

if version >= 703
    set undodir=~/.vim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000

    set colorcolumn=81
endif

command! RetabIndents call RetabIndents()

nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>

inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

func! RetabIndents()
    let saved_view = winsaveview()
    execute '%s@^\(\ \{'.&ts.'\}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@e'
    call winrestview(saved_view)
endfunc

" If we're running inside ArchLinux on a Samsung Chromebook Series 3, it seems
" to be this:
" exe 'set t_kB=' . nr2char(27) . '[1;2Z'
" If we're running on a Macbook Air (Late 2011 Model), it seems to be this:
exe 'set t_kB=' . nr2char(27) . '[Z'

nnoremap <C-k> <Esc>:silent Shell sdcv --non-interactive <cword> <CR>
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    " call setline(1, 'You entered:    ' . a:cmdline)
    " call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    " call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    1
endfunction

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

source ~/configuration-files/vimrc-darwin

" --- BEHAVIOUR ---
" highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" --- UNITE ---
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -buffer-name=files   -resume -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -buffer-name=files   -resume -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -buffer-name=mru     -resume -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -buffer-name=outline -resume -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    -resume history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  -resume buffer<cr>
nnoremap <leader>g :<C-u>Unite -buffer-name=grep    -resume grep<cr>

" use ag for search
if executable('ag')
  let g:unite_source_grep_command       = 'ag'
  let g:unite_source_grep_default_opts  = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" --- SYNTASTIC ---
let g:syntastic_quiet_messages = { "type": "style" }
