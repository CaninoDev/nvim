" Adapted in part from ccorbi@github and various others
"
" ---------------------------------------------------------------
" | General Settings                                            |
" ---------------------------------------------------------------
"
"   --------------
"  / UI Settings /
"  --------------
"
set nocompatible				" Don't make nvim vi-compatible

set backspace=indent				" ┐ Allow 'backspace' 
set backspace+=eol				" | in insert mode
set backspace+=start				" ┘ 

set cursorline					" Highlight the current line
hi CursorLine cterm=bold gui=bold

"set cpoptions+=$				" When making a change, don't
						" redisplay the line, and
						" intead, put a `$` sign at
						" the end of the changed text.

set laststatus=2				" Always show the status line

set lazyredraw					" Do not redraw the screen while
						" executing macros, registers
						" and other commands that have
						" not been typed. 

set listchars=tab:▸\           			" ┐
set listchars+=trail:·         			" │ Use custom symbols to
set listchars+=eol:↴           			" │ represent invisible 
set listchars+=nbsp:_				" │ characters.
set list	          			" ┘

set nojoinspaces				" When using the join command
						" only insert a single space
						" after a `.`, `?`, or `!`.

set number					" Show line number
set numberwidth=5				" Increase the minimal number
						" columns used for the `line
						" number`.
set report=0					" Report the number of lines
						" changed
"set relativenumber				" Use relative line numbers. 
						" Current line is still in 
						" status bar.

set ruler					" Show cursor position

set noshowmode 					" Don't show the current mode
						" (airline.vim will handle
						" this)

set nostartofline				" Keep the cursor on the same
						" on the same column.

set tabstop=2					" ┐
set smarttab					" │ 
set softtabstop=2				" │ Set global <TAB> settings
set shiftwidth=4				" │
set expandtab					" ┘ Use spaces instead of tab

set scrolloff=5                			" When scrolling, keep the 
						" cursor 5 lines below the 
						" top and 5 lines above the 
						" bottom of the screen.

set showcmd                    			" Show the command being typed.

set showmatch                  			" Highlight matching brackets

set showtabline=2              			" Always show tab bar.

set spelllang=en_us            			" Set the spellcheck language.

set synmaxcol=2500             			" Limit syntax highlighting 
						" (this avoids the very slow 
						" redrawing when files contain 
						" long lines).

set title                      			" Show the filename in the 
						" window titlebar.

"set virtualedit=all            		" Allow cursor to be anywhere.

set wildmenu                   			" Enable enhanced command-line
                               			" completion (by hitting <TAB> 
						" in command mode, Vim will 
						" show the possible matches 
						" just above the command
						" line with the first match
						" highlighted.

set winminheight=0				" Allow windows to be squashed;

"   ---------------------
"  / Search and Replace /
"  ---------------------

set gdefault					" Default add g flag to
						" search/replace. Add `g` to
						" toggle.
						"
set hlsearch					" Enable search highlighting.\

set ignorecase					" Ignore case in search 
						" patterns.

set incsearch					" Highlight search pattern as
						" it is being typed.
						
set smartcase					" Override `ignorecase` option
						" if the search pattern
						" contains uppercase
						" characters.

set magic					" Enable extended regexp.

" REMAPPINGS
" [\* ] Search and replace the word under the cursor.
nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" [\cs] Clear search.
map <leader>xs <Esc>:noh<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"   ----------------
"  / UI Management /
"  -----------------

" REMAPPINGS
" Window navigation using <C-[h,j,k,l]>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"   ----------------------
"  / File Administration /
"  ----------------------

"
" Reading and Writing Files
set binary					" Enables reading of binary 
						" files
" In case we forgot to sudo nvim protected files`
cmap w!! w !sudo tee > /dev/null %

set encoding=utf-8				" Use UTF-8 without BOM
set fileencoding=utf-8			

"
" Backups, Undos, Swaps Oh My!
"

" For system security, test to see if nvim was invoked by sudo. Sensitive
" files should not leave traces around in user's directory.
if !strlen($SUDO_USER)
  " Keep the backup file of current file before recent save.
  set backup

  " Keep per-file backups in ~/.local/share/nvim/backup/
  if !isdirectory($HOME . "/.local/share/nvim/backup")
    call mkdir($HOME . "/.local/share/nvim/backup", "p")
  endif

  " The double slash at the end of the directory prods Vim into keeping
  " full path to the file in its undo filename to avoid collisions. This is used
  " to same effect for undofles. (See below)
  set backupdir=~/.local/share/nvim/backup//

  set undofile

  if !isdirectory($HOME . '/.local/share/nvim/undo') 
    call mkdir($HOME . '/.local/share/nvim/undo', 'p', 0700)
  endif
  
  " Keep per-file undo history in ~/.local/share/nvim/undo
  set undodir^=~/.local/share/nvim/undo//

  " Have the swap files saved in one place instead of cluttering up the 
  " working directory. (NOT recommended if multiple users are editing the same
  " file)
  if !isdirectory($HOME . '/.local/share/nvim/swap') 
    call mkdir($HOME . '/.local/share/nvim/swap', 'p', 0700)
  endif

  set directory^=$HOME/.local/share/nvim/swap//
  
endif

set wildignore+=*.jpeg				" ┐
set wildignore+=*.gif           		" │
set wildignore+=*.png           		" │
set wildignore+=*.gif           		" │
set wildignore+=*.psd           		" │
set wildignore+=*.o             		" │ Ignore these filetypes
set wildignore+=*.obj           		" │
set wildignore+=*.min.js        		" │
set wildignore+=*/bower_c*/*    		" │
set wildignore+=*/node_m*/*     		" │
set wildignore+=*/vendor/*      		" │
set wildignore+=*/.git/*        		" │
set wildignore+=*/.hg/*         		" │
set wildignore+=*/.svn/*        		" │
set wildignore+=*/log/*         		" │
set wildignore+=*/tmp/*         		" ┘
