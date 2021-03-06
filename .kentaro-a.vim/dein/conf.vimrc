scriptencoding utf-8
filetype plugin indent on


" General
syntax on
set ttimeoutlen=10
set synmaxcol=200
set list
set listchars=tab:»-
set number
set fenc=utf-8
set encoding=utf-8
set nobackup
set noswapfile
set cursorline
set autoindent
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noerrorbells
set cmdheight=2
set display=lastline
set history=200
set guioptions+=a
set title
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set nowrap
set pumheight=10
set foldmethod=marker
set autoread
set hidden
set smartcase
set incsearch
set ignorecase
set wrapscan
set hlsearch
set backspace=indent,eol,start
set virtualedit=block
set ambiwidth=double
set wildmenu
set splitbelow
set splitright
set scrolloff=3
set noshowmode
set pastetoggle=<F2>
set noexpandtab
set iskeyword+=-
set showtabline=2
set clipboard+=autoselect





"set leader key
let mapleader = ","
" auto refresh plugins
let g:dein#auto_recache = 1
" auto close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue,*.htaccess,*.conf'
" markdown preview
let g:previm_open_cmd = 'open -a "Google Chrome"'

" Show vim config files
command! C call ShowVimConfig()
function! ShowVimConfig()
	:tabe $HOME/.kentaro-a.vim/dein
endfunction

" Reload vim config files
command! Cr source ~/.vimrc 


" Nerdtree
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! s:MoveToFileAtStart()
	call feedkeys("\<C-w>")
	call feedkeys("\w")
endfunction
autocmd VimEnter *	NERDTree | call s:MoveToFileAtStart()

" Remove trailing whitespace
function! s:RemoveDust()
	let cursor = getpos(".")
	%s/\s\+$//ge
	call setpos(".", cursor)
	unlet cursor
endfunction
autocmd BufWritePre *.js,*.php,*.go,*.py,*.rb,*.vue call <SID>RemoveDust()


" Mark multibyte space
function! MarkMbSpace()
	highlight MarkMbSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
	augroup MarkMbSpace
		autocmd!
		autocmd ColorScheme		  * call MarkMbSpace()
		autocmd VimEnter,WinEnter * match MarkMbSpace /　/
	augroup END
	call MarkMbSpace()
endif




" *********************************************************
" *********************************************************
" *********************************************************
" Key mapping
" *********************************************************
" *********************************************************
" *********************************************************
" tcomment keymap

xnoremap p "_dP
nmap <silent> -- <C-_><C-_>
vmap <silent> -- <C-_><C-_>
noremap <S-h>	^
noremap <S-j>	}
noremap <S-k>	{
noremap <S-l>	$
vnoremap <S-l> $<Left>
noremap <CR> A<CR><ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Left> gT
nnoremap <S-Right> gt
noremap ga ggVG
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" Do not yank by x,s
nnoremap x "_x
nnoremap s "_s
" Terminal window
nnoremap cmd :belowright :terminal<CR>
" grep
vnoremap G* "zy :vimgrep /<C-R>z/j ./**/*
" vimgrep highlighted word
autocmd QuickFixCmdPost *grep* cwindow
" Back to the normal mode.
inoremap jj <ESC>
" search
nnoremap <silent> <Space><Space> ""yiw:let @/ = '\<' . @" . '\>'<CR>:set hlsearch<CR>
vnoremap <silent> <Space><Space> ""y:let @/ = @"<CR>:set hlsearch<CR>

" replace
nnoremap <Space>r :OverCommandLine<CR>%s/<C-r><C-w>//gI<Left><Left><Left>
vnoremap <silent> <Space>r :OverCommandLine<CR>s///gI<Left><Left><Left><Left>
vnoremap <silent> r "zy:let @/ = @z<CR>:OverCommandLine<CR>%s/<C-r>///gI<Left><Left><Left>

" unite
" recent opened files
nnoremap <silent> ,,. :<C-u>Unite file_mru buffer<CR>
let g:unite_source_file_mru_limit = 20
let g:unite_source_file_mru_filename_format = ''

"paste toggle
nmap <Esc>t <F2>

" LSP
nmap <silent> ;df :tab :LspDefinition<CR> 
nmap <silent> ;dc :tab :LspDeclaration<CR> 
nmap <silent> ;rf :tab :LspReferences<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:asyncomplete_auto_popup = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 0



"ctrlp
let g:ctrlp_map = '<Nop>'
let g:ctrlp_use_migemo = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_lazy_update = 200
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': [],
	\ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
\ }
nnoremap <silent> ,,; :CtrlPCurWD<CR><C-l>

" easymotion
nmap  <Leader>w <Plug>(easymotion-bd-w)


" quickfix
au FileType qf nnoremap <silent><buffer>q :quit<CR>
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T

" go settings
augroup go
	autocmd!
	autocmd BufEnter *.go nmap <buffer> vat vaf 
	autocmd BufEnter *.go nnoremap <buffer> bdoc :GoDocBrowser<CR> 
	autocmd BufEnter *.go nnoremap <buffer> doc :GoDoc<CR> 
augroup END



" tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif







" *********************************************************
" *********************************************************
" *********************************************************
" Color Scheme 
" *********************************************************
" *********************************************************
" *********************************************************
colorscheme myblues
set t_Co=256
hi SpecialKey ctermfg=237 guifg=#3a3a3a
hi NonText ctermfg=66 guifg=#5f8787
hi TabLineFill term=bold cterm=bold ctermbg=0
hi TabLineSel term=bold cterm=bold ctermbg=75 ctermfg=15
hi Comment ctermfg=242
highlight LineNr ctermfg=67


