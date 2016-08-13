" Name: ftplugin/mpdv.vim
" Maintainer: Swaroop (https://github.com/durgaswaroop)
" Github URL: https://github.com/durgaswaroop/vim-mpc

" function! GetMPCStatusline()"{{{
" 	let cmd = \"mpc status"
" 	sil! let result = split(system(cmd), '\n')
" 	" let result = split(system(cmd), '\n')
" 	let status = len(result) == 3 ? result[2] : result[0]

" 	sil! let [s:count, s:settings] = [len(split(system('mpc playlist'),'\n')), split(status,'   ')]

" 	sil! let s:statusline = " "
" 				\ . s:settings[1] . "---"
" 				\ . s:settings[2] . "---%="
" 				\ . s:count . " songs "

" 	return s:statusline
" endfunction"}}}

set buftype=nofile
" setlocal statusline=%!GetMPCStatusline()
setlocal conceallevel=3
setlocal concealcursor=nvic

command! -buffer MpcPlaySelectedSong call mpc#PlaySong(line("."))

" nnoremap <silent>          <plug>MpcBrowse         :MpcBrowser<cr>
" nnoremap <silent>          <plug>MpcTogglePlayback :TogglePlayback<cr>
" nnoremap <silent>          <plug>MpcIncreaseVolume :IncreaseVolume<cr>
" nnoremap <silent>          <plug>MpcDecreaseVolume :DecreaseVolume<cr>
" nnoremap <silent>          <plug>MpcPlayNext       :PlayNext<cr>
" nnoremap <silent>          <plug>MpcPlayPrev       :PlayPrev<cr>
nnoremap <silent> <buffer> <c-x> :MpcPlaySelectedSong<cr>
nnoremap <silent> <buffer> <c-a> :MpcToggleRandom<cr>
nnoremap <silent> <buffer> <c-e> :MpcToggleRepeat<cr>

" if !hasmapto("<plug>MpcBrowse")
" 	nmap <Leader>p <plug>MpcBrowse
" 	" vmap <Leader>p <plug>MpcBrowse
" endif

" if !hasmapto("<plug>MpcTogglePlayback")
" 	nmap <C-space> <plug>MpcTogglePlayback
" 	vmap <C-space> <plug>MpcTogglePlayback
" endif

" if !hasmapto("<plug>MpcIncreaseVolume")
" 	nmap <C-PageUp> <plug>MpcIncreaseVolume
" endif

" if !hasmapto("<plug>MpcDecreaseVolume")
" 	nmap <C-PageDown> <plug>MpcDecreaseVolume
" endif

" if !hasmapto("<plug>MpcPlayNext")
" 	nmap <Leader>] <plug>MpcPlayNext
" endif

" if !hasmapto("<plug>MpcPlayPrev")
" 	nmap <Leader>[ <plug>MpcPlayPrev
" endif
