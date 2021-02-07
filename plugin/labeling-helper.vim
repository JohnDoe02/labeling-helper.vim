augroup labeling_helper
	autocmd!
	autocmd BufReadPost retain.tsv,dataset.tsv setfiletype retaintsv
	autocmd BufReadPost retain.tsv,dataset.tsv let b:lines_on_read = line('$')

  "Bypass vim warnings on file changed externally
	autocmd BufReadPost retain.tsv,dataset.tsv set buftype=acwrite
  autocmd BufWriteCmd retain.tsv,dataset.tsv call WriteFile()

	"autocmd BufRead,BufEnter retain.tsv,dataset.tsv setfiletype retaintsv
augroup END

function! WriteFile()
  silent execute "write ! cat > %"
  execute "edit!"
endfunction
