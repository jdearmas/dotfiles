"" Vanilla Vim

 " Map leader to ' '
  let mapleader=' '

 " Display line numbers
  set nu

 " Fuzzy find files
 set path+=**

 " show tab as having 2 spaces of width
  set tabstop=2

 " Automatic word wrapping
  set textwidth=80

 " show position of cursor (row,col)
  set ruler

 " Turn on dictionray
  set nospell

 " paste git commit, timestamp, and datestamp
  let gitcommitid = system("git rev-parse --short HEAD")
	 let timestamp = strftime("#### %H:%M:%S")
	 let datestamp = strftime("### %b %d, %Y")
	 let entryinfo = printf("## %s \n%s\n%s",gitcommitid,datestamp,timestamp)
	 nnoremap <F4> :put=entryinfo

 " Press F5 in normal/insert mode to paste timestamp
  nnoremap <F5> "=strftime("#### %H:%M:%S")<CR>P
  inoremap <F5> "=strftime("#### %H:%M:%S")<CR>P

 " Display relative numbers
 set relativenumber

 " Syntax
  syntax enable

 " Display Cursorline
  set cursorline

 " Exit out of 'Insert' mode by hitting 'hh' twice
  inoremap hh <Esc>

 " Exit out of 'Visual' mode by hitting 'hh' twice
  vnoremap hh <Esc>
  
 " Disable <Esc> in normal mode
  inoremap <Esc> <nop>

 " List all buffers and jump to them using 'gb'
  nnoremap gb :ls<CR>:b<Space>

 " List all recently opened files and open a new buffer
  nnoremap gs :browse oldfiles<CR>

 " Clear search highlight
  nnoremap ,<space> :nohlsearch<CR>


  " Highlight (in red) text that go pass 60 character-columns
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%80v.\+/

  " syntax/style of the code you are editing
  set smartindent

  " apply the indentation of the current line to the next
  set autoindent

  " 'altercation/vim-colors-solarized'
  set background=dark
  colorscheme space

  " save folds
  augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
  augroup END

  " fix backspace
  set backspace=indent,eol,start

	" autoclose surronding brackets
	inoremap " ""<left>
	inoremap ' ''<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap { {}<left>
	inoremap {<CR> {<CR>}<ESC>O
	inoremap {;<CR> {<CR>};<ESC>O

"Leader remaps
 " To easily save the current file, while keeping it open
	noremap <Leader><space> :update<CR>

 " Open bash in vim
	noremap <Leader>b :!bash<CR>

	" Execute/run current buffer bash file
	noremap <Leader>e :!%:p:<CR>

	" Go to to previous help topic
	inoremap <Leader>nn <C-n>

	" Go to help topic
	noremap <Leader>L <C-]>

	" Go to to previous help topic
	noremap <Leader>H <C-T>

	" Go to to previous buffer
	noremap <Leader>h :bp<CR>

	" Go to to next buffer
	noremap <Leader>l :bn<CR>
