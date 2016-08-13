" Name: syntax/mpdv.vim
" Maintainer: Swaroop (https://github.com/durgaswaroop)
" Github URL: https://github.com/durgaswaroop/vim-mpc

syntax region mpdArtist matchgroup=mpdArtistSyn start=/@ar/ end=/ar@/ concealends
syntax region mpdTitle  matchgroup=mpdTitleSyn  start=/@ti/ end=/ti@/ concealends

highlight default mpdArtist ctermfg=lightgreen   guifg=#5fff87
highlight default mpdTitle  ctermfg=lightmagenta guifg=#ffafff

" highlight default mpdArtistLight ctermfg=darkgreen   guifg=#5fff87
" highlight default mpdTitleLight  ctermfg=darkmagenta guifg=#ffafff

" Got to test this on a terminal
" if(&background ==? "dark")
" 	highlight default mpdArtist      ctermfg=lightgreen   guifg=#5fff87
" 	highlight default mpdTitle       ctermfg=lightmagenta guifg=#ffafff
" else
" 	highlight default mpdArtistLight ctermfg=darkgreen   guifg=#5fff87
" 	highlight default mpdTitleLight  ctermfg=darkmagenta guifg=#ffafff
" endif
