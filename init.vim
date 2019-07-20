let mapleader =" "
let maplocalleader ="-"

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

if ! filereadable(expand('~/.tern-config'))
	echo "Copying tern config to $HOME..."
	silent !cp ~/.config/nvim/.tern-config ~/
endif

call plug#begin('~/.config/nvimphp/plugged')
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'LukeSmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'vim-pandoc/vim-pandoc'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-abolish'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-bufword'
" Plug 'yuki-ycino/ncm2-dictionary'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
Plug 'fgrsnau/ncm2-aspell'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-gtags'
Plug 'ncm2/ncm2-cssomni'
Plug 'jsfaint/gen_tags.vim'
Plug 'ncm2/ncm2-html-subscope'
Plug 'lervag/vimtex'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'StanAngeloff/php.vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'
Plug 'neomake/neomake'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'ludovicchabant/vim-gutentags'
Plug 'bfredl/nvim-miniyank'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'equalsraf/neovim-gui-shim'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'
Plug 'vim-scripts/indentpython.vim'
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'ryanolsonx/vim-lsp-javascript'
call plug#end()

set bg=dark
set laststatus=2
colo gruvbox
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus
set scrolloff=7

" theme switches
nmap <leader>Tgr :colo gruvbox<CR>
nmap <leader>Епк :colo gruvbox<CR>
nmap <leader>Tbl :colo blazer<CR>
nmap <leader>Еид :colo blazer<CR>
nmap <leader>Tbu :colo bubblegum<CR>
nmap <leader>Еиг :colo bubblegum<CR>
nmap <leader>Tda :colo darkzen<CR>
nmap <leader>Евф :colo darkzen<CR>

" Dictionary
vmap <leader>xt y:silent !goldendict "<C-r>0" &<CR>
vmap <leader>че y:silent !goldendict "<C-r>0" &<CR>

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
nmap <leader>fed :e ~/.vimrc<CR>
nmap <leader>аув :e ~/.vimrc<CR>
nmap <leader>feR :source ~/.vimrc<CR>
nmap <leader>ауК :source ~/.vimrc<CR>

" Command mode disabled
nnoremap Q q
nnoremap Й й

" Searching
nmap \ /
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
tnoremap <C-q> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
nmap <leader>al :vs \| :terminal lynx duckduckgo.com<CR>i
nmap <leader>фд :vs \| :terminal lynx duckduckgo.com<CR>i
nmap <leader>ar :vs \| :terminal ranger<CR>i
nmap <leader>фк :vs \| :terminal ranger<CR>i
" nmap <leader>aR :vs \| :terminal ranger -r $HOME/.config/ranger_urxvt<CR>i
" nmap <leader>фК :vs \| :terminal ranger -r $HOME/.config/ranger_urxvt<CR>i

au BufEnter opener :vertical resize 40
tnoremap <leader>ao <C-\><C-n>:q<CR>
tnoremap <leader>фщ <C-\><C-n>:q<CR>

"" PANDOC FOR PARSING WEBSITES
nmap <leader>xp :%!pandoc -f html -t plain --wrap=none<CR>
nmap <leader>xrp :e ++enc=cp1251<CR>\|:set fileencoding=utf8<CR>\|:%!pandoc -f html -t plain --wrap=none<CR>
nmap <leader>xco :e ++enc=cp1251<CR>\|:set fileencoding=utf8<CR>d/<a\sstyle<CR>jdG:w\|:%!pandoc -f html -t plain --wrap=none<CR><CR>gg:%!sed 's/“”//g'<CR>

if has('nvim')
    au TermOpen  * setlocal  norelativenumber nonumber
    au TermClose * setlocal    relativenumber   number | q!
endif

" airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	let g:airline_theme='powerlineish'
	let g:airline#extensions#syntastic#enabled = 1

" neoformat
	let g:neoformat_enabled_python = ['yapf']
	let g:neoformat_enabled_javascript = ['js-beautify']
	let g:neoformat_enabled_html = ['html-beautify']
	let g:neoformat_enabled_css = ['css-beautify']
	let g:neoformat_enabled_c= ['uncrustify']
	let g:neoformat_enabled_markdown= ['prettier']
	let g:neoformat_enabled_vimwiki= ['remark', 'prettier', 'pandoc']

