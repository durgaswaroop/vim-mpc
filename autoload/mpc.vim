function! mpc#DisplayPlaylist()
	let cmd = 'mpc --format "%position% [- %artist%] [[- %title%]|[- %file%]] " playlist'
	let playlist = split(system(cmd),'\n')
	for track in playlist
		call append(0,track)
	endfor
endfunction

function! mpc#PlaySong(num)
	let song = split(getline(a:num)," ")
	let results = split(system('mpc --format "%position% [- %artist%] [[- %title%]|[- %file%]]" play ' . song[0]), "\n")
	let message = '[mpc] NOW PLAYING: ' . results[0]
	" set statusline+=%{results[0]}
	echomsg message
endfunction
