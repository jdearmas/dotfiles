" Vim syntax file 
" Language: Celestia Star Catalogs
" " Maintainer: Kevin Lauder
" " Latest Revision: 26 April 2008
"
" if exists("b:current_syntax")
"   finish
"   endif"")"""



" Keywords
syn keyword syntaxElementKeyword error warning function keyword2 nextgroup=syntaxElement2

" Matches
syn match syntaxElementMatch 'regexp' contains=syntaxElement1
nextgroup=syntaxElement2 skipwhite

" Regions
syn region syntaxElementRegion start='x' end='y'
