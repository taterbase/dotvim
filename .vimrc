call pathogen#infect()
set nocompatible
set backspace=indent,eol,start
set hlsearch
set incsearch
set number
set softtabstop=2
set shiftwidth=2
set expandtab
set scrolloff=5
set history=200
set smartindent
colorscheme lucius
syntax on
filetype plugin indent on

let &t_Co=256

"***** GIST SETUP *****"

"Private gists by default
let g:gist_post_private = 1

"Open web browser after making gist
let g:gist_open_browser_after_post = 1

"Copy gist to clipboard
let g:gist_clip_comman = 'pbcopy'

"Detect file type when gisting
let g:gist_detect_filetype = 1

"***** END GIST SETUP *****"

"Prevent auto-comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Auto-closing of braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {   
inoremap {}     {}
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

"Auto-closing of brackets
inoremap [       []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"Auto-closing of quotes
"inoremap "       CheckQuote()

"Auto-closing parens
inoremap (      ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

"Tab completion (home made)
inoremap <expr> <Tab> AutoComplete() 
inoremap <expr> <S-Tab> ShiftAutoComplete()

func AutoComplete()
  let str = strpart(getline('.'), col('.')-2, 1)

  if !match(str, "[A-Za-z1-9]")
    return "\<C-N>"
  else
    return "\<Tab>"
endfunc

func ShiftAutoComplete()
  let str = strpart(getline('.'), col('.')-2, 1)

  if !match(str, "[A-Za-z1-9]")
    return "\<C-P>"
  else
    return "\<Tab>"
endfunc

"New command to save, refresh Gstatus, and go back to working window
:command W w|Gstatus|wincmd p

"Typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"Remove trailing whitespace from js files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,coffeescript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
