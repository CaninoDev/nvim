" ----------------------------------------------------------------------
" | Plugin - neovimhaskell/haskell-vim                                  |
" ----------------------------------------------------------------------
" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0


" ----------------------------------------------------------------------
" | Plugin - hindent & stylish-haskell                                  |
" ----------------------------------------------------------------------
" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END

" ----------------------------------------------------------------------
" | Plugin - scooloose/nerdcommenter                                    |
" ----------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ----------------------------------------------------------------------
" | Plugin - vim-airline/vim-airline                                   |
" ----------------------------------------------------------------------
let g:airline_symbols_powerline = 1

" I don't care about the file type, encoding, or format.
let g:airline_section = "%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}"

" ----------------------------------------------------------------------
" | Plugin - ghc-mod                                                    |
" ----------------------------------------------------------------------
au FileType haskell
    \ map <silent> <buffer> tc :GhcModTypeClear<CR> |
    \ map <silent> <buffer> ti :GhcModTypeInsert<CR> |
    \ map <silent> <buffer> tt :GhcModType<CR>

" ----------------------------------------------------------------------
" | Plugin - ervandew/supertab                                           |
" ----------------------------------------------------------------------
function! EnableSuperTab()
		let g:SuperTabeDefautCompletionType = '<c-x><c-o>'
		let g:haskellMode_completion_ghc = 0
		let g:necoghc_enable_detailed_browse = 1
		setlocal omnifunc=necoghc#omnifunc

		if has("gui_running")
				imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
		else
				if has("unix")
						inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
				endif
		endif
endfunction

autocmd FileType haskell :call EnableSuperTab()

" ----------------------------------------------------------------------
" | Plugin - emajutsushi/tagbar                                          |
" ----------------------------------------------------------------------
" Open Tagbar for the following languages
autocmd FileType haskell nested :TagBarOpen

