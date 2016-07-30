" Name: plugin/mpc.vim
" Maintainer: Swaroop (https://github.com/durgaswaroop)
" Github URL: https://github.com/durgaswaroop/vim-mpc

" function! OpenMPC()"{{{
" 	let cmd = 'mpc --format \"[[%title%]|[%file%]] - %artist%" current'
" 	echomsg system(cmd)[:-2]
" endfunction

" function! OpenMPC()
" 	execute \"new"
" 	call mpc#DisplayPlaylist()
" endfunction
"}}}

function! OpenMPC()
	if(bufexists('mpc.mpdv'))
		let mpcwin = bufwinnr('mpc.mpdv')
		if(mpcwin == -1)
			execute "sbuffer" . bufnr('mpc.mpdv')
		else
			"takes you to the windo with the playlist open
			execute mpcwin . 'wincmd w'
			return
		endif
	else
		execute "new mpc.mpdv"
	endif
	call mpc#DisplayPlaylist()
endfunction

command! MpcBrowser     call OpenMPC()
command! TogglePlayback call mpc#TogglePlayback()
command! ToggleRandom   call mpc#ToggleRandom()
command! ToggleRepeat   call mpc#ToggleRepeat()
command! IncreaseVolume call mpc#IncreaseVolume()
command! DecreaseVolume call mpc#DecreaseVolume()
command! PlayNext       call mpc#PlayNextSong()
command! PlayPrev       call mpc#PlayPreviousSong()

nnoremap <silent> <plug>IncreaseVolume :IncreaseVolume<cr>
nnoremap <silent> <plug>DecreaseVolume :DecreaseVolume<cr>
nnoremap <silent> <plug>PlayNext       :PlayNext<cr>
nnoremap <silent> <plug>PlayPrev       :PlayPrev<cr>
