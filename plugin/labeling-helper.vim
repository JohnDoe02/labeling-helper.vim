augroup labeling_helper
	autocmd!
	autocmd BufReadPost retain.tsv,dataset.tsv setfiletype retaintsv
	autocmd BufReadPost retain.tsv,dataset.tsv py3 updateLines()

  "Bypass vim warnings on file changed externally
	autocmd BufReadPost retain.tsv,dataset.tsv set buftype=acwrite
  autocmd BufWriteCmd retain.tsv,dataset.tsv call WriteFile()

	"autocmd BufRead,BufEnter retain.tsv,dataset.tsv setfiletype retaintsv
augroup END

function! WriteFile()
  py3 appendLines()
  silent execute "write ! cat > %"
  execute "edit!"
  py3 updateLines()
endfunction

python3 << EOF
import vim

lines_on_read=None
def updateLines():
  global lines_on_read
  b = vim.current.buffer
  lines_on_read = len(b)

def readFile(fname):
  contents=[]
  try:
      with open(fname) as infile:
          for line in infile:
              contents.append(line)
  except IOError:
      self.raiseException("File " + fname + " does not exist!")

  return contents

def appendLines():
  b = vim.current.buffer
  contents = readFile(b.name)
  b.append(contents[lines_on_read:])
EOF
