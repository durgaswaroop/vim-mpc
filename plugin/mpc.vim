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

command! MpcPlaylistBrowser call OpenMPC()
command! MpcTogglePlayback  call mpc#TogglePlayback()
command! MpcToggleRandom    call mpc#ToggleRandom()
command! MpcToggleRepeat    call mpc#ToggleRepeat()
command! MpcIncreaseVolume  call mpc#IncreaseVolume()
command! MpcDecreaseVolume  call mpc#DecreaseVolume()
command! MpcPlayNext        call mpc#PlayNextSong()
command! MpcPlayPrev        call mpc#PlayPreviousSong()
