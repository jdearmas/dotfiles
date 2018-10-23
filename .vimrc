"" Vanilla Vim

 " Map leader to ' '
  let mapleader=' '

 " Display line numbers
  set nu

 " Fuzzy find files
 set path+=**
 nnoremap <Leader>ff :vs **/*

 " show tab as having 4 spaces of width
  set tabstop=4

 " change width of visual select shift 
  set shiftwidth=4

	" replace tabs with spaces
	set expandtab

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
  nnoremap <F7> "=strftime("#### %H:%M:%S")<CR>P
  inoremap <F7> "=strftime("#### %H:%M:%S")<CR>P

 " Display relative numbers
 set relativenumber

 " Automatically write a fil e when leaving a modified buffer
  set aw

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

	" Align block of text and keep them selected
	vmap < <gv
	vmap > >gv


	" autoclose surronding brackets
	inoremap " ""<left>
	inoremap ' ''<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap { {}<left>
	inoremap {<CR> {<CR>}<ESC>O
	inoremap {;<CR> {<CR>};<ESC>O

"Calcurse"
 " Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

"RMarkdown"
 " compile
    autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    "autocmd Filetype rmd map <Leader><space> :update<CR> | :execute "!nohup echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter> &"<enter><CR>

"Leader remaps
				" To easily save the current file, while keeping it open
				noremap <Leader><space> :update<CR>

				" Open bash in vim
				noremap <Leader>b :!bash<CR>

				" Execute/run current buffer bash file
				noremap <Leader>e :!%:p:<CR>

				" Execute/run current buffer bash file
				noremap <Leader>f :find 

				" Go to to previous buffer
				noremap <Leader>h :bp<CR>

				" Go to to next buffer
				noremap <Leader>l :bn<CR>
				
				" Return to previous tag
				noremap <Leader>o <C-o>

				" Paste into vim in normal mode
				noremap<leader>p "+p

				" Go to tag
				noremap <Leader>t <C-]>

				" Open vimrc
				noremap <Leader>v :e $MYVIMRC
				inoremap <Leader>v :e $MYVIMRC

				" Copy into vim in normal mode
				noremap<leader>y "+y

				" Comment visually selected lines
				vnoremap <Leader>c :norm i#<CR>
				vnoremap <Leader>uc :norm x<CR>

				" Go to help topic
				noremap <Leader>L <C-]>

				" Go to to previous help topic
				noremap <Leader>H <C-T>

				" Fuzzy find files
				nnoremap <Leader>ff :e **/*

				" Autocomplete word in insert mode
				inoremap <Leader>nn <C-n>


"Snippets

		"MARKDOWN
				autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
				autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
				autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
				autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
				autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
				autocmd Filetype markdown,rmd inoremap ,h ***<Space><++><Esc>F=hi
				autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
				autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
				autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
				autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
				autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
				autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
				autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
				autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
				autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
