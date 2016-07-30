" Name: autoload/mpc.vim
" Maintainer: Swaroop (https://github.com/durgaswaroop)
" Github URL: https://github.com/durgaswaroop/vim-mpc

function! mpc#GetPlaylist()
	let cmd = 'mpc --format "%position% [ @%artist%] [[ @%title%]|[ @%file%]]" playlist'"
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
		if(len(track) == 3)
			let track.artist  .= repeat(' ', maxLengths['artist'][-1] + 2 - len(track.artist))
			let track.title   .= repeat(' ', maxLengths['title'][-1]  + 2 - len(track.title))
		elseif(len(track) == 2)
			let track.title   .= repeat(' ', maxLengths['title'][-1]  + 2 - len(track.title))
		endif
	endfor
	return playlist"
endfunction

function! LargestNumber(n1,n2)
	return a:n1 == a:n2 ? 0 : a:n1 > a:n2 ? 1 : -1
endfunction

function! mpc#DisplayPlaylist()
	let playlist = mpc#GetPlaylist()"
	for track in playlist
		if(len(track) == 3)
			let output = track.position . " "
						\ . track.artist
						\ . track.title
		elseif(len(track) == 2)
			let output = track.position . " "
						\ . track.title
		endif

		if(playlist[0].position == track.position)
			execute "normal! 1GdGI" . output
		else
			call append(line('$'), output)
		endif
	endfor"
endfunction

function! mpc#ColorizeEchoMsg(msg)
	highlight default mpcEchoMsg cterm=bold gui=bold guifg=#5fd7ff ctermfg=lightblue"
	echohl mpcEchoMsg
	echom a:msg
	echohl normal"
endfunction

function! mpc#IncreaseVolume() "Increases volume by 5% everytime its called
	let results  = split(system('mpc volume +5'), "\n")"
	let message = '[mpc] '
	if(len(l:results) == 3)
		let volumeLine = l:results[2]
	elseif(len(l:results) == 1)
		let volumeLine = l:results[0]
	endif
	let volumeLineSplits = split(l:volumeLine, " ")
	let currentVolume = l:volumeLineSplits[0] . l:volumeLineSplits[1]
	let message .= toupper(l:currentVolume)
	call mpc#ColorizeEchoMsg(message)"
endfunction

function! mpc#DecreaseVolume() "Decreases volume by 5% everytime its called
	let results  = split(system('mpc volume -5'), "\n")"
	let message = '[mpc] '
	if(len(l:results) == 3)
		let volumeLine = l:results[2]
	elseif(len(l:results) == 1)
		let volumeLine = l:results[0]
	endif
	let volumeLineSplits = split(l:volumeLine, " ")
	let currentVolume = l:volumeLineSplits[0] . l:volumeLineSplits[1]
	let message .= toupper(l:currentVolume)
	call mpc#ColorizeEchoMsg(message)"
endfunction

function! mpc#PlayNextSong()
let results = split(system('mpc --format "[ %artist%] [[- %title%]|[- %file%]]" next '), '\n')
let message = '[mpc] NOW PLAYING: ' . ' ♫' . results[0] . ' ♫'
call mpc#ColorizeEchoMsg(message)
endfunction

function! mpc#PlayPreviousSong()
let results = split(system('mpc --format "[ %artist%] [[- %title%]|[- %file%]]" prev '), '\n')
let message = '[mpc] NOW PLAYING: ' . ' ♫' . results[0] . ' ♫'
call mpc#ColorizeEchoMsg(message)
endfunction

function! mpc#PlaySong(num)
	let song = split(getline(a:num)," ")"
	let results = split(system('mpc --format "[ %artist%] [[- %title%]|[- %file%]]" play ' . song[0]), "\n")
	let message = '[mpc] NOW PLAYING: ' . ' ♫' . results[0] . ' ♫'
	"TODO: Setting statusline from here if possible
	call mpc#ColorizeEchoMsg(message)"
endfunction

function! mpc#EncodeSong(item)
	let item = split(a:item, " @")"
	if(len(item) == 3)
		let song = {'position': item[0],
					\		'artist' : '@ar' . item[1]. 'ar@',
					\		'title': '@ti' . item[2] . 'ti@' }
	elseif(len(item) == 2)
		let song = {'position': item[0],
					\		'title': '@ar' . item[1] . 'ar@' } "using ar eventhough its a title to avoid getting the wrong color in the playlist window
	endif
	return song"
endfunction

function! mpc#DecodeSong(item)
	let line_items = split(substitute(a:item, ' \{2,}', ' ','g'), ' @')"
	let song = {'position': line_items[0],
				\		'artist' : line_items[1][2:-4],
				\		'title' : line_items[2][2:-4]}
	return song"
endfunction

function! mpc#TogglePlayback()
	let command = "mpc toggle""
	let returnBack = split(system(command), '\n')
	let currentSong = returnBack[0]
	let result = returnBack[1]
	let message = '[mpc]'
	let pausePlayFlag = split(result, " ")[0] == "[paused]" ? 1 : 0
	if(pausePlayFlag == 1)
		let message .= " PAUSED"
	else
		let message .= " PLAYING : " . '♫ ' . l:currentSong . ' ♫' 
	endif
	call mpc#ColorizeEchoMsg(message)"
endfunction

function! mpc#ToggleRandom()
	let command = 'mpc random'"
	let result = split(system(command), '\n')
	let status = len(result) == 3 ? result[2] : result[0]
	let message = split(status, '   ')[2] == 'random: off'
				\ ? '[mpc] RANDOM: OFF' : '[mpc] RANDOM: ON'
	call mpc#ColorizeEchoMsg(message)"
endfunction

function! mpc#ToggleRepeat()
	let command = 'mpc repeat'"
	let result = split(system(command), '\n')
	let status = len(result) == 3 ? result[2] : result[0]
	let message = split(status, '   ')[1] == 'repeat: off'
				\ ? '[mpc] REPEAT: OFF' : '[mpc] REPEAT: ON'
	call mpc#ColorizeEchoMsg(message)"
endfunction