" vim-javascript
	let g:javascript_plugin_jsdoc = 1
	let g:javascript_plugin_ngdoc = 1
	let g:javascript_plugin_flow = 1
	augroup javascript_folding
    	au!
    	au FileType javascript setlocal foldmethod=syntax
	augroup END
	map <leader>tjc :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
	set conceallevel=0
	let g:javascript_conceal_function             = "ƒ"
	let g:javascript_conceal_null                 = "ø"
	let g:javascript_conceal_this                 = "@"
	let g:javascript_conceal_return               = "⇚"
	let g:javascript_conceal_undefined            = "¿"
	let g:javascript_conceal_NaN                  = "ℕ"
	let g:javascript_conceal_prototype            = "¶"
	let g:javascript_conceal_static               = "•"
	let g:javascript_conceal_super                = "Ω"
	let g:javascript_conceal_arrow_function       = "⇒"
	let g:javascript_conceal_noarg_arrow_function = "🞅"
	let g:javascript_conceal_underscore_arrow_function = "🞅"

" fugitive
	nmap <leader>ags :Gstatus<CR>
	nmap <leader>agw :Gw<CR>
	nmap <leader>agW :Gwq<CR>
	nmap <leader>agdv :Gvdiff<CR>
	nmap <leader>agds :Gsdiff<CR>
	nmap <leader>agc :Gcommit<CR>
	nmap <leader>agb :Gblame<CR>

" miniyank
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

" fzf
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

" ack.vim
	let g:ackprg = 'ag --vimgrep'

" gutentags
	let g:gutentags_enabled=0

" neomake
	" Full config: when writing or reading a buffer, and on changes in insert and
	" normal mode (after 1s; no delay when writing).
	call neomake#configure#automake('nrwi', 500)

" ncm2
	" enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()
	au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'vimtex',
            \ 'priority': 1,
            \ 'subscope_enable': 1,
            \ 'complete_length': 1,
            \ 'scope': ['tex'],
            \ 'matcher': {'name': 'combine',
            \           'matchers': [
            \               {'name': 'abbrfuzzy', 'key': 'menu'},
            \               {'name': 'prefix', 'key': 'word'},
            \           ]},
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
	" IMPORTANT: :help Ncm2PopupOpen for more information
	set completeopt=noinsert,menuone,noselect

	" c-j c-k for moving in snippet
	" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
	let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
	let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
	let g:UltiSnipsRemoveSelectModeMappings = 0

" tagbar
	nmap <F8> :TagbarToggle<CR>

" snippets
	" NO Tab with YCM
	" let g:UltiSnipsExpandTrigger="<c-x>"
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="vertical"
	" ActivateAddons vim-snippets ultisinps

" vim-pandoc
	let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
	let g:pandoc#filetypes#pandoc_markdown = 1
	let g:pandoc#spell#enabled = 0
"	let g:pandoc#formatting#mode ="ha"
"	let g:pandoc#folding#level = 1
	let g:pandoc#folding#fold_yaml = 1

" vim-table-mode

	autocmd FileType markdown,rmd TableModeEnable
	let g:table_mode_separator = '|'
	let g:table_mode_corner = '|'
	let g:table_mode_corner_corner = '|'
	let g:table_mode_header_fillchar = '-'

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>tg :Goyo \| set bg=dark \| set linebreak<CR>
	map <leader>еп :Goyo \| set bg=dark \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>cs :setlocal spell! spelllang=en_us,ru_yo<CR>
	map <leader>сы :setlocal spell! spelllang=en_us,ru_yo<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>tf :NERDTreeToggle<CR>
	map <leader>еа :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vimling:
	" nm <leader>d :call ToggleDeadKeys()<CR>
	" imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	" nm <leader>i :call ToggleIPA()<CR>
	" imap <leader>i <esc>:call ToggleIPA()<CR>a
	" nm <leader>q :call ToggleProse()<CR>

" My keymaps
	map <leader>H ^
	map <leader>L $
	map <leader>Р ^
	map <leader>Д $

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader>cS :!clear && shellcheck %<CR>
	map <leader>сЫ :!clear && shellcheck %<CR>

" Open my bibliography file in split
	" map <leader>B :vsp<space>$BIB<CR>
	" map <leader>R :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

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
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	let g:markdown_syntax_conceal = 0
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+p

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

