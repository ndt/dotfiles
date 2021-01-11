" vim filetype plugin for vimwiki
"


setlocal tabstop=4 
setlocal softtabstop=4 
setlocal shiftwidth=4
setlocal noexpandtab

autocmd BufWritePost <buffer> silent Vimwiki2HTML

function! ToggleCalendar()
	execute ":Calendar"
	if exists("g:calendar_open")
		if g:calendar_open == 1
			execute "q"
			unlet g:calendar_open
		else
			g:calendar_open = 1
		end
	else
		let g:calendar_open = 1
	end
endfunction



map <leader>wc :call ToggleCalendar()

nnoremap <leader>t<leader>d :-1read $HOME/vimwiki/templates/diary.tmpl.wiki<C-R>
