" vim filetype plugin for vimrc
"

"" defines a foldlevel for each line of code
function! VimFolds(lnum)
	let s:thisline = getline(a:lnum)
	if match(s:thisline, '^"" ') >= 0
		return '>1'
	endif
	if match(s:thisline, '^""" ') >= 0
		return '>2'
	endif
	if match(s:thisline, '^"""" ')>= 0
		return '>3'
	endif
	return '='
endfunction


"" defines a foldtext
function! VimFoldText()
	" handle special case of normal comment first
	let s:info = '('.string(v:foldend-v:foldstart).' l)'
	if v:foldlevel == 1
		let s:line = ' ◇ '.getline(v:foldstart)[3:]
	elseif v:foldlevel == 2
		let s:line = '   ●  '.getline(v:foldstart)[4:]
	elseif v:foldlevel == 3
		let s:line = '     ▪ '.getline(v:foldstart)[5:]
	endif
	if strwidth(s:line) > 80 - len(s:info) - 3
		return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
	else
		return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
	endif
endfunction


"" set foldsettings automatically for vim files
setlocal foldmethod=expr
setlocal foldlevel=0
setlocal foldexpr=VimFolds(v:lnum)
setlocal foldtext=VimFoldText()
setlocal foldcolumn=3
setlocal foldminlines=2


""" test
" dsfsdf
" dsdf

"""" 4
"

