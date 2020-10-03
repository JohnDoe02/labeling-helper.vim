function! PlayWav()
	let l:line = getline(".")
	let l:file = split(line)[0]

	" If it is an absolute path, filename can be passed through
	" Otherwise assume file is given relative to current path
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

nnoremap <buffer> <leader>pf :call PlayWav()<cr>
nnoremap <buffer> <leader>tr :call ToRecognition()<cr>
nnoremap <buffer> <leader>sm :call SetSource("manual")<cr>
nnoremap <buffer> <leader>sc :call SetQuality("correct")<cr>
nnoremap <buffer> <leader>sw :call SetQuality("wrong")<cr>
nnoremap <buffer> <leader>mw :call SetQuality("wrong")<cr>:call SetSource("manual")<cr>
nnoremap <buffer> <leader>mc :call SetQuality("correct")<cr>:call SetSource("manual")<cr>
nnoremap <buffer> <leader>rw :call SetQuality("wrong")<cr>:call SetSource("reference")<cr>
nnoremap <buffer> <leader>rc :call SetQuality("correct")<cr>:call SetSource("reference")<cr>
