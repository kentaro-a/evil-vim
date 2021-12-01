
let g:vimrc = expand('<sfile>:p')  
let g:root_dir = expand('<sfile>:p:h') .'/.vim/'
let g:plugin_dir = root_dir .'plugins'
let g:dein_dir = root_dir .'dein/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' .g:root_dir
execute 'set runtimepath+=' .g:plugin_dir
execute 'set runtimepath+=' .g:dein_dir

if &compatible
  set nocompatible
endif

" Plugins 
if dein#load_state(g:plugin_dir)
	call dein#begin(g:plugin_dir)
		call dein#add(g:dein_dir)
		call dein#add('kentaro-a/stdodump.vim')
		call dein#add('preservim/nerdtree')
		call dein#add('jistr/vim-nerdtree-tabs')
		call dein#add('rhysd/accelerated-jk')
		call dein#add('tpope/vim-surround')
		call dein#add('tpope/vim-commentary')
		call dein#add('townk/vim-autoclose')
		call dein#add('vim-airline/vim-airline')
		call dein#add('vim-airline/vim-airline-themes')
		call dein#add('neoclide/coc.nvim')
		call dein#add('alvan/vim-closetag')
		call dein#add('junegunn/fzf', {'build': './install --all', 'merged': 0 })
		call dein#add('junegunn/fzf.vim')
		call dein#add('osyo-manga/vim-over')
		call dein#add('ervandew/supertab')
		call dein#add('terryma/vim-expand-region')
		call dein#add('ryanoasis/vim-devicons')
		call dein#add('easymotion/vim-easymotion')
	call dein#end()
	call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
	call dein#install()
endif
call map(dein#check_clean(), "delete(v:val, 'rf')")


"property
scriptencoding utf-8
filetype plugin indent on
syntax on
set number
set backspace=2 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set list
set listchars=tab:»-
set fenc=utf-8
set nobackup
set noswapfile
set cursorline
set title
set mouse=a
set nowrap
set pastetoggle=<F2>
set noexpandtab
set iskeyword+=-
set showtabline=2
set clipboard+=autoselect
set hlsearch
set modifiable
set write
set ignorecase
set encoding=utf-8
set whichwrap=h,l

" filetype
au BufNewFile,BufRead *.ctp setf ctp


" Color Schema
colorscheme myblue 
set t_Co=256
hi SpecialKey ctermfg=237 guifg=#3a3a3a
hi NonText ctermfg=66 guifg=#5f8787
hi TabLineFill term=bold cterm=bold ctermbg=0
hi TabLineSel term=bold cterm=bold ctermbg=75 ctermfg=15
hi Comment ctermfg=242
highlight LineNr ctermfg=67




"Common Mapping
xnoremap p "_dP
noremap ga ggVG
inoremap jj <ESC>
noremap <CR> A<CR><ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
xnoremap p "_dP
noremap <S-h>	^
noremap <S-j>	}
noremap <S-k>	{
noremap <S-l>	$
vnoremap <S-l> $<Left>

" Quick Fix
au FileType qf nnoremap <silent><buffer>q :quit<CR>
autocmd FileType qf nnoremap <buffer> t <C-W><Enter><C-W>T



" Nerdtree
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! s:MoveToFileAtStart()
	call feedkeys("\<C-w>")
	call feedkeys("\w")
endfunction
autocmd VimEnter *	NERDTree | call s:MoveToFileAtStart()
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
nnoremap <S-Left> gT
nnoremap <S-Right> gt
nnoremap x "_x
nnoremap s "_s
nnoremap cmd :belowright :terminal<CR>



" Remove trailing whitespace
function! s:RemoveDust()
	let cursor = getpos(".")
	%s/\s\+$//ge
	call setpos(".", cursor)
	unlet cursor
endfunction
autocmd BufWritePre *.js,*.php,*.go,*.py,*.rb,*.vue call <SID>RemoveDust()



" Reload vimrc
command! C silent! execute ':e ' .g:vimrc 
command! Cr silent! execute ':source ' .g:vimrc 


" Accelerated motion 
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


" Paste toggle
nmap <S-t>g <F2>
nmap <S-p> <F2>





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


" search
nnoremap <silent> <Space><Space> ""yiw:let @/ = '\<' . @" . '\>'<CR>:set hlsearch<CR>
vnoremap <silent> <Space><Space> ""y:let @/ = @"<CR>:set hlsearch<CR>


" tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


"vim-commentary
nmap <silent> -- gcc
vmap <silent> -- gc
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType ctp setlocal commentstring=//\ %s


" vim-airline
let g:airline_theme='murmur'

" Coc-vim
" fzf
let mapleader = "\R"
let g:coc_global_extensions = ['coc-phpls', 'coc-tsserver', 'coc-prettier', 'coc-go', 'coc-restclient']
" command! -nargs=0 Format :call CocAction('format')
autocmd BufWritePre *.go :silent call CocAction('format') 
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
vmap <S-f> <Plug>(coc-format-selected)
nmap <S-f> <Plug>(coc-format-selected)
noremap <Leader>q :CocCommand rest-client.request <cr>
command! Cocdel silent! call dein#check_clean() && call dein#recache_runtimepath()

imap <silent><expr> <Space><Space> coc#refresh()

" vim-closetag 
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.php,*.vue, *.ctp, *.tsx, *.ts, *.js, *.jsx'

" fzf
let mapleader = "\<Space>"
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg -S --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
nnoremap <silent> <leader>f :Files<CR>
" exact match
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 
nnoremap <silent> <leader>g :Rg<CR>'
nnoremap <silent> <leader>h :History<CR>



" vim-over (replace)
nnoremap <Space>r :OverCommandLine<CR>%s/<C-r><C-w>//gI<Left><Left><Left>
vnoremap <silent> <Space>r :OverCommandLine<CR>s///gI<Left><Left><Left>
vnoremap <silent> r "zy:let @/ = @z<CR>:OverCommandLine<CR>%s/<C-r>///gI<Left><Left><Left>

" expand-region
let g:expand_region_text_objects = {
	      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :0,
      \ }
" copy function
nnoremap <silent> vaf [m{jV]m%


" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping=1

" devicons (if nerd-font is installed set 1 to this.
let g:webdevicons_enable_nerdtree = 1


" easy-motion
let mapleader = "m"
map  <Leader>v <Plug>(easymotion-bd-w)
nmap <Leader>v <Plug>(easymotion-overwin-w)
