command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindSymbols
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "(type|enum|struct|trait)[ \t]+([a-zA-Z0-9_]+)" -g "*.rs" -S | rg -S '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindFunctions
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "fn +([a-zA-Z0-9_]+)" -g "*.rs" | rg -g "*.rs" -S '.substitute(shellescape(<q-args>), " ", "|rg -g '*.rs' -S", ""), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:20%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* FindImpls
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always "impl([ \t\n]*<[^>]*>)?[ \t]+(([a-zA-Z0-9_:]+)[ \t]*(<[^>]*>)?[ \t]+(for)[ \t]+)?([a-zA-Z0-9_]+)" | rg -S '.substitute(shellescape(<q-args>), " ", "|rg ", ""), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
