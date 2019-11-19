" let l:vimwiki_fold_blank_lines = 0  " set to 1 to fold blank lines
" let l:vimwiki_header_type = '#'     " set to '=' for wiki syntax
setlocal foldlevel=1
setlocal foldenable
setlocal foldmethod=expr
normal zR
setlocal foldexpr=Fold()

function! Fold()
  let line = getline(v:lnum)

  " Regular headers
  let depth = match(line, '\(^#\+\)\@<=\( .*$\)\@=')
  if depth > 0
    return ">" . depth
  endif

  " Setext style headings
  let prevline = getline(v:lnum - 1)
  let nextline = getline(v:lnum + 1)
  if (line =~ '^.\+$') && (nextline =~ '^=\+$') && (prevline =~ '^\s*$')
    return ">1"
  endif

  if (line =~ '^.\+$') && (nextline =~ '^-\+$') && (prevline =~ '^\s*$')
    return ">2"
  endif

  " frontmatter
  if (v:lnum == 1) && (line =~ '^----*$')
	  return ">1"
  endif

  return "="
endfunction
