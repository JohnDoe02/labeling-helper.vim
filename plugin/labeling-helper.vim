augroup labeling_helper
	autocmd!
	autocmd BufRead retain.tsv,dataset.tsv setfiletype retaintsv

  au FileType retaintsv nnoremap <buffer> <leader>pf :call PlayWav()<cr>
  au FileType retaintsv nnoremap <buffer> <leader>tr :call ToRecognition()<cr>
  au FileType retaintsv nnoremap <buffer> <leader>sm :call SetSource("manual")<cr>
  au FileType retaintsv nnoremap <buffer> <leader>sc :call SetQuality("correct")<cr>
  au FileType retaintsv nnoremap <buffer> <leader>sw :call SetQuality("wrong")<cr>
  au FileType retaintsv nnoremap <buffer> <leader>mw :call SetQuality("wrong")<cr>:call SetSource("manual")<cr>
  au FileType retaintsv nnoremap <buffer> <leader>mc :call SetQuality("correct")<cr>:call SetSource("manual")<cr>
  au FileType retaintsv nnoremap <buffer> <leader>rw :call SetQuality("wrong")<cr>:call SetSource("reference")<cr>
  au FileType retaintsv nnoremap <buffer> <leader>rc :call SetQuality("correct")<cr>:call SetSource("reference")<cr>
augroup END