"""LATEX
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
	au BufNewFile,BufRead *.html set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix
	autocmd FileType html,php inoremap ,b <b></b><Esc>FbT>i
	autocmd FileType html,php inoremap ,it <em></em><Esc>FeT>i
	autocmd FileType html,php inoremap ,1 <h1></h1><Esc>2kf<i
	autocmd FileType html,php inoremap ,2 <h2></h2><Esc>2kf<i
	autocmd FileType html,php inoremap ,3 <h3></h3><Esc>2kf<i
	autocmd FileType html,php inoremap ,p <p></p><Esc>0f>a
	autocmd FileType html,php inoremap ,a <a<Space>href=""><++></a><Esc>14hi
	autocmd FileType html,php inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Esc>14hi
	autocmd FileType html,php inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html,php inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html,php inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html,php inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html,php inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html,php inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html,php inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html,php inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html,php inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html,php inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html,php inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html,php inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html,php inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html,php inoremap &<space> &amp;<space>
	autocmd FileType html,php inoremap á &aacute;
	autocmd FileType html,php inoremap é &eacute;
	autocmd FileType html,php inoremap í &iacute;
	autocmd FileType html,php inoremap ó &oacute;
	autocmd FileType html,php inoremap ú &uacute;
	autocmd FileType html,php inoremap ä &auml;
	autocmd FileType html,php inoremap ë &euml;
	autocmd FileType html,php inoremap ï &iuml;
	autocmd FileType html,php inoremap ö &ouml;
	autocmd FileType html,php inoremap ü &uuml;
	autocmd FileType html,php inoremap ã &atilde;
	autocmd FileType html,php inoremap ẽ &etilde;
	autocmd FileType html,php inoremap ĩ &itilde;
	autocmd FileType html,php inoremap õ &otilde;
	autocmd FileType html,php inoremap ũ &utilde;
	autocmd FileType html,php inoremap ñ &ntilde;
	autocmd FileType html,php inoremap à &agrave;
	autocmd FileType html,php inoremap è &egrave;
	autocmd FileType html,php inoremap ì &igrave;
	autocmd FileType html,php inoremap ò &ograve;
	autocmd FileType html,php inoremap ù &ugrave;

""".css
	au BufNewFile,BufRead *.css set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>W yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

""".py
	au BufNewFile,BufRead *.py set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix
	let python_highlight_all=1

""".js
	au BufNewFile,BufRead *.js set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set textwidth=79 | set expandtab | set autoindent | set fileformat=unix

" LANGUAGESERVERS

""".py
	if executable('pyls')
    	" pip install python-language-server
    	au User lsp_setup call lsp#register_server({
        	\ 'name': 'pyls',
        	\ 'cmd': {server_info->['pyls']},
        	\ 'whitelist': ['python'],
        	\ })
	endif

""".json
	if executable('json-languageserver')
    	au User lsp_setup call lsp#register_server({
        	\ 'name': 'json-languageserver',
        	\ 'cmd': {server_info->[&shell, &shellcmdflag, 'json-languageserver --stdio']},
        	\ 'whitelist': ['json'],
        	\ })
	endif

""".html
	if executable('html-languageserver')
    	au User lsp_setup call lsp#register_server({
        	\ 'name': 'html-languageserver',
        	\ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
        	\ 'whitelist': ['html','xhtml','htm'],
        	\ })
	endif

""".css
	if executable('css-languageserver')
    	au User lsp_setup call lsp#register_server({
        	\ 'name': 'css-languageserver',
        	\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        	\ 'whitelist': ['css', 'less', 'sass'],
        	\ })
	endif

