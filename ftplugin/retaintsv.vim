function! PlayWav()
	let line = getline(".")
	let file = split(line)[0]
	let job = job_start(["/usr/bin/aplay", "-q", file])
endfunction

nnoremap <leader>p :call PlayWav()<cr>
