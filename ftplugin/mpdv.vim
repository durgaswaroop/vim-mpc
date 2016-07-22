" function! GetMPCStatusline()
" 	let cmd = "mpc status"
" 	sil! let result = split(system(cmd), '\n')
" 	" let result = split(system(cmd), '\n')
" 	let status = len(result) == 3 ? result[2] : result[0]

" 	sil! let [s:count, s:settings] = [len(split(system('mpc playlist'),'\n')), split(status,'   ')]

" 	sil! let s:statusline = " "
" 				\ . s:settings[1] . "---"
" 				\ . s:settings[2] . "---%="
" 				\ . s:count . " songs "

" 	return s:statusline
" endfunction

set buftype=nofile
" setlocal statusline=%!GetMPCStatusline()
setlocal conceallevel=3
setlocal concealcursor=nvic

