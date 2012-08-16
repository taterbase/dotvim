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
set clipboard=unnamed
colorscheme lucius
syntax on
filetype plugin indent on

let &t_Co=256

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
