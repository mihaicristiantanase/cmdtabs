" Keep tab line always hidden.
" When pressing <F3> display the tabline in the statusline.

se stal=0

fun! LengthTablineFun()
  let tabline_width = len(' ')
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bmod = ' '
    for bufnr in buflist
      let isbmod = getbufvar(bufnr, "&mod")
      if isbmod == 1
        let bmod = '+'
        break
      endif
    endfor

    if tab == tabpagenr()
      let tabline_width = tabline_width + len(' [ ' . tab . bmod . '] ')
    else
      let tabline_width = tabline_width  + len(' ' . tab . bmod . ' ')
    endif
  endfor
  let tabline_width = tabline_width + len(' ')
  return tabline_width
endf

fun! PrintTablineFun()
  let len = LengthTablineFun()

  redir @a
  :silent se columns?
  redir end

  let x = (split(@a, "=")[1] - len) / 2
  echohl None | echon repeat(" ", x)

  echohl TabLine | echon ' '

  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bmod = ' '
    for bufnr in buflist
      let isbmod = getbufvar(bufnr, "&mod")
      if isbmod == 1
        let bmod = '+'
        break
      endif
    endfor

    if tab == tabpagenr()
      echohl TabLineSel | echon ' [ ' . tab . bmod . '] '
    else
      echohl TabLine | echon ' ' . tab . bmod . ' '
    endif
  endfor
  echohl TabLine | echon ' '
  echohl None
endf

nnoremap <silent> <F3> :call PrintTablineFun()<CR>
