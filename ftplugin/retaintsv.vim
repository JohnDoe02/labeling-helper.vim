function! PlayWav()
	let l:line = getline(".")
	let l:file = split(line)[0]

	" If it is an absolute path, filename can be passed through
	" Otherwise recording file is given relative to tsv file
	if l:file[0] == '/'
		let l:job = job_start(["/usr/bin/aplay", "-q", l:file])
	else
		let l:job = job_start(["/usr/bin/aplay", "-q", expand('%:p:h') . "/" . l:file])
	endif
endfunction

function! ToRecognition()
	" Note: This is 04f<tab>l
	normal 04f	l
endfunction

function! ToQuality()
	" Note: This is 04f<tab>l
	normal 08f	l
endfunction

function! ToSource()
	" Note: This is 04f<tab>l
	normal 09f	l
endfunction

function! SetQuality(value)
	call ToQuality()
	execute "normal" "cw" . a:value
endfunction

function! SetSource(value)
	call ToSource()
	execute "normal" "cw" . a:value
endfunction
