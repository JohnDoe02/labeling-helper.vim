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
	" Note: This is 06f<tab>l
	normal 06f	l
endfunction

function! SetQuality(value)
	call ToQuality()
  " make sure there is at least one character for the following 'cw' command
	execute "normal" "ix"
	execute "normal" "cw" . a:value
endfunction

setlocal cursorline

" As far as I understand, these should not be autocommands as this whole file
" is reloaded automatically whenever buffer the FileType event is triggered
nnoremap <buffer> <leader>pf :call PlayWav()<cr>
nnoremap <buffer> <leader>tr :call ToRecognition()<cr>
nnoremap <buffer> <leader>mw :call SetQuality("wrong")<cr>
nnoremap <buffer> <leader>mc :call SetQuality("correct")<cr>
nnoremap <buffer> <leader>ma :call SetQuality("ambiguous")<cr>
nnoremap <buffer> <leader>mt :call SetQuality("training")<cr>
nnoremap <buffer> <leader>ud :w<cr> G
