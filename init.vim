let mapleader =" "
let maplocalleader ="-"

" Original langmap for russian
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" Langmap with more keys
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖЭБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:\"\<\>,фисвуапршолдьтщзйкыегмцчняжэ;abcdefghijklmnopqrstuvwxyz\;'

" Dvorak langmap
" set langmap=ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;\\,"\<\>PYFGCRL?+AOEUIDHTNS_:QJKXBMWVZ,йцукенгшщзхъфывапролджэячсмитьбю\.;\'\,\.pyfgcrl/=aoeuidhtns-\;qjkxbmwvz

set keymap=russian-dvorak
nnoremap <C-q> /<C-^><C-c>
vnoremap <C-q> /<C-^><C-c>
inoremap <C-q> <C-^>
cmap <C-q> <C-^>
set ttimeoutlen=50
set iminsert=0
set imsearch=-1

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

set lazyredraw
set ttyfast
set synmaxcol=200
set regexpengine=1

set termguicolors
set t_Co=256
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

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale'
let g:ale_set_balloons = 1
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
" Visuals
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'itchyny/lightline.vim'
	let g:lightline = {
			\ 'colorscheme' : 'deus',
			\ 'active' : {
			\ 	'left' : [ [ 'mode', 'paste' ],
			\		[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function' : {
			\	'gitbranch' : 'fugitive#head'
			\ },
			\ }
Plug 'morhetz/gruvbox'
  let g:gruvbox_italic = 1
  let g:gruvbox_termcolors = 256
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_contrast_light = 'hard'
Plug 'iCyMind/NeoSolarized'
	let g:neosolarized_contrast = 'high'
	let g:neosolarized_vertSplitBgTrans = 1
	let g:neosolarized_bold = 1
	let g:neosolarized_underline = 1
	let g:neosolarized_italic = 1
Plug 'NLKNguyen/papercolor-theme'
	" let g:PaperColor_Theme_Options = {
	"   \   'theme': {
	"   \     'default': {
	"   \       'transparent_background': 1
	"   \     }
	"   \   }
	"   \ }
Plug 'nathanaelkane/vim-indent-guides'
	let g:indent_guides_enable_on_vim_startup = 1

" Syntax
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
Plug 'vim-pandoc/vim-pandoc'
  " map aS
  " map iS
  " map <localleader>i
  " map <localleader>b
  " map <localleader>`
  " map <localleader>~~
  " map <localleader>^
  " map <localleader>_
  " map <localleader>#
  " map <localleader>hd
  " map <localleader>hn
  " map <localleader>hb
  " map <localleader>hh
  " map <localleader>hp
  " map <localleader>hsn
  " map <localleader>hsb
  " map <localleader>hcf
  " map <localleader>hcl
  " map <localleader>hcn
  " map <localleader>nr
  " map <localleader>rg
  " map <localleader>rb
  " map <localleader>gl
  " map <localleader>sl
  " map <localleader>gb
  " map <localleader>gB
  " map <localleader>ln
  " map <localleader>lp
  " map <localleader>ll
  " map <localleader>llp
  " map <localleader>lsn
  " map <localleader>lsp
  " map <localleader>lcf
  " map <localleader>lcl
  " map <localleader>lcn
Plug 'vim-pandoc/vim-pandoc-syntax'
	let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
	let g:pandoc#filetypes#pandoc_markdown = 1
	let g:pandoc#spell#enabled = 0
"	let g:pandoc#formatting#mode ="ha"
"	let g:pandoc#folding#level = 1
	let g:pandoc#folding#fold_yaml = 1
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
" Plug 'Teu5us/vim-plugin-ruscmd'
Plug 'easymotion/vim-easymotion'
	map <leader>jw <Plug>(easymotion-bd-w)
	map <leader>оц <Plug>(easymotion-bd-w)
	map <leader>jW <Plug>(easymotion-overwin-w)
	map <leader>оЦ <Plug>(easymotion-overwin-w)

" Else
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'equalsraf/neovim-gui-shim'
Plug 'prabirshrestha/async.vim'

" Commands
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
	" let g:table_mode_corner_corner='+'
	" let g:table_mode_corner = '+'
	" let g:table_mode_header_fillchar='='
Plug 'jsfaint/gen_tags.vim'
Plug 'ludovicchabant/vim-gutentags'
	let g:gutentags_enabled=0
Plug 'moll/vim-bbye'
Plug 'bfredl/nvim-miniyank'
	map p <Plug>(miniyank-autoput)
	map P <Plug>(miniyank-autoPut)
	map <leader>p <Plug>(miniyank-startput)
	map <leader>P <Plug>(miniyank-startPut)
	map <leader>n <Plug>(miniyank-cycle)
	map <leader>N <Plug>(miniyank-cycleback)
	map <Leader>c <Plug>(miniyank-tochar)
	map <Leader>l <Plug>(miniyank-toline)
	map <Leader>b <Plug>(miniyank-toblock)
	let g:miniyank_filename = $HOME."/.miniyank.mpack"
	map з <Plug>(miniyank-autoput)
	map З <Plug>(miniyank-autoPut)
	map <leader>з <Plug>(miniyank-startput)
	map <leader>З <Plug>(miniyank-startPut)
	map <leader>т <Plug>(miniyank-cycle)
	map <leader>Т <Plug>(miniyank-cycleback)
	map <Leader>с <Plug>(miniyank-tochar)
	map <Leader>д <Plug>(miniyank-toline)
	map <Leader>и <Plug>(miniyank-toblock)
" Unused
" Plug 'neomake/neomake'
" 	" Full config: when writing or reading a buffer, and on changes in insert and
" 	" normal mode (after 1s; no delay when writing).
" 	call neomake#configure#automake('nrwi', 500)
" Plug 'LukeSmithxyz/vimling'
	" nm <leader>d :call ToggleDeadKeys()<CR>
	" imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	" nm <leader>i :call ToggleIPA()<CR>
	" imap <leader>i <esc>:call ToggleIPA()<CR>a
	" nm <leader>q :call ToggleProse()<CR>


" Searching
Plug 'mileszs/ack.vim'
	let g:ackprg = 'ag --vimgrep'
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
	let g:coc_global_extensions = ['coc-lists', 'coc-python', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-json', 'coc-vetur', 'coc-texlab', 'coc-emmet', 'coc-snippets', 'coc-ultisnips']
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
	autocmd CursorHold * silent call CocActionAsync('highlight')
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
colo gruvbox

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

" Dictionary
	vmap <leader>xx y:silent !goldendict "<C-r>0" &<CR>
	vmap <leader>чч y:silent !goldendict "<C-r>0" &<CR>
	vmap <leader>oe y:!setsid --fork st -g 130x40 -e mtran e -l <C-r>0<CR><C-c>
	vmap <leader>щу y:!setsid --fork st -g 130x40 -e mtran e -l <C-r>0<CR><C-c>
	vmap <leader>og y:!setsid --fork st -g 130x40 -e mtran g -l <C-r>0<CR><C-c>
	vmap <leader>щп y:!setsid --fork st -g 130x40 -e mtran g -l <C-r>0<CR><C-c>
	" vmap <leader>ole y:!setsid --fork st -g 130x40 -e lingvo e <C-r>0<CR><C-c>
	" vmap <leader>щду y:!setsid --fork st -g 130x40 -e lingvo e <C-r>0<CR><C-c>
	" vmap <leader>old y:!setsid --fork st -g 130x40 -e lingvo d <C-r>0<CR><C-c>
	" vmap <leader>щдв y:!setsid --fork st -g 130x40 -e lingvo d <C-r>0<CR><C-c>
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
	nnoremap Йй :q<CR>

" break line
	nmap Y i<C-m><C-[>
	nmap Н i<C-m><C-[>

" Searching
	" nmap \ /
	nmap <leader>saf :Ack!  <c-r>%<c-b><S-Right><Right>''<Left>
	nmap <leader>ыфа :Ack!  <c-r>%<c-b><S-Right><Right>''<Left>
	nmap <leader>saw :AckWindow!  <c-r>%<c-b><S-Right><Right>''<Left>
	nmap <leader>ыфц :AckWindow!  <c-r>%<c-b><S-Right><Right>''<Left>
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
	nmap <leader>sb :buffers<CR>:buf<C-b>
	nmap <leader>ыи :buffers<CR>:buf<C-b>
	nmap <leader>st :tabs<CR>
	nmap <leader>ые :tabs<CR>

" Wrap toggles
	nmap <leader>tw :set wrap<CR>
	nmap <leader>ец :set wrap<CR>
	nmap <leader>tW :set nowrap<CR>
	nmap <leader>еЦ :set nowrap<CR>

" Apps
	nmap <leader>at :vs \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
	nmap <leader>фе :vs \| :terminal<CR>:file term<CR>:set  norelativenumber nonumber<CR>i
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

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
  set omnifunc=syntaxcomplete#Complete
	syntax on
	set encoding=utf-8
	set number relativenumber
	" set number
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>agg :Goyo \| set bg=dark \| set linebreak<CR>
	map <leader>фпп :Goyo \| set bg=dark \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>cs :setlocal spell! spelllang=en_us,ru_yo<CR>
	map <leader>сы :setlocal spell! spelllang=en_us,ru_yo<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

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
  nmap <leader>S :%s##g<Left><Left><Left>
  nmap <leader>Ы :%s##g<Left><Left><Left>
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

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	" let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	let g:markdown_syntax_conceal = 0
  let g:vimwiki_global_ext = 0
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

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

" Navigating with guides
	inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	map <leader><Tab> <Esc>/<++><Enter>"_c4l

	inoremap <leader>\ <Esc>/<+-><Enter>"_c4l
	vnoremap <leader>\ <Esc>/<+-><Enter>"_c4l
	map <leader>\ <Esc>/<+-><Enter>"_c4l

"""LATEX
	au BufNewFile,BufRead *.tex set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix
	au InsertLeave *.tex w
	" Word count:
	" autocmd FileType tex map <leader>W :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
	au BufNewFile,BufRead *.html set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=150 | set expandtab | set autoindent | set fileformat=unix
	autocmd FileType html inoremap ,b <b></b><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Esc>0f>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Esc>14hi
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
	autocmd FileType html inoremap ù &ugrave;

""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	au FileType markdown,pandoc set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=120 | set expandtab | set autoindent | set fileformat=unix
	" autocmd BufEnter *.md,*.rmd set filetype=markdown
	autocmd Filetype markdown,rmd map <leader>W yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd map <leader>Ц yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,т ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,и ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,c **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,с **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,ы ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,у **<++><Esc>F*i
	" autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,ш ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,ф [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype markdown,rmd inoremap ,д --------<Enter>
	autocmd Filetype markdown,rmd inoremap ,p <++>
	autocmd Filetype markdown,rmd inoremap ,з <++>
	" autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	" autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	" autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

"WIKI
	autocmd BufEnter *.wiki set filetype=wiki
	au FileType wiki set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=120 | set expandtab | set autoindent | set fileformat=unix
	function! Wiki()
		" INSERT MAPPINGS
		inoremap ,1 =<Space>~<Space>=<Esc>F~cl
		inoremap ,2 ==<Space>~<Space>==<Esc>F~cl
		inoremap ,3 ===<Space>~<Space>===<Esc>F~cl
		inoremap ,b *~*<Space><++><Esc>F~cl
		inoremap ,i _~_<Space><++><Esc>F~cl
		inoremap ,s ~~#~~<Space><++><Esc>F#cl
		inoremap ,c `~`<Space><++><Esc>F~cl
		inoremap ,d ~::<Space><++><Esc>F~cl

		" VISUAL MAPPINGS
		vnoremap ,xb "zdi**<Left><C-o>"zP<Esc>
		vnoremap ,xi "zdi__<Left><C-o>"zP<Esc>
		vnoremap ,xc "zdi``<Left><C-o>"zP<Esc>
		vnoremap ,xs "zdi~~~~<Left><Left><C-o>"zP<Esc>
		vnoremap ,xp "zdi{{{<CR>}}}<Up><C-o>"zp<Esc>

		" NORMAL MAPPINGS
		nnoremap ,xb "zdiwi**<Left><C-o>"zP<Esc>
		nnoremap ,xi "zdiwi__<Left><C-o>"zP<Esc>
		nnoremap ,xc "zdiwi``<Left><C-o>"zP<Esc>
		nnoremap ,xs "zdiwi~~~~<Left><Left><C-o>"zP<Esc>
		nnoremap ,hh i=<Space>~<Space>=<Esc>F~cl
		nnoremap ,h2h i==<Space>~<Space>==<Esc>F~cl
		nnoremap ,h3h i===<Space>~<Space>===<Esc>F~cl
		nnoremap ,iu i*<Space>
		nnoremap ,io i#<Space>
	endfunction
	autocmd Filetype wiki call Wiki()

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
	au BufNewFile,BufRead *.hs set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

""".elm
	au BufNewFile,BufRead *.elm set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix
