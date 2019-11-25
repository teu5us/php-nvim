let mapleader =" "
let maplocalleader ="-"
set guicursor=
let $VTE_VERSION="100"

" function! SetKeyMap()
" if system("setxkbmap -query | awk '/^variant/ {print $2}'") == "altgr-intl,\n"
"   set keymap=russian-jcukenwin
" elseif system("setxkbmap -query | awk '/^variant/ {print $2}'") == "dvorak-alt-intl,\n"
"   set keymap=russian-dvorak
" endif
" endfunction

" call SetKeyMap()

" nnoremap <C-z> /<C-^><C-c>
" vnoremap <C-z> /<C-^><C-c>
" inoremap <C-z> <C-^>
" cmap <C-z> <C-^>
" set ttimeoutlen=50
" set iminsert=0
" set imsearch=-1

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin indent on
  set omnifunc=syntaxcomplete#Complete
	syntax on
	set encoding=utf-8
	set number relativenumber
	" set number
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Moar speed
set lazyredraw
set ttyfast
set synmaxcol=200
set regexpengine=1

" Appearance
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set t_Co=256
set t_ut=
set bg=dark
set laststatus=2
set cursorline

set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus
set scrolloff=7
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ru
set noshowmode
set noswapfile
set completeopt+=preview
set title titlelen=0 titlestring=%<%F%=%(\ %)\|%(\ %)%l/%L-%P
" set title titlestring=%<%F%= titlelen=0

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Visuals
Plug 'mhinz/vim-startify'
  autocmd BufEnter *
         \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') |
         \   let t:startify_new_tab = 1 |
         \   Startify |
         \ endif
Plug 'nikvdp/neomux'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'itchyny/lightline.vim'
	let g:lightline = {
			\ 'colorscheme' : 'PaperColor',
			\ 'active' : {
			\ 	'left' : [ [ 'mode', 'paste' ],
			\		[ 'gitbranch', 'readonly', 'filename', 'modified', 'winnum' ] ]
			\ },
			\ 'component_function' : {
			\	'gitbranch' : 'fugitive#head',
      \ 'winnum' : 'WindowNumber'
			\ },
			\ }
Plug 'morhetz/gruvbox'
  let g:gruvbox_italic = 1
  let g:gruvbox_termcolors = 256
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_contrast_light = 'hard'
Plug 'NLKNguyen/papercolor-theme'
	let g:PaperColor_Theme_Options = {
	  \   'theme': {
	  \     'default': {
	  \       'transparent_background': 1,
    \       'allow_italic': 1,
    \       'allow_bold': 1
	  \     }
	  \   }
	  \ }
Plug 'tomasiser/vim-code-dark'
  let g:codedark_term256=1
Plug 'nathanaelkane/vim-indent-guides'
	let g:indent_guides_enable_on_vim_startup = 1

" Syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'neovimhaskell/haskell-vim'
  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
Plug 'digitaltoad/vim-pug'
Plug 'sheerun/vim-polyglot'
	let g:polyglot_disabled = ['vue', 'markdown']
Plug 'posva/vim-vue'
    " let g:vue_pre_processors = []
  	let g:vue_pre_processors = 'detect_on_enter'
Plug 'chrisbra/Colorizer'
	let g:colorizer_auto_color = 1
	let g:colorizer_auto_filetype='css,scss,sass,html,pug,vue'
Plug 'vimwiki/vimwiki'
  let g:vimwiki_table_mappings = 0
  let g:vimwiki_table_auto_fmt = 0
  " Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	let g:markdown_syntax_conceal = 0
  let g:vimwiki_global_ext = 1
  let g:vimwiki_folding = 'custom'
  set foldtext=MyFoldText()
  fu! MyFoldText()
  	let line = getline(v:foldstart)

  	" markdown frontmatter -- just take the next line hoping it would be
  	" title: Your title
  	if line =~ '^----*$'
  		let line = getline(v:foldstart+1)
  	endif

  	let indent = max([indent(v:foldstart)-v:foldlevel, 1])
  	let lines = (v:foldend - v:foldstart + 1)
  	let strip_line = substitute(line, '^//\|=\+\|["#]\|/\*\|\*/\|{{{\d\=\|title:\s*', '', 'g')
  	let strip_line = substitute(strip_line, '^[[:space:]]*\|[[:space:]]*$', '', 'g')
  	let text = strpart(strip_line, 0, winwidth(0) - v:foldlevel - indent - 6 - strlen(lines))
  	if strlen(strip_line) > strlen(text)
  		let text = text.'…'
  	endif
  	return repeat('▧', v:foldlevel) . repeat(' ', indent) . text .' ('. lines .')'
  endfu
Plug 'lervag/vimtex'
    let g:vimtex_quickfix_enabled = 0
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'nvim',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
    	\   '-quiet',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-xelatex -silent',
        \ 'pdflatex'         : '-pdf',
        \ 'dvipdfex'         : '-pdfdvi',
        \ 'xelatex'          : '-xelatex',
        \ 'lualatex'         : '-lualatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

" Movement
Plug 'Teu5us/vim-plugin-ruscmd'

" Else
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'equalsraf/neovim-gui-shim'
Plug 'prabirshrestha/async.vim'

" Commands
Plug 'mbbill/undotree'
  map <leader>ut :UndotreeToggle<CR>
  map <leader>ге :UndotreeToggle<CR>
Plug 'chrisbra/changesPlugin'
Plug 'tomtom/tcomment_vim'
  map пс gc
  map псс gcc
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-abolish'
Plug 'majutsushi/tagbar'
	nmap <F8> :TagbarToggle<CR>
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
	nmap <leader>ags :Gstatus<CR>
	nmap <leader>agw :Gw<CR>
	nmap <leader>agW :Gwq<CR>
	nmap <leader>agdv :Gvdiff<CR>
	nmap <leader>agds :Gsdiff<CR>
	nmap <leader>agc :Gcommit<CR>
	nmap <leader>agb :Gblame<CR>
Plug 'junegunn/vim-easy-align'
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
Plug 'dhruvasagar/vim-table-mode'
	" autocmd FileType markdown,rmd TableModeEnable
	" autocmd FileType vimwiki TableModeEnable
	let g:table_mode_corner_corner='|'
	let g:table_mode_corner = '|'
	let g:table_mode_header_fillchar='='
Plug 'jsfaint/gen_tags.vim'
Plug 'ludovicchabant/vim-gutentags'
	let g:gutentags_enabled=0
Plug 'moll/vim-bbye'
Plug 'dense-analysis/ale'
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 0
  let g:ale_set_balloons = 1
  let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
  let g:ale_linters = {'vue': ['eslint', 'vls']}
" Unused
" Plug 'LukeSmithxyz/vimling'
	" nm <leader>d :call ToggleDeadKeys()<CR>
	" imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	" nm <leader>i :call ToggleIPA()<CR>
	" imap <leader>i <esc>:call ToggleIPA()<CR>a
	" nm <leader>q :call ToggleProse()<CR>

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
	let g:fzf_command_prefix = 'Fzf'
	" imap <c-x><c-k> <plug>(fzf-complete-word)
	imap <c-x><c-f> <plug>(fzf-complete-path)
	imap <c-x><c-j> <plug>(fzf-complete-file-ag)
	imap <c-x><c-l> <plug>(fzf-complete-line)
	" Command for git grep
	" - fzf#vim#grep(command, with_column, [options], [fullscreen])
	command! -bang -nargs=* GGrep
  	\ call fzf#vim#grep(
  	\   'git grep --line-number '.shellescape(<q-args>), 0,
  	\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
	" Override Colors command. You can safely do this in your .vimrc as fzf.vim
	" will not override existing commands.
	command! -bang Colors
  	\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
	" Augmenting Ag command using fzf#vim#with_preview function
	"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
	"     * For syntax-highlighting, Ruby and any of the following tools are required:
	"       - Bat: https://github.com/sharkdp/bat
	"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
	"       - CodeRay: http://coderay.rubychan.de/
	"       - Rouge: https://github.com/jneen/rouge
	"
	"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
	"   :Ag! - Start fzf in fullscreen and display the preview window above
	command! -bang -nargs=* Ag
  	\ call fzf#vim#ag(<q-args>,
  	\                 <bang>0 ? fzf#vim#with_preview('up:60%')
  	\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  	\                 <bang>0)
	" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
	command! -bang -nargs=* Rg
  	\ call fzf#vim#grep(
  	\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  	\   <bang>0 ? fzf#vim#with_preview('up:60%')
  	\           : fzf#vim#with_preview('right:50%:hidden', '?'),
  	\   <bang>0)
	" Likewise, Files command with preview window
	command! -bang -nargs=? -complete=dir Files
  	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" snippets
	" " NO Tab with YCM
	" " let g:UltiSnipsExpandTrigger="<c-x>"
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="vertical"
	" " ActivateAddons vim-snippets ultisinps
Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" coc settings
	let g:coc_global_extensions = ['coc-lists', 'coc-python', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-json', 'coc-vetur', 'coc-vimtex', 'coc-emmet', 'coc-snippets', 'coc-ultisnips']
	nmap <silent> <C-c> <Plug>(coc-cursors-position)
	nmap <silent> <C-с> <Plug>(coc-cursors-position)
	nmap <silent> <C-d> <Plug>(coc-cursors-word)*
	nmap <silent> <C-в> <Plug>(coc-cursors-word)*
	xmap <silent> <C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
	xmap <silent> <C-в> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
	xmap <silent> <C-d> <Plug>(coc-cursors-range)
	xmap <silent> <C-в> <Plug>(coc-cursors-range)
	" use normal command like `<leader>xi(`
	nmap <leader>x  <Plug>(coc-cursors-operator)
	nmap <leader>ч  <Plug>(coc-cursors-operator)
	" autocmd CursorHold * silent call CocActionAsync('highlight')
	" Use <C-l> for trigger snippet expand.
	imap <C-l> <Plug>(coc-snippets-expand)
	imap <C-д> <Plug>(coc-snippets-expand)
	" Use <C-j> for select text for visual placeholder of snippet.
	vmap <C-j> <Plug>(coc-snippets-select)
	vmap <C-о> <Plug>(coc-snippets-select)
	" Use <C-j> for jump to next placeholder, it's default of coc.nvim
	let g:coc_snippet_next = '<c-j>'
	let g:coc_snippet_next = '<c-о>'
	" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
	let g:coc_snippet_prev = '<c-k>'
	let g:coc_snippet_prev = '<c-о>'
	" Use <C-j> for both expand and jump (make expand higher priority.)
	imap <C-j> <Plug>(coc-snippets-expand-jump)
	imap <C-о> <Plug>(coc-snippets-expand-jump)
	" coc-translator
	" popup
	map <Leader>t <Plug>(coc-translator-p)
	map <Leader>е <Plug>(coc-translator-p)
	" echo
	map <Leader>e <Plug>(coc-translator-e)
	map <Leader>у <Plug>(coc-translator-e)
	" replace
	map <Leader>r <Plug>(coc-translator-r)
	map <Leader>к <Plug>(coc-translator-r)
	" coc settings
call plug#end()

""" SET COLORSCHEME """
" colo PaperColor
colo codedark

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
nmap <leader>tf :Vexplore<CR>
nmap <leader>еа :Vexplore<CR>

" My keymaps
  nmap <C-т> <C-n>
  nmap <C-з> <C-p>
	map <leader>H ^
	map <leader>L $
	map <leader>Р ^
	map <leader>Д $
	map <leader>h g^
	map <leader>l g$
	map <leader>р g^
	map <leader>д g$
  map ze z=
  map яу z=
  map gh <Nop>

  " enable emacs-style line navigation in insert mode
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-p> <Up>
  noremap <C-n> <Down>
  inoremap <C-o> <C-[>ea
  inoremap <C-u> <C-[>gea
  inoremap <C-e> <C-[>A
  inoremap <C-a> <C-[>I
  inoremap <C-q> <C-[>(i
  inoremap <C-k> <Right><C-[>)i

" Dictionary
	vmap <leader>xx y:silent !goldendict "<C-r>0" &<CR>
	vmap <leader>чч y:silent !goldendict "<C-r>0" &<CR>
	vmap <leader>oe y:!setsid --fork st -g 100x30 -e mtran e -l <C-r>0<CR><C-c>
	vmap <leader>щу y:!setsid --fork st -g 100x30 -e mtran e -l <C-r>0<CR><C-c>
	vmap <leader>og y:!setsid --fork st -g 100x30 -e mtran g -l <C-r>0<CR><C-c>
	vmap <leader>щп y:!setsid --fork st -g 100x30 -e mtran g -l <C-r>0<CR><C-c>
	" vmap <leader>ole y:!setsid --fork st -g 100x30 -e lingvo e <C-r>0<CR><C-c>
	" vmap <leader>щду y:!setsid --fork st -g 100x30 -e lingvo e <C-r>0<CR><C-c>
	" vmap <leader>old y:!setsid --fork st -g 100x30 -e lingvo d <C-r>0<CR><C-c>
	" vmap <leader>щдв y:!setsid --fork st -g 100x30 -e lingvo d <C-r>0<CR><C-c>
	vmap <leader>ole y:exec '!lingvo e -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
	vmap <leader>щду y:exec '!lingvo e -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
	vmap <leader>old y:exec '!lingvo d -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
	vmap <leader>щдв y:exec '!lingvo d -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
	nmap <leader>ole viwy:exec '!lingvo e -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><C-c>
	nmap <leader>щду yviw:exec '!lingvo e -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
	nmap <leader>old yviw:exec '!lingvo d -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
	nmap <leader>щдв yviw:exec '!lingvo d -n <C-r>0 > /tmp/lingvo.log 2>&1'<CR><CR><CR>
  nmap <leader>otb :botright pedit +:setl\ autoread /tmp/lingvo.log<CR>
  nmap <leader>щеи :botright pedit +:setl\ autoread /tmp/lingvo.log<CR>
  vmap <leader>ats "qyo<C-[>o<C-[>O<C-h>==> TRANS:<C-[>gcc:r !echo '<C-r>q' \| trans -brief<space>
  vmap <leader>феы "qyo<C-[>o<C-[>O<C-h>==> TRANS:<C-[>gcc:r !echo '<C-r>q' \| trans -brief<space>

" Opening files
	nmap <leader>ff :FzfFiles<CR>
	nmap <leader>аа :FzfFiles<CR>
	nmap <leader>fh :FzfHistory<CR>
	nmap <leader>ар :FzfHistory<CR>
	nmap <leader>vs :vs<space>
	nmap <leader>мы :vs<space>
	nmap <leader>fe :e<space>
	nmap <leader>ау :e<space>
	nmap <leader>ft :tabe<space>
	nmap <leader>ае :tabe<space>

" New bufs/tabs
	nmap <leader>w2 :vnew<space><CR>
	nmap <leader>ц2 :vnew<space><CR>
	nmap <leader>w3 :new<space><CR>
	nmap <leader>ц3 :new<space><CR>
	nmap <leader>w5 :tabnew<space><CR>
	nmap <leader>ц5 :tabnew<space><CR>

" Moving/switching buffers
	nmap <leader>mv :vert sb<space>
	nmap <leader>ьм :vert sb<space>
	nmap <leader>ms :sb<space>
	nmap <leader>ьы :sb<space>
	nmap <leader>mt <C-w>T
	nmap <leader>ье <C-w>T

" Saving/quitting
	nmap <leader>fs :w<CR>
	nmap <leader>аы :w<CR>
	nmap <leader>qf :Bwipeout<CR>
	nmap <leader>йа :Bwipeout<CR>
	nmap <leader>fq :q<CR>
	nmap <leader>ай :q<CR>
	nmap <leader>qz :bufdo :Bdelete<CR>
	nmap <leader>йя :bufdo :Bdelete<CR>
	nmap <leader>qq :qa<CR>
	nmap <leader>йй :qa<CR>

" vimrc
	nmap <leader>fed :e ~/.config/nvim/init.vim<CR>
	nmap <leader>аув :e ~/.config/nvim/init.vim<CR>
	nmap <leader>feR :source ~/.config/nvim/init.vim<CR>
	nmap <leader>ауК :source ~/.config/nvim/init.vim<CR>

" Command mode disabled
  map Q <Nop>
	nnoremap QQ :q<CR>
	nnoremap ЙЙ́́́́ :q<CR>

" break line
	nmap Y i<C-m><C-[>
	nmap Н i<C-m><C-[>

" Searching
	" nmap \ /
	nmap <leader>sff mq:FzfBLines<CR>
	nmap <leader>ыаа mq:FzfBLines<CR>
	nmap <leader>sfw mq:FzfLines<CR>
	nmap <leader>ыац mq:FzfLines<CR>
	nmap gb 'q
	nmap пи 'q
	nmap <leader>sr :reg<CR>
	nmap <leader>ык :reg<CR>
	nmap <leader>xc :FzfHistory:<CR>
	nmap <leader>чс :FzfHistory:<CR>
	nmap <leader>xs :FzfHistory/<CR>
	nmap <leader>чв :FzfHistory/<CR>
	nmap <leader>sm :FzfMarks<CR>
	nmap <leader>ыь :FzfMarks<CR>
	nmap <leader>ac :FzfCommands<CR>
	nmap <leader>фс :FzfCommands<CR>
	nmap <leader>bt :tabs<CR>:tabn<C-b>
	nmap <leader>ие :tabs<CR>:tabn<C-b>
	nmap <leader>bb :FzfBuffers<CR>
	nmap <leader>ии :FzfBuffers<CR>

" Wrap toggles
	nmap <leader>tw :set wrap<CR>
	nmap <leader>ец :set wrap<CR>
	nmap <leader>tW :set nowrap<CR>
	nmap <leader>еЦ :set nowrap<CR>

" Apps
	" nmap <leader>at :vs \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	" nmap <leader>фе :vs \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	nmap <leader>atv :vs \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	nmap <leader>фем :vs \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	nmap <leader>ath :12split \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	nmap <leader>фер :12split \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	nmap <leader>ao :set splitright! \| :40vs \| :terminal opener1<CR>:file opener<CR>:set splitright<CR>i
	nmap <leader>фщ :set splitright! \| :40vs \| :terminal opener1<CR>:file opener<CR>:set splitright<CR>i
	nmap <leader>al :vs \| :terminal lynx duckduckgo.com<CR>i
	nmap <leader>фд :vs \| :terminal lynx duckduckgo.com<CR>i
	nmap <leader>ar :vs \| :terminal ranger<CR>i
	nmap <leader>фк :vs \| :terminal ranger<CR>i
	" nmap <leader>aR :vs \| :terminal ranger -r $HOME/.config/ranger_urxvt<CR>i
	" nmap <leader>фК :vs \| :terminal ranger -r $HOME/.config/ranger_urxvt<CR>i
	nmap <leader>zcp :!pug --pretty %<CR>
	nmap <leader>ясз :!pug --pretty %<CR>

" TERM
	au BufEnter opener :vertical resize 40
	tnoremap <leader>ao <C-\><C-n>:q<CR>
	tnoremap <leader>фщ <C-\><C-n>:q<CR>
	tnoremap <C-q> <C-\><C-n>
	tnoremap <C-й> <C-\><C-n>
	tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
	tnoremap <C-p> <CR><C-\><C-n>
	if has('nvim')
	    au TermOpen  * setlocal norelativenumber nonumber
	    au TermClose * setlocal   relativenumber   number | q!
	endif

" Goyo plugin makes text more readable when writing prose:
	map <leader>agg :Goyo \| set bg=dark \| set linebreak<CR>
	map <leader>фпп :Goyo \| set bg=dark \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>cs :setlocal spell! spelllang=en_us,ru_ru<CR>
	map <leader>сы :setlocal spell! spelllang=en_us,ru_ru<CR>

" Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  map <leader>wh <C-w>h
  map <leader>wj <C-w>j
  map <leader>wk <C-w>k
  map <leader>wl <C-w>l
  map <leader>цр <C-w>h
  map <leader>цо <C-w>j
  map <leader>цл <C-w>k
  map <leader>цд <C-w>l

" Check file in shellcheck:
	map <leader>cS :!clear && shellcheck %<CR>
	map <leader>сЫ :!clear && shellcheck %<CR>

" Open my bibliography file in split
	" map <leader>B :vsp<space>$BIB<CR>
	" map <leader>R :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	" nnoremap S :%s##g<Left><Left>
  nmap <leader>S :%s##g<Left><Left>
  nmap <leader>Ы :%s##g<Left><Left>
  vmap <leader>S :s##gc<Left><Left><Left>
  vmap <leader>Ы :s##gc<Left><Left><Left>
  vmap <leader>I :norm I
  vmap <leader>Ш :norm I
  vmap <leader>A :norm A
  vmap <leader>Ф :norm A

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>zcc :w! \| !compiler <c-r>%<CR>
	map <leader>ясс :w! \| !compiler <c-r>%<CR>
	map <leader>zcd :w! \| !compiler <c-r>% && convdoc <c-r>%<CR>
	map <leader>ясв :w! \| !compiler <c-r>% && convdoc <c-r>%<CR>
	map <leader>ad :!docspreview <c-r>%<CR><CR>
	map <leader>фв :!docspreview <c-r>%<CR><CR>
	" autocmd BufWritePost *.rmd :!compiler %

" Open corresponding .pdf/.html or preview
	map <leader>ap :!opout <c-r>%<CR><CR>
	map <leader>фз :!opout <c-r>%<CR><CR>

" Navigating with guides
	inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	map <leader><Tab> <Esc>/<++><Enter>"_c4l

	inoremap <leader>^ <Esc>/<+-><Enter>"_c4l
	vnoremap <leader>^ <Esc>/<+-><Enter>"_c4l
	map <leader>^ <Esc>/<+-><Enter>"_c4l

" " Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
" 	vnoremap <C-c> "+y
" 	map <C-p> "+p

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=dark

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
	autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

"""LATEX
	au BufNewFile,BufRead *.tex set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix
	au InsertLeave *.tex w
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

	fu! TEX()
		" Word count:
		" autocmd FileType tex map <leader>W :w !detex \| wc -w<CR>
		" Code snippets
		inoremap <buffer> ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
		inoremap <buffer> ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
		inoremap <buffer> ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
		inoremap <buffer> ,em \emph{}<++><Esc>T{i
		inoremap <buffer> ,bf \textbf{}<++><Esc>T{i
		vnoremap <buffer> , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
		inoremap <buffer> ,it \textit{}<++><Esc>T{i
		inoremap <buffer> ,ct \textcite{}<++><Esc>T{i
		inoremap <buffer> ,cp \parencite{}<++><Esc>T{i
		inoremap <buffer> ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
		inoremap <buffer> ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
		inoremap <buffer> ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
		inoremap <buffer> ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
		inoremap <buffer> ,li <Enter>\item<Space>
		inoremap <buffer> ,ref \ref{}<Space><++><Esc>T{i
		inoremap <buffer> ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
		inoremap <buffer> ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
		inoremap <buffer> ,can \cand{}<Tab><++><Esc>T{i
		inoremap <buffer> ,con \const{}<Tab><++><Esc>T{i
		inoremap <buffer> ,v \vio{}<Tab><++><Esc>T{i
		inoremap <buffer> ,a \href{}{<++>}<Space><++><Esc>2T{i
		inoremap <buffer> ,sc \textsc{}<Space><++><Esc>T{i
		inoremap <buffer> ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
		inoremap <buffer> ,sec \section{}<Enter><Enter><++><Esc>2kf}i
		inoremap <buffer> ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
		inoremap <buffer> ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
		inoremap <buffer> ,st <Esc>F{i*<Esc>f}i
		inoremap <buffer> ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
		inoremap <buffer> ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
		nnoremap <buffer> ,up /usepackage<Enter>o\usepackage{}<Esc>i
		inoremap <buffer> ,tt \texttt{}<Space><++><Esc>T{i
		inoremap <buffer> ,bt {\blindtext}
		inoremap <buffer> ,nu $\varnothing$
		inoremap <buffer> ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
		inoremap <buffer> ,rn (\ref{})<++><Esc>F}i
	endfu
  au FileType tex call TEX()

"""HTML
	au BufNewFile,BufRead *.html set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=150 | set expandtab | set autoindent | set fileformat=unix

  fu! HTML()
    inoremap <buffer> ,b <b></b><Esc>FbT>i
    inoremap <buffer> ,it <em></em><Esc>FeT>i
    inoremap <buffer> ,1 <h1></h1><Esc>2kf<i
    inoremap <buffer> ,2 <h2></h2><Esc>2kf<i
    inoremap <buffer> ,3 <h3></h3><Esc>2kf<i
    inoremap <buffer> ,p <p></p><Esc>0f>a
    inoremap <buffer> ,a <a<Space>href=""><++></a><Esc>14hi
    inoremap <buffer> ,e <a<Space>target="_blank"<Space>href=""><++></a><Esc>14hi
    inoremap <buffer> ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
    inoremap <buffer> ,li <Esc>o<li></li><Esc>F>a
    inoremap <buffer> ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
    inoremap <buffer> ,im <img src="" alt="<++>"><++><esc>Fcf"a
    inoremap <buffer> ,td <td></td><++><Esc>Fdcit
    inoremap <buffer> ,tr <tr></tr><Enter><++><Esc>kf<i
    inoremap <buffer> ,th <th></th><++><Esc>Fhcit
    inoremap <buffer> ,tab <table><Enter></table><Esc>O
    inoremap <buffer> ,gr <font color="green"></font><Esc>F>a
    inoremap <buffer> ,rd <font color="red"></font><Esc>F>a
    inoremap <buffer> ,yl <font color="yellow"></font><Esc>F>a
    inoremap <buffer> ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
    inoremap <buffer> ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
    inoremap <buffer> &<space> &amp;<space>
    inoremap <buffer> á &aacute;
    inoremap <buffer> é &eacute;
    inoremap <buffer> í &iacute;
    inoremap <buffer> ó &oacute;
    inoremap <buffer> ú &uacute;
    inoremap <buffer> ä &auml;
    inoremap <buffer> ë &euml;
    inoremap <buffer> ï &iuml;
    inoremap <buffer> ö &ouml;
    inoremap <buffer> ü &uuml;
    inoremap <buffer> ã &atilde;
    inoremap <buffer> ẽ &etilde;
    inoremap <buffer> ĩ &itilde;
    inoremap <buffer> õ &otilde;
    inoremap <buffer> ũ &utilde;
    inoremap <buffer> ñ &ntilde;
    inoremap <buffer> à &agrave;
    inoremap <buffer> è &egrave;
    inoremap <buffer> ì &igrave;
    inoremap <buffer> ò &ograve;
    inoremap <buffer> ù &ugrave;
  endfu
  au FileType html call HTML()

""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	" au FileType markdown,pandoc set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=80 | set expandtab | set autoindent | set fileformat=unix
	" autocmd BufEnter *.rmd set filetype=pandoc
	function! MD()
    map <buffer> <leader>W yiWi[<esc>Ea](<esc>pa)
    map <buffer> <leader>Ц yiWi[<esc>Ea](<esc>pa)
    inoremap <buffer> ,n ---<Enter><Enter>
    inoremap <buffer> ,т ---<Enter><Enter>
    inoremap <buffer> ,b ****<++><Esc>F*hi
    inoremap <buffer> ,и ****<++><Esc>F*hi
    inoremap <buffer> ,c **<++><Esc>F*i
    inoremap <buffer> ,с **<++><Esc>F*i
    inoremap <buffer> ,s ~~~~<++><Esc>F~hi
    inoremap <buffer> ,ы ~~~~<++><Esc>F~hi
    inoremap <buffer> ,e **<++><Esc>F*i
    inoremap <buffer> ,у **<++><Esc>F*i
    inoremap <buffer> ,i ![](<++>)<++><Esc>F[a
    inoremap <buffer> ,ш ![](<++>)<++><Esc>F[a
    inoremap <buffer> ,a [](<++>)<++><Esc>F[a
    inoremap <buffer> ,ф [](<++>)<++><Esc>F[a
    inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
    inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
    inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
    inoremap <buffer> ,l --------<Enter>
    inoremap <buffer> ,д --------<Enter>
    inoremap <buffer> ,p <++>
    inoremap <buffer> ,з <++>

    "
    " inoremap ,h ====<Space><++><Esc>F=hi
    " inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
    " inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
    " inoremap ,c ```<cr>```<cr><cr><esc>2kO
    set nowrap
    endfu
  au FileType vimwiki call MD()

  func! OP()
    inoremap <buffer> <leader>- <Left><Left><Left><Left>.<Left><Left><Left>.<Right><Right><Right><Right><Right><Right><Right>
    inoremap <buffer> ўк копия
    inoremap <buffer> ўюл ЕГРЮЛ
    inoremap <buffer> ўЮЛ Единого государственного реестра юридических лиц
    inoremap <buffer> ўсф Счет-фактура
    inoremap <buffer> ўсврз Справка о стоимости выполненных работ и затрат
    inoremap <buffer> ўдп Договор подряда
    inoremap <buffer> ўдз Договор займа
    inoremap <buffer> ўас Акт сверки
    inoremap <buffer> ўапп Акт приема-передачи
    inoremap <buffer> ўапвр Акт о приемке выполненных работ
    inoremap <buffer> ўдог Договор
    inoremap <buffer> ўдс Дополнительное соглашение
    inoremap <buffer> ўпов Повестка о вызове на допрос свидетеля
    inoremap <buffer> ўпрот Протокол
    inoremap <buffer> ўпдс Протокол допроса свидетеля
    inoremap <buffer> ўпас Паспорт
    inoremap <buffer> ўсп Сопроводительное письмо
    inoremap <buffer> ўопр Определение
    inoremap <buffer> ўппв Постановление о производстве выимки, изъятии документов и предметов
    inoremap <buffer> ўпрпв Протокол о производстве выимки, изъятии документов и предметов
    inoremap <buffer> ўпос0 Протокол осмотра территорий, помещений, документов, предметов
    inoremap <buffer> ўпнм Протокол рассмотрения материалов налоговой проверки
    inoremap <buffer> ўтн Товарная накладная
    inoremap <buffer> ўои Опись изъятых документов и предметов
    inoremap <buffer> ўсо Счет на оплату
    inoremap <buffer> ўтод Требование о предоставлении документов
    inoremap <buffer> ўпп Платежное поручение
    inoremap <buffer> ўау Акт об оказанных услугах
    inoremap <buffer> ўонал Обращение налогоплательщика
    inoremap <buffer> ўот Ответ на требование
    inoremap <buffer> ўтур Табель учета рабочего времени
    inoremap <buffer> ўппр Приказ о приеме работника на работу
    inoremap <buffer> ўпптд Приказ о прекращении трудового договора с работником
    inoremap <buffer> ўподс Поручение о допросе свидетелей
    inoremap <buffer> ўундс Уведомление о невозможности допроса свидетеля и принятых мерах
    inoremap <buffer> ўз Запрос
    inoremap <buffer> ўоз Ответ на запрос
    inoremap <buffer> ў3 03-25/
  endfunc
  com! OP call OP()

"WIKI
	autocmd BufEnter *.wiki set filetype=wiki
	au FileType wiki set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=120 | set expandtab | set autoindent | set fileformat=unix
	function! Wiki()
		" INSERT MAPPINGS
		inoremap <buffer> ,1 =<Space>~<Space>=<Esc>F~cl
		inoremap <buffer> ,2 ==<Space>~<Space>==<Esc>F~cl
		inoremap <buffer> ,3 ===<Space>~<Space>===<Esc>F~cl
		inoremap <buffer> ,b *~*<Space><++><Esc>F~cl
		inoremap <buffer> ,i _~_<Space><++><Esc>F~cl
		inoremap <buffer> ,s ~~#~~<Space><++><Esc>F#cl
		inoremap <buffer> ,c `~`<Space><++><Esc>F~cl
		inoremap <buffer> ,d ~::<Space><++><Esc>F~cl

		" VISUAL MAPPINGS
		vnoremap <buffer> ,xb "zdi**<Left><C-o>"zP<Esc>
		vnoremap <buffer> ,xi "zdi__<Left><C-o>"zP<Esc>
		vnoremap <buffer> ,xc "zdi``<Left><C-o>"zP<Esc>
		vnoremap <buffer> ,xs "zdi~~~~<Left><Left><C-o>"zP<Esc>
		vnoremap <buffer> ,xp "zdi{{{<CR>}}}<Up><C-o>"zp<Esc>

		" NORMAL MAPPINGS
		nnoremap <buffer> ,xb "zdiwi**<Left><C-o>"zP<Esc>
		nnoremap <buffer> ,xi "zdiwi__<Left><C-o>"zP<Esc>
		nnoremap <buffer> ,xc "zdiwi``<Left><C-o>"zP<Esc>
		nnoremap <buffer> ,xs "zdiwi~~~~<Left><Left><C-o>"zP<Esc>
		nnoremap <buffer> ,hh i=<Space>~<Space>=<Esc>F~cl
		nnoremap <buffer> ,h2h i==<Space>~<Space>==<Esc>F~cl
		nnoremap <buffer> ,h3h i===<Space>~<Space>===<Esc>F~cl
		nnoremap <buffer> ,iu i*<Space>
		nnoremap <buffer> ,io i#<Space>
	endfunction
	autocmd Filetype wiki call Wiki()

"Haskell
  au BufEnter *.hs set foldmethod=marker | set foldmarker={{{,}}}

""".xml
	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

""".vim
	au BufNewFile,BufRead *.vim set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=120 | set expandtab | set autoindent | set fileformat=unix

""".py
	au BufNewFile,BufRead *.py set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix
	let python_highlight_all=1

""".js
	au BufNewFile,BufRead *.js set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

""".json
	au BufNewFile,BufRead *.json set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

""".pug
	autocmd BufEnter *.pug set filetype=pug
	au BufNewFile,BufRead *.pug set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=120 | set expandtab | set autoindent | set fileformat=unix

""".css
	au BufNewFile,BufRead *.css,*.scss,*.sass set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

""" .vue
	autocmd BufEnter *.vue set filetype=vue
	au BufNewFile,BufRead *.vue set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

""".hs
	au BufNewFile,BufRead *.hs set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=119 | set expandtab | set autoindent | set fileformat=unix

""".elm
	au BufNewFile,BufRead *.elm set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=119 | set expandtab | set autoindent | set fileformat=unix
