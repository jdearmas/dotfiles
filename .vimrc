"" Vanilla Vim

 " Map leader to ' '
  let mapleader=' '

" General Settings
			" fix backspace
			set backspace=indent,eol,start

		 	" Display line numbers
			set nu

		 	" Change Current Directory to Current File
			set noautochdir

		 	" Set Character Encoding
			set encoding=utf-8

		 	" Fuzzy find files
			set path+=**

		 	" show tab as having 4 spaces of width
			set tabstop=4

		 	" change width of visual select shift 
			set shiftwidth=4

			" replace tabs with spaces
			set expandtab

		 	" Automatic word wrapping
			set textwidth=75

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

		 	" in normal/insert mode to paste timestamp
			nnoremap <F7> "=strftime("#### %H:%M:%S")<CR>P
			inoremap <F7> "=strftime("#### %H:%M:%S")<CR>P

		 	" display relative numbers
		 	set relativenumber

		 	" automatically write a file when leaving a modified buffer
			set aw

		 	" syntax
			syntax enable

		 	" display cursorline
			set cursorline

		 " change color of current line number
			hi CursorLineNr ctermfg=4

			" highlight (in red) text that go pass 60 character-columns
			highlight OverLength ctermbg=red ctermfg=white guibg=#592929
			match OverLength /\%80v.\+/

			" syntax/style of the code you are editing
			set smartindent

			" apply the indentation of the current line to the next
			set autoindent


" Normal Mode No-Remaps
		" List all recently opened files and open a new buffer
				nnoremap gs :browse oldfiles<CR>
				
		" List all buffers and jump to them using 'gb'
				nnoremap gb :ls<CR>:b<Space>

		" Clear search highlight
				nnoremap ,<space> :nohlsearch<CR>

		"Remap Capital J/K to move up and down blocks
				noremap J }
				noremap K {

		" Fuzzy find files
				nnoremap <Leader>ff :vs **/*

" Visual Mode Maps
		" Align block of text and keep them selected
				vmap < <gv
				vmap > >gv

" Folds
		" save folds
				augroup remember_folds
				autocmd!
				autocmd BufWinLeave * mkview
				autocmd BufWinEnter * silent! loadview
				augroup END


"Calcurse"
				" Make calcurse notes markdown compatible:
							autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* 
								\ set filetype=markdown

"Commands"
				"vim"
								" Create The Directories AND File of the given path
								"	ex. :E path/of/new/dirs/file.txt
												command -nargs=1 E 
													\ execute('silent! !mkdir -p "$(dirname "<args>")"') 
													\ <Bar> e <args>

				"rmarkdown"
								" compile
												autocmd Filetype rmd map <F5> 
													\ :!echo<space>"require(rmarkdown);
													\ <space>render('<c-r>%')"<space>\|
													\ <space>R<space>--vanilla<space>--slave<enter>
										
				"bash/sh"
								" generate toc	
												autocmd Filetype sh map <F3> :0read grep "^\#\s\S" %

"Leader remaps

				" To easily save the current file, while keeping it open
				noremap <Leader><space> :update<CR>

        " highlight all lines
				noremap <Leader>a  ggVG<CR>

				" Open bash in vim
				noremap <Leader>b :!bash<CR>

				" Execute/run current buffer bash file
				noremap <Leader>e :!%:p:<CR>

				" Fuzzy Find Plugin 
				noremap <Leader>f :FZF<CR>

				" Go to to previous buffer
				noremap <Leader>h :bp<CR>

    		" Move line under to current
				noremap <leader>j J

				" Go to to next buffer
				noremap <Leader>l :bn<CR>

				" set filetype to gccout
				noremap <Leader>m :set filetype=gccout<CR>
				
				" Return to previous tag
				noremap <Leader>o <C-o>

				" Paste into vim in normal mode
				noremap<leader>p "+p

				" Autopopulate substitution template into ex command line mode
				noremap<leader>r q:i%s///g<Left><Left><Left>

				" Separate every sentence with a empty line and reformat
				noremap <Leader>s q:i%s/\. /\.\r\r/g<CR> | ggVGgq<CR>

				" Go to tag
				noremap <Leader>t <C-]>

				" Open vimrc
				noremap <Leader>v :e $MYVIMRC<CR>

				" Copy into vim in normal mode
				noremap<leader>y "+y

				" Comment visually selected lines
				vnoremap <Leader>c :norm i#<CR>
				vnoremap <Leader>uc :norm x<CR>

				" fold the next c++ function
				noremap <Leader>F 0v/{<CR>%zf

				" Go to help topic
				noremap <Leader>L <C-]>

				" Go to to previous help topic
				noremap <Leader>H <C-T>

				" Captialize The First Letter Of Every Word In A Line
				nnoremap <Leader>U :s/\<./\u&/g
 
				" Detect the filetype ( normally restores syntax)
				nnoremap <Leader>fd :filetype detect<CR>

				" Fuzzy find files
				nnoremap <Leader>ff :e **/*

				" Autocomplete word in insert mode
				inoremap <Leader>nn <C-n>

"Ctags

		"Look up towards root
				set tags=./tags;/


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
				autocmd Filetype rmd inoremap ,t ---<CR>title:Title<CR>
					\ author: John Carlos De Armas<CR>
					\ output:pdf_document<CR>---

		"C/C++
		        "source

                    autocmd Filetype cpp inoremap ,m int main(int argc, char **argv){<CR><CR>}
                    autocmd Filetype cpp inoremap ,p std::cout <<<<std::endl;<Left><Left><Left><Left><Left><Left><Left><Left>

		        "makefile

                    autocmd Filetype make inoremap ,t # Makefile for {USE} <CR># Written By: John Carlos De Armas <CR># Date: {DATE}

"Colors 

		"Colorsheme
				" 'altercation/vim-colors-solarized'
				set background=dark
				colorscheme space

		"Folds
				hi Folded ctermbg=8
				hi Folded ctermfg=yellow


"Plugins

		"NrrwRgn

				" Open the selected text in a new, synced buffer
				noremap <Leader>ns :NR!<CR>


		"Vundle
				filetype off                  " required
				
				" set the runtime path to include Vundle and initialize
				set rtp+=~/.vim/bundle/Vundle.vim
				call vundle#begin()
				" alternatively, pass a path where Vundle should install plugins
				"call vundle#begin('~/some/path/here')
				
				" let Vundle manage Vundle, required
				Plugin 'VundleVim/Vundle.vim'
			
				" C/C++ Autocompletion
				Plugin 'Valloric/YouCompleteMe'


				call vundle#end()            " required
				filetype plugin indent on    " required

" Experimental

