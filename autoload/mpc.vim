function! mpc#GetPlaylist()
	let cmd = 'mpc --format "%position% [- @%artist%] [[- @%title%]|[- @%file%]]" playlist'
	let [results,playlist] = [split(system(cmd),'\n'),[]]
	let maxLengths = {'position':[],'artist':[],'title':[]}

	for item in results
		call add(playlist, mpc#EncodeSong(item))
	endfor

	for track in playlist
		call add(maxLengths['position'], len(track.position))
		if(len(track) == 3)
			call add(maxLengths['artist'],   len(track.artist))
			call add(maxLengths['title'],    len(track.title))
		elseif(len(track) == 2)
			call add(maxLengths['title'],    len(track.title))
		endif
	endfor

	call sort(maxLengths.position,"LargestNumber")
	call sort(maxLengths.artist,"LargestNumber")
	call sort(maxLengths.title,"LargestNumber")

	for track in playlist
		if(maxLengths.position[-1] + 1 > len(track.position))
			let track.position = repeat(' ',
						\ maxLengths.position[-1] - len(track.position))
						\ . track.position
		endif
		let track.position.= ' '
		echom track.position
		if(len(track) == 3)
			let track.artist  .= repeat(' ', maxLengths['artist'][-1] + 2 - len(artist))
			let track.title   .= repeat(' ', maxLengths['title'][-1]  + 2 - len(title))
		elseif(len(track) == 2)
			let track.title   .= repeat(' ', maxLengths['title'][-1]  + 2 - len(title))
		endif
	endfor

	return playlist
endfunction

function! LargestNumber(n1,n2)
	return a:n1 == a:n2 ? 0 : a:n1 > a:n2 ? 1 : -1
endfunction

function! mpc#DisplayPlaylist()
	let playlist = mpc#GetPlaylist()
	for track in playlist
		let output = track.position . " "
					\ . track.artist
					\ . track.title
		if(playlist[0].position == track.position)
			execute "normal! 1GdGI" . output
		else
			call append(line('$'), output)
		endif
	endfor
endfunction

function! mpc#PlaySong(num)
	let song = split(getline(a:num)," ")
	let results = split(system('mpc --format "%position% [- %artist%] [[- %title%]|[- %file%]]" play ' . song[0]), "\n")
	let message = '[mpc] NOW PLAYING: ' . results[0]
	" set statusline+=%{results[0]}
	echomsg message
endfunction

function! mpc#EncodeSong(item)
	let item = split(a:item, " @")
	if(len(item) == 3)
		let song = {'position': item[0],
					\		'artist' : '@ar' . item[1]. 'ar@',
					\		'title': '@ti' . item[2] . 'ti@' }
		" echom song.artist
	elseif(len(item) == 2)
		let song = {'position': item[0],
					\		'title': '@ti' . item[1] . 'ti@' }
		" echom song.title
	endif
	return song
endfunction

function! mpc#DecodeSong(item)
	let line_items = split(substitute(a:item, ' \{2,}', ' ','g'), ' @')
	let song = {'position': line_items[0],
				\		'artist' : line_items[1][2:-4],
				\		'title' : line_items[2][2:-4]}
	return song
endfunction
