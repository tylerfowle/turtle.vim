command! Commentr call Commentr()
function! Commentr()

  let s:line=line(".")
  let s:bar = "##############################################################################"

  let s:comment=split(&commentstring, '%s')
  if len(s:comment)==1
    call add(s:comment, '')
  endif

  let s:start = s:comment[0]
  let s:end = s:comment[-1]

  normal! ^f.w
  let s:word = expand('<cword>')

  let bigComment=0
  if (&ft == "scss" || &ft == "css" || &ft == "sass")
    let bigComment=1
  elseif (&ft == "html" || &ft == "htmldjango")
    normal!  ^f"w
    let s:word = expand('<cword>')
  endif

  if bigComment
    call append(s:line-1, s:start . s:bar . s:end)
  endif
  call append(s:line-1, s:start . s:word . s:end)
  if bigComment
    call append(s:line-1, s:start . s:bar . s:end)
  endif

  unlet bigComment
  unlet s:word
  unlet s:line
  unlet s:bar
  unlet s:comment
  unlet s:start
  unlet s:end

endfunction
