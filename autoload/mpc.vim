function! mpc#GetPlaylist()
	let cmd = 'mpc --format "%position% [- @%artist%] [[- @%title%]|[- @%file%]]" playlist'
	let [results,playlist] = [split(system(cmd),'\n'),[]]
	let maxLengths = {'position':[],'artist':[],'title':[]}

	for item in results
		let song = split(item,"@")
		if(len(song) == 3)
			let [position, artist,title] = song
		elseif(len(song) == 2)
			let [position,title] = song
		else
			echom "Bad Format of the song"
		endif
		call add(maxLengths['position'], len(position))
		call add(maxLengths['artist'],   len(artist))
		call add(maxLengths['title'],    len(title))
	endfor
	call sort(maxLengths.position,"LargestNumber")
	call sort(maxLengths.artist,"LargestNumber")
	call sort(maxLengths.title,"LargestNumber")

	for item in results
		let song = split(item, " @")
		if(len(song) == 3)
			let [position, artist,title] = song
		elseif(len(song) == 2)
			let [position,title] = song
		endif

		if(maxLengths.position[-1] + 1 > len(position))
			let position = repeat(' ',
						\ maxLengths.position[-1] - len(position))
						\ . position
		endif
		let position.= ' '
		let artist  .= repeat(' ', maxLengths['artist'][-1] + 2 - len(artist))
		let title   .= repeat(' ', maxLengths['title'][-1]  + 2 - len(title))

		call add(playlist,
					\ {'position': position, 'artist': artist,
					\  'title': title})
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
