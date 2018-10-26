" Vim syntax file
" Language:	G++/Gcc
" Maintainer:	John Carlos De Armas <dearmas.john1996@gmail.com>
" Last Change:	2017 Apr 30

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish

endif

echom "Hello!"

syntax keyword gccoutputKeyword error Error 
highlight link gccoutputKeyword Error

syntax match cppFile "\v^.*\.cpp:"
syntax match cppFile "\v\s\f*\.cpp"
highlight link cppFile Comment

syntax match gccoutputIncludes "\v-I.*"
highlight link gccoutputIncludes Include

syntax match compileFlags "\v-o"
syntax match compileFlags "\v-c"
syntax match compileFlags "warning"
syntax match compileFlags "function"
highlight link compileFlags Keyword

syntax match gccoutputOptionsFlags "\v-[^Ioc]*\s"
highlight link gccoutputOptionsFlags PreProc

syntax match objectFiles "\v\s[^-]\f.*\.o"
highlight link objectFiles Constant

syntax match errorPathRow "\v\:[0-9][0-9]\:"
highlight link errorPathRow Number

let b:current_syntax="gccoutput"
