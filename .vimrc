"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Map leader to <space>
	let mapleader=' '
	let localmapleader=','

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

    " syntax/style of the code you are editing
    set smartindent

    " apply the indentation of the current line to the next
    set autoindent

    " to highlight search matcehs
    set hlsearch


" BufWrite
    " Automatically deletes all trailing
    " whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

    " When shortcut files are updated,
    " renew bash and ranger configs with
    " new material:
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
    "C/C++
        "source
            autocmd Filetype cpp inoremap ,m int main(int argc, char **argv){<CR><CR>}

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


"Plugins Manager
    "Install, if not already
        if empty(glob('~/.vim/autoload/plug.vim'))
              silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif


    "Plugins
        filetype plugin indent on    " required
        call plug#begin('~/.vim/plugged')
                Plug 'junegunn/goyo.vim'
                Plug 'PotatoesMaster/i3-vim-syntax'
                Plug 'jreybert/vimagit'
                Plug 'LukeSmithxyz/vimling'
                Plug 'vimwiki/vimwiki'
                Plug 'dag/vim-fish'
                Plug 'vim-scripts/Nmap-syntax-highlight'
                Plug 'mattn/emmet-vim'
                Plug 'jalvesaq/Nvim-R'
                Plug 'jalvesaq/vimcmdline'
                Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
        call plug#end()

    "nvimr
   "let R_in_buffer = 0
       let R_tmux_split = 1
       let R_term = 'st'

    " vimwiki
    " Ensure files are read as what I want:
        let g:vimwiki_dir_link = 'index'
        let g:vimwiki_list = [{'path': '~/vimwiki'},
                    \{'path': '~/docs/work/blog'}]
        let g:vimwiki_ext2syntax = {'.Rmd': 'markdown',
                                \'.rmd': 'markdown',
                                \'.md': 'markdown',
                                \'.markdown': 'markdown',
                                \'.mdown': 'markdown'}
        autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/*
                                \set filetype=markdown
        autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man
                                \set filetype=nroff
        autocmd BufRead,BufNewFile *.tex
                                \set filetype=tex
        autocmd BufRead,BufNewFile *.nmap
                                \set filetype=nmap

        nnoremap <leader>tt :VimwikiToggleListItem<CR>

    " vimcmdline
        let cmdline_map_start          = ',s'
        let cmdline_map_send           = '<Space>'
        let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
        let cmdline_map_source_fun     = '<LocalLeader>f'
        let cmdline_map_send_paragraph = '<LocalLeader>p'
        let cmdline_map_send_block     = '<LocalLeader>b'
        let cmdline_map_quit           = '<LocalLeader>q'

        " vimcmdline options
        let cmdline_vsplit      = 0      " Split the window vertically
        let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
        let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
        let cmdline_term_height = 15     " Initial height of interpreter window or pane
        let cmdline_term_width  = 80     " Initial width of interpreter window or pane
        let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
        let cmdline_outhl       = 1      " Syntax highlight the output
        let cmdline_auto_scroll = 1      " Keep the cursor at the end of