""" .vue (+html+css lsp)
	autocmd BufEnter *.vue set filetype=vue

	func! VlsCmd(server_info)
    	let a:server_info.initialization_options = g:initializationOptions
    	return ['vls']
	endfunc

	au User lsp_setup call lsp#register_server({
            	\ 'name': 'vls',
            	\ 'cmd': function('VlsCmd'),
            	\ 'whitelist': ['vue','html','css'],
            	\ })

" load g:initializationOptions for vue language server
python3 << EOF
import json
import os
import vim

config = r"""{
    "initializationOptions": {
        "config": {
            "editor": {
                "fontFamily": "'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'",
                "fontWeight": "normal",
                "fontSize": 14,
                "lineHeight": 0,
                "letterSpacing": 0,
                "lineNumbers": "on",
                "rulers": [],
                "wordSeparators": "`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?",
                "tabSize": 4,
                "insertSpaces": true,
                "detectIndentation": true,
                "roundedSelection": true,
                "scrollBeyondLastLine": true,
                "scrollBeyondLastColumn": 5,
                "smoothScrolling": false,
                "minimap": {
                    "enabled": true,
                    "side": "right",
                    "showSlider": "mouseover",
                    "renderCharacters": true,
                    "maxColumn": 120
                },
                "hover": {
                    "enabled": true,
                    "delay": 300,
                    "sticky": true
                },
                "find": {
                    "seedSearchStringFromSelection": true,
                    "autoFindInSelection": false
                },
                "wordWrap": "off",
                "wordWrapColumn": 80,
                "wrappingIndent": "same",
                "mouseWheelScrollSensitivity": 1,
                "multiCursorModifier": "alt",
                "multiCursorMergeOverlapping": true,
                "quickSuggestions": {
                    "other": true,
                    "comments": false,
                    "strings": false
                },
                "quickSuggestionsDelay": 10,
                "parameterHints": true,
                "autoClosingBrackets": true,
                "formatOnType": false,
                "formatOnPaste": false,
                "autoIndent": true,
                "suggestOnTriggerCharacters": true,
                "acceptSuggestionOnEnter": "on",
                "acceptSuggestionOnCommitCharacter": true,
                "snippetSuggestions": "inline",
                "emptySelectionClipboard": true,
                "wordBasedSuggestions": true,
                "suggestSelection": "recentlyUsed",
                "suggestFontSize": 0,
                "suggestLineHeight": 0,
                "selectionHighlight": true,
                "occurrencesHighlight": true,
                "overviewRulerLanes": 3,
                "overviewRulerBorder": true,
                "cursorBlinking": "blink",
                "mouseWheelZoom": false,
                "cursorStyle": "line",
                "cursorWidth": 0,
                "fontLigatures": false,
                "hideCursorInOverviewRuler": false,
                "renderWhitespace": "none",
                "renderControlCharacters": false,
                "renderIndentGuides": true,
                "highlightActiveIndentGuide": true,
                "renderLineHighlight": "line",
                "codeLens": true,
                "folding": true,
                "foldingStrategy": "auto",
                "showFoldingControls": "mouseover",
                "matchBrackets": true,
                "glyphMargin": true,
                "useTabStops": true,
                "trimAutoWhitespace": true,
                "stablePeek": false,
                "dragAndDrop": true,
                "accessibilitySupport": "auto",
                "showUnused": true,
                "links": true,
                "colorDecorators": true,
                "lightbulb": {
                    "enabled": true
                },
                "codeActionsOnSave": {},
                "codeActionsOnSaveTimeout": 750,
                "selectionClipboard": true,
                "largeFileOptimizations": true,
                "tabCompletion": false,
                "tokenColorCustomizations": {},
                "formatOnSave": false,
                "formatOnSaveTimeout": 750
            },
            "diffEditor": {
                "renderSideBySide": true,
                "ignoreTrimWhitespace": true,
                "renderIndicators": true
            },
            "http": {
                "proxy": "",
                "proxyStrictSSL": true,
                "proxyAuthorization": null
            },
            "telemetry": {
                "enableTelemetry": true,
                "enableCrashReporter": true
            },
            "workbench": {
                "list": {
                    "multiSelectModifier": "ctrlCmd",
                    "openMode": "singleClick"
                },
                "tree": {
                    "horizontalScrolling": false
                },
                "statusBar": {
                    "feedback": {
                        "visible": true
                    },
                    "visible": true
                },
                "startupEditor": "welcomePage",
                "colorTheme": "Default Dark+",
                "iconTheme": "vs-seti",
                "colorCustomizations": {},
                "editor": {
                    "showTabs": true,
                    "labelFormat": "default",
                    "tabCloseButton": "right",
                    "tabSizing": "fit",
                    "showIcons": true,
                    "enablePreview": true,
                    "enablePreviewFromQuickOpen": true,
                    "closeOnFileDelete": true,
                    "openPositioning": "right",
                    "openSideBySideDirection": "right",
                    "closeEmptyGroups": true,
                    "revealIfOpen": false
                },
                "commandPalette": {
                    "history": 50,
                    "preserveInput": false
                },
                "quickOpen": {
                    "closeOnFocusLost": true
                },
                "settings": {
                    "openDefaultSettings": true,
                    "enableNaturalLanguageSearch": true,
                    "settingsSearchTocBehavior": "hide",
                    "tocVisible": true
                },
                "sideBar": {
                    "location": "left"
                },
                "panel": {
                    "defaultLocation": "bottom"
                },
                "activityBar": {
                    "visible": true
                },
                "view": {
                    "alwaysShowHeaderActions": false
                },
                "tips": {
                    "enabled": true
                }
            },
            "problems": {
                "decorations": {
                    "enabled": true
                },
                "autoReveal": true
            },
            "keyboard": {
                "dispatch": "code"
            },
            "debug": {
                "allowBreakpointsEverywhere": false,
                "openExplorerOnEnd": false,
                "inlineValues": false,
                "toolBarLocation": "floating",
                "showInStatusBar": "onFirstSessionStart",
                "internalConsoleOptions": "openOnFirstSessionStart",
                "openDebug": "openOnFirstSessionStart",
                "enableAllHovers": false
            },
            "launch": {
                "configurations": [],
                "compounds": []
            },
            "outline": {
                "icons": true,
                "problems": {
                    "enabled": true,
                    "colors": true,
                    "badges": true
                }
            },
            "scm": {
                "alwaysShowProviders": false,
                "diffDecorations": "all",
                "diffDecorationsGutterWidth": 3
            },
            "window": {
                "openFilesInNewWindow": "off",
                "openFoldersInNewWindow": "default",
                "openWithoutArgumentsInNewWindow": "on",
                "restoreWindows": "one",
                "restoreFullscreen": false,
                "zoomLevel": 0,
                "title": "${dirty}${activeEditorShort}${separator}${rootName}${separator}${appName}",
                "newWindowDimensions": "default",
                "closeWhenEmpty": false,
                "menuBarVisibility": "default",
                "enableMenuBarMnemonics": true,
                "titleBarStyle": "native"
            },
            "zenMode": {
                "fullScreen": true,
                "centerLayout": true,
                "hideTabs": true,
                "hideStatusBar": true,
                "hideActivityBar": true,
                "restore": false
            },
            "files": {
                "exclude": {
                    "**/.git": true,
                    "**/.svn": true,
                    "**/.hg": true,
                    "**/CVS": true,
                    "**/.DS_Store": true
                },
                "associations": {},
                "encoding": "utf8",
                "autoGuessEncoding": false,
                "eol": "\n",
                "trimTrailingWhitespace": false,
                "insertFinalNewline": false,
                "trimFinalNewlines": false,
                "autoSave": "off",
                "autoSaveDelay": 1000,
                "watcherExclude": {
                    "**/.git/objects/**": true,
                    "**/.git/subtree-cache/**": true,
                    "**/node_modules/**": true
                },
                "hotExit": "onExit",
                "useExperimentalFileWatcher": false,
                "defaultLanguage": "",
                "maxMemoryForLargeFilesMB": 4096
            },
            "explorer": {
                "openEditors": {
                    "visible": 9
                },
                "autoReveal": true,
                "enableDragAndDrop": true,
                "confirmDragAndDrop": true,
                "confirmDelete": true,
                "sortOrder": "default",
                "decorations": {
                    "colors": true,
                    "badges": true
                }
            },
            "search": {
                "exclude": {
                    "**/node_modules": true,
                    "**/bower_components": true
                },
                "useRipgrep": true,
                "useIgnoreFiles": true,
                "quickOpen": {
                    "includeSymbols": false
                },
                "followSymlinks": true,
                "smartCase": false,
                "location": "sidebar"
            },
            "terminal": {
                "integrated": {
                    "shell": {
                        "linux": "/bin/bash",
                        "osx": "/bin/bash",
                        "windows": "cmd.exe"
                    },
                    "shellArgs": {
                        "linux": [],
                        "osx": [
                            "-l"
                        ],
                        "windows": []
                    },
                    "macOptionIsMeta": false,
                    "copyOnSelection": false,
                    "drawBoldTextInBrightColors": true,
                    "fontFamily": "",
                    "fontSize": 14,
                    "letterSpacing": 0,
                    "lineHeight": 1,
                    "fontWeight": "normal",
                    "fontWeightBold": "bold",
                    "cursorBlinking": false,
                    "cursorStyle": "block",
                    "scrollback": 1000,
                    "setLocaleVariables": false,
                    "rendererType": "auto",
                    "rightClickBehavior": "default",
                    "cwd": "",
                    "confirmOnExit": false,
                    "enableBell": false,
                    "commandsToSkipShell": [
                        "editor.action.toggleTabFocusMode",
                        "workbench.action.debug.continue",
                        "workbench.action.debug.pause",
                        "workbench.action.debug.restart",
                        "workbench.action.debug.run",
                        "workbench.action.debug.start",
                        "workbench.action.debug.stepInto",
                        "workbench.action.debug.stepOut",
                        "workbench.action.debug.stepOver",
                        "workbench.action.debug.stop",
                        "workbench.action.firstEditorInGroup",
                        "workbench.action.focusActiveEditorGroup",
                        "workbench.action.focusEighthEditorGroup",
                        "workbench.action.focusFifthEditorGroup",
                        "workbench.action.focusFirstEditorGroup",
                        "workbench.action.focusFourthEditorGroup",
                        "workbench.action.focusLastEditorGroup",
                        "workbench.action.focusSecondEditorGroup",
                        "workbench.action.focusSeventhEditorGroup",
                        "workbench.action.focusSixthEditorGroup",
                        "workbench.action.focusThirdEditorGroup",
                        "workbench.action.lastEditorInGroup",
                        "workbench.action.navigateDown",
                        "workbench.action.navigateLeft",
                        "workbench.action.navigateRight",
                        "workbench.action.navigateUp",
                        "workbench.action.openNextRecentlyUsedEditorInGroup",
                        "workbench.action.openPreviousRecentlyUsedEditorInGroup",
                        "workbench.action.quickOpen",
                        "workbench.action.quickOpenPreviousEditor",
                        "workbench.action.quickOpenView",
                        "workbench.action.showCommands",
                        "workbench.action.tasks.build",
                        "workbench.action.tasks.restartTask",
                        "workbench.action.tasks.runTask",
                        "workbench.action.tasks.showLog",
                        "workbench.action.tasks.showTasks",
                        "workbench.action.tasks.terminate",
                        "workbench.action.tasks.test",
                        "workbench.action.terminal.clear",
                        "workbench.action.terminal.clearSelection",
                        "workbench.action.terminal.copySelection",
                        "workbench.action.terminal.deleteWordLeft",
                        "workbench.action.terminal.deleteWordRight",
                        "workbench.action.terminal.focus",
                        "workbench.action.terminal.focusAtIndex1",
                        "workbench.action.terminal.focusAtIndex2",
                        "workbench.action.terminal.focusAtIndex3",
                        "workbench.action.terminal.focusAtIndex4",
                        "workbench.action.terminal.focusAtIndex5",
                        "workbench.action.terminal.focusAtIndex6",
                        "workbench.action.terminal.focusAtIndex7",
                        "workbench.action.terminal.focusAtIndex8",
                        "workbench.action.terminal.focusAtIndex9",
                        "workbench.action.terminal.focusFindWidget",
                        "workbench.action.terminal.focusNext",
                        "workbench.action.terminal.focusNextPane",
                        "workbench.action.terminal.focusPrevious",
                        "workbench.action.terminal.focusPreviousPane",
                        "workbench.action.terminal.hideFindWidget",
                        "workbench.action.terminal.kill",
                        "workbench.action.terminal.moveToLineEnd",
                        "workbench.action.terminal.moveToLineStart",
                        "workbench.action.terminal.new",
                        "workbench.action.terminal.newInActiveWorkspace",
                        "workbench.action.terminal.paste",
                        "workbench.action.terminal.resizePaneDown",
                        "workbench.action.terminal.resizePaneLeft",
                        "workbench.action.terminal.resizePaneRight",
                        "workbench.action.terminal.resizePaneUp",
                        "workbench.action.terminal.runActiveFile",
                        "workbench.action.terminal.runSelectedText",
                        "workbench.action.terminal.scrollDown",
                        "workbench.action.terminal.scrollDownPage",
                        "workbench.action.terminal.scrollToBottom",
                        "workbench.action.terminal.scrollToNextCommand",
                        "workbench.action.terminal.scrollToPreviousCommand",
                        "workbench.action.terminal.scrollToTop",
                        "workbench.action.terminal.scrollUp",
                        "workbench.action.terminal.scrollUpPage",
                        "workbench.action.terminal.selectAll",
                        "workbench.action.terminal.selectToNextCommand",
                        "workbench.action.terminal.selectToNextLine",
                        "workbench.action.terminal.selectToPreviousCommand",
                        "workbench.action.terminal.selectToPreviousLine",
                        "workbench.action.terminal.split",
                        "workbench.action.terminal.splitInActiveWorkspace",
                        "workbench.action.terminal.toggleTerminal",
                        "workbench.action.togglePanel"
                    ],
                    "env": {
                        "osx": {},
                        "linux": {},
                        "windows": {}
                    },
                    "showExitAlert": true,
                    "experimentalRestore": false,
                    "experimentalTextureCachingStrategy": "static"
                },
                "explorerKind": "integrated",
                "external": {
                    "windowsExec": "C:\\Windows\\System32\\cmd.exe",
                    "osxExec": "Terminal.app",
                    "linuxExec": "x-terminal-emulator"
                }
            },
            "extensions": {
                "autoUpdate": true,
                "ignoreRecommendations": false,
                "showRecommendationsOnlyOnDemand": false,
                "closeExtensionDetailsOnViewChange": false
            },
            "css": {
                "validate": true,
                "colorDecorators": {
                    "enable": true
                },
                "lint": {
                    "compatibleVendorPrefixes": "ignore",
                    "vendorPrefix": "warning",
                    "duplicateProperties": "ignore",
                    "emptyRules": "warning",
                    "importStatement": "ignore",
                    "boxModel": "ignore",
                    "universalSelector": "ignore",
                    "zeroUnits": "ignore",
                    "fontFaceProperties": "warning",
                    "hexColorLength": "error",
                    "argumentsInColorFunction": "error",
                    "unknownProperties": "warning",
                    "ieHack": "ignore",
                    "unknownVendorSpecificProperties": "ignore",
                    "propertyIgnoredDueToDisplay": "warning",
                    "important": "ignore",
                    "float": "ignore",
                    "idSelector": "ignore",
                    "unknownAtRules": "warning"
                },
                "trace": {
                    "server": "off"
                }
            },
            "scss": {
                "validate": true,
                "colorDecorators": {
                    "enable": true
                },
                "lint": {
                    "compatibleVendorPrefixes": "ignore",
                    "vendorPrefix": "warning",
                    "duplicateProperties": "ignore",
                    "emptyRules": "warning",
                    "importStatement": "ignore",
                    "boxModel": "ignore",
                    "universalSelector": "ignore",
                    "zeroUnits": "ignore",
                    "fontFaceProperties": "warning",
                    "hexColorLength": "error",
                    "argumentsInColorFunction": "error",
                    "unknownProperties": "warning",
                    "ieHack": "ignore",
                    "unknownVendorSpecificProperties": "ignore",
                    "propertyIgnoredDueToDisplay": "warning",
                    "important": "ignore",
                    "float": "ignore",
                    "idSelector": "ignore"
                }
            },
            "less": {
                "validate": true,
                "colorDecorators": {
                    "enable": true
                },
                "lint": {
                    "compatibleVendorPrefixes": "ignore",
                    "vendorPrefix": "warning",
                    "duplicateProperties": "ignore",
                    "emptyRules": "warning",
                    "importStatement": "ignore",
                    "boxModel": "ignore",
                    "universalSelector": "ignore",
                    "zeroUnits": "ignore",
                    "fontFaceProperties": "warning",
                    "hexColorLength": "error",
                    "argumentsInColorFunction": "error",
                    "unknownProperties": "warning",
                    "ieHack": "ignore",
                    "unknownVendorSpecificProperties": "ignore",
                    "propertyIgnoredDueToDisplay": "warning",
                    "important": "ignore",
                    "float": "ignore",
                    "idSelector": "ignore"
                }
            },
            "emmet": {
                "showExpandedAbbreviation": "always",
                "showAbbreviationSuggestions": true,
                "includeLanguages": {},
                "variables": {},
                "syntaxProfiles": {},
                "excludeLanguages": [
                    "markdown"
                ],
                "extensionsPath": null,
                "triggerExpansionOnTab": false,
                "preferences": {},
                "showSuggestionsAsSnippets": false,
                "optimizeStylesheetParsing": true
            },
            "git": {
                "enabled": true,
                "path": null,
                "autoRepositoryDetection": true,
                "autorefresh": true,
                "autofetch": false,
                "confirmSync": true,
                "countBadge": "all",
                "checkoutType": "all",
                "ignoreLegacyWarning": false,
                "ignoreMissingGitWarning": false,
                "ignoreLimitWarning": false,
                "defaultCloneDirectory": null,
                "enableSmartCommit": false,
                "enableCommitSigning": false,
                "decorations": {
                    "enabled": true
                },
                "promptToSaveFilesBeforeCommit": false,
                "showInlineOpenFileAction": true,
                "inputValidation": "warn",
                "detectSubmodules": true,
                "detectSubmodulesLimit": 10
            },
            "grunt": {
                "autoDetect": "on"
            },
            "gulp": {
                "autoDetect": "on"
            },
            "html": {
                "format": {
                    "enable": true,
                    "wrapLineLength": 120,
                    "unformatted": "wbr",
                    "contentUnformatted": "pre,code,textarea",
                    "indentInnerHtml": false,
                    "preserveNewLines": true,
                    "maxPreserveNewLines": null,
                    "indentHandlebars": false,
                    "endWithNewline": false,
                    "extraLiners": "head, body, /html",
                    "wrapAttributes": "auto"
                },
                "suggest": {
                    "angular1": true,
                    "ionic": true,
                    "html5": true
                },
                "validate": {
                    "scripts": true,
                    "styles": true
                },
                "autoClosingTags": true,
                "trace": {
                    "server": "off"
                }
            },
            "jake": {
                "autoDetect": "on"
            },
            "json": {
                "schemas": [],
                "format": {
                    "enable": true
                },
                "trace": {
                    "server": "off"
                },
                "colorDecorators": {
                    "enable": true
                }
            },
            "markdown": {
                "styles": [],
                "previewFrontMatter": "hide",
                "preview": {
                    "breaks": false,
                    "linkify": true,
                    "fontFamily": "-apple-system, BlinkMacSystemFont, 'Segoe WPC', 'Segoe UI', 'HelveticaNeue-Light', 'Ubuntu', 'Droid Sans', sans-serif",
                    "fontSize": 14,
                    "lineHeight": 1.6,
                    "scrollPreviewWithEditor": true,
                    "scrollPreviewWithEditorSelection": true,
                    "markEditorSelection": true,
                    "scrollEditorWithPreview": true,
                    "doubleClickToSwitchToEditor": true
                },
                "trace": "off"
            },
            "merge-conflict": {
                "codeLens": {
                    "enabled": true
                },
                "decorators": {
                    "enabled": true
                }
            },
            "npm": {
                "autoDetect": "on",
                "runSilent": false,
                "packageManager": "npm",
                "exclude": "",
                "enableScriptExplorer": false,
                "scriptExplorerAction": "open"
            },
            "php": {
                "suggest": {
                    "basic": true
                },
                "validate": {
                    "enable": true,
                    "executablePath": null,
                    "run": "onSave"
                }
            },
            "searchRipgrep": {
                "enable": false
            },
            "typescript": {
                "tsdk": null,
                "disableAutomaticTypeAcquisition": false,
                "npm": null,
                "check": {
                    "npmIsInstalled": true
                },
                "referencesCodeLens": {
                    "enabled": false
                },
                "implementationsCodeLens": {
                    "enabled": false
                },
                "tsserver": {
                    "log": "off",
                    "pluginPaths": [],
                    "trace": "off"
                },
                "useCodeSnippetsOnMethodSuggest": false,
                "reportStyleChecksAsWarnings": true,
                "validate": {
                    "enable": true
                },
                "format": {
                    "enable": true,
                    "insertSpaceAfterCommaDelimiter": true,
                    "insertSpaceAfterConstructor": false,
                    "insertSpaceAfterSemicolonInForStatements": true,
                    "insertSpaceBeforeAndAfterBinaryOperators": true,
                    "insertSpaceAfterKeywordsInControlFlowStatements": true,
                    "insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
                    "insertSpaceBeforeFunctionParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
                    "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
                    "insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces": false,
                    "insertSpaceAfterTypeAssertion": false,
                    "placeOpenBraceOnNewLineForFunctions": false,
                    "placeOpenBraceOnNewLineForControlBlocks": false
                },
                "tsc": {
                    "autoDetect": "on"
                },
                "quickSuggestionsForPaths": true,
                "autoImportSuggestions": {
                    "enabled": true
                },
                "locale": null,
                "suggestionActions": {
                    "enabled": true
                },
                "preferences": {
                    "quoteStyle": "auto",
                    "importModuleSpecifier": "auto"
                },
                "showUnused": true,
                "updateImportsOnFileMove": {
                    "enabled": "prompt"
                }
            },
            "javascript": {
                "referencesCodeLens": {
                    "enabled": false
                },
                "validate": {
                    "enable": true
                },
                "format": {
                    "enable": true,
                    "insertSpaceAfterCommaDelimiter": true,
                    "insertSpaceAfterConstructor": false,
                    "insertSpaceAfterSemicolonInForStatements": true,
                    "insertSpaceBeforeAndAfterBinaryOperators": true,
                    "insertSpaceAfterKeywordsInControlFlowStatements": true,
                    "insertSpaceAfterFunctionKeywordForAnonymousFunctions": true,
                    "insertSpaceBeforeFunctionParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets": false,
                    "insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": true,
                    "insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces": false,
                    "insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces": false,
                    "placeOpenBraceOnNewLineForFunctions": false,
                    "placeOpenBraceOnNewLineForControlBlocks": false
                },
                "implicitProjectConfig": {
                    "checkJs": false,
                    "experimentalDecorators": false
                },
                "nameSuggestions": true,
                "suggestionActions": {
                    "enabled": true
                },
                "preferences": {
                    "quoteStyle": "auto",
                    "importModuleSpecifier": "auto"
                },
                "showUnused": true,
                "updateImportsOnFileMove": {
                    "enabled": "prompt"
                }
            },
            "jsDocCompletion": {
                "enabled": true
            },
            "vetur": {
                "colorDecorators": {
                    "enable": true
                },
                "completion": {
                    "autoImport": true,
                    "useScaffoldSnippets": true
                },
                "grammar": {
                    "customBlocks": {
                        "docs": "md",
                        "i18n": "json"
                    }
                },
                "validation": {
                    "template": true,
                    "style": true,
                    "script": true
                },
                "format": {
                    "defaultFormatter": {
                        "html": "none",
                        "css": "prettier",
                        "postcss": "prettier",
                        "scss": "prettier",
                        "less": "prettier",
                        "stylus": "stylus-supremacy",
                        "js": "prettier",
                        "ts": "prettier"
                    },
                    "defaultFormatterOptions": {
                        "js-beautify-html": {}
                    },
                    "styleInitialIndent": false,
                    "scriptInitialIndent": false
                },
                "trace": {
                    "server": "verbose"
                }
            },
            "[git-commit]": {
                "editor.rulers": [
                    72
                ]
            },
            "[go]": {
                "editor.insertSpaces": false
            },
            "[json]": {
                "editor.quickSuggestions": {
                    "strings": true
                }
            },
            "[makefile]": {
                "editor.insertSpaces": false
            },
            "[markdown]": {
                "editor.wordWrap": "on",
                "editor.quickSuggestions": false
            },
            "[yaml]": {
                "editor.insertSpaces": true,
                "editor.tabSize": 2,
                "editor.autoIndent": false
            }
        }
    }
}
"""

config = json.loads(config)
vim.vars['initializationOptions'] = config['initializationOptions']
EOF
