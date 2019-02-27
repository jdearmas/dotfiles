"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Map leader to <space>
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
			set textwidth=60

		 	" show position of cursor (row,col)
			set ruler

		 	" Turn off dictionray
			set nospell

		 	" case insensitive, unless the 1st character is uppercase
			set ignorecase smartcase

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

            " to highlight search matcehs
            set hlsearch


" BufWrite
			" Automatically deletes all trailing whitespace on save.
			autocmd BufWritePre * %s/\s\+$//e

			" When shortcut files are updated, renew bash and ranger configs with new material:
			autocmd BufWritePost ~/.bm* !shortcuts


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

				" Compile document, be it groff/LaTeX/markdown/etc.
				map <leader>c :w! \| !compiler <c-r>%<CR><CR>

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

				" Open new split
				map <leader>n :vsp<CR>


				" Open corresponding .pdf/.html or preview
				map <leader>o :!opout <c-r>%<CR><CR>

				" Paste into vim in normal mode
				noremap<leader>p "+p

				" browse oldfiles using a filter
				noremap <Leader>q q:ibro filter // ol<ESC>3<LEFT>i

				" Autopopulate substitution template into ex command line mode
				noremap<leader>r q:i%s///g<Left><Left><Left>

				" Separate every sentence with a empty line and reformat
				noremap <Leader>s q:i%s/\. /\.\r\r/g<CR> | ggVGgq<CR>

				" Go to tag
				noremap <Leader>t <C-]>

				" Open vimrc
				noremap <Leader>v :e $MYVIMRC<CR>

				" expermental word wrap
				noremap <Leader>w :set textwidth=40

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
				autocmd Filetype markdown,rmd inoremap ,b ****<Esc>F*hi
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
				"colorscheme space
				set background=dark

		"Folds
				hi Folded ctermbg=8
				hi Folded ctermfg=yellow


"Plugins

		"Plugged
				filetype plugin indent on    " required

				call plug#begin('~/.vim/plugged')
						Plug 'junegunn/goyo.vim'
						Plug 'PotatoesMaster/i3-vim-syntax'
						Plug 'jreybert/vimagit'
						Plug 'LukeSmithxyz/vimling'
						Plug 'vimwiki/vimwiki'
						Plug 'dag/vim-fish'
				call plug#end()

		" vimwiki
				" Ensure files are read as what I want:
					let g:vimwiki_ext2syntax = {'.Rmd': 'markdown',
											\'.rmd': 'markdown',
											\'.md': 'markdown',
											\'.markdown': 'markdown',
											\'.mdown': 'markdown'}
					autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/*
											\set filetype=markdown
					autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man
											\set filetype=groff
					autocmd BufRead,BufNewFile *.tex
											\set filetype=tex

" Experimental

