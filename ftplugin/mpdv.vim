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

command! -buffer PlaySelectedSong call mpc#PlaySong(line("."))
command!         IncreaseVolume   call mpc#IncreaseVolume()
command!         DecreaseVolume   call mpc#DecreaseVolume()

nnoremap <silent>          <plug>MpcTogglePlayback :TogglePlayback<cr>
nnoremap <silent>          <plug>MpcBrowse         :MpcBrowser<cr>
nnoremap <silent> <buffer> <c-x> :PlaySelectedSong<cr>
nnoremap <silent> <buffer> <c-a> :ToggleRandom<cr>
nnoremap <silent> <buffer> <c-e> :ToggleRepeat<cr>
nnoremap <silent> <buffer> >> :IncreaseVolume<cr>
nnoremap <silent> <buffer> << :DecreaseVolume<cr>

" if !hasmapto("<plug>MpcTogglePlayback")
" 	nmap <Leader>p <plug>MpcTogglePlayback
" endif

if !hasmapto("<plug>MpcBrowse")
	nmap <Leader>p <plug>MpcBrowse
endif
