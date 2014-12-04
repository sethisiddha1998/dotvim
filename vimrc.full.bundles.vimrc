

set nocompatible              " be iMproved, required
filetype off                  " required

""set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
" Bundle            -- Vim bundle manager [help bundle]
Bundle 'https://github.com/gmarik/Vundle.vim'
" :BundleList          - list configured plugins
" :BundleInstall(!)    - install (update) plugins
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused plugins
"

""  " The following are examples of different formats supported.
""  " Keep Bundle commands between vundle#begin/end.
""  " plugin on GitHub repo
""  Bundle 'tpope/vim-fugitive'
""  " plugin from http://vim-scripts.org/vim/scripts.html
""  Bundle 'L9'
""  " Git plugin not hosted on GitHub
""  Bundle 'git://git.wincent.com/command-t.git'
""  " git repos on your local machine (i.e. when working on your own plugin)
""  Bundle 'file:///home/gmarik/path/to/plugin'
""  " The sparkup vim script is in a subdirectory of this repo called vim.
""  " Pass the path to set the runtimepath properly.
""  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
""  " Avoid a name conflict with L9
""  Bundle 'user/L9', {'name': 'newL9'}

" The Bundle URLs are intentionally complete https URLs
" * grep '^Bundle \'' vimrc.bundles
" * sed -i 's\https://github.com/\ssh://git@github.com/\g'

" venv.vim          -- venv cdalias commands like :Cdwrk, :Cdsrc, and :Cdwrd
Bundle 'https://github.com/westurner/venv.vim'


" Info.vim          -- vim infopages in vim [help info]
Bundle 'https://github.com/vim-scripts/info.vim'
"  :Info sed        --  view infopage for 'sed'
"  <Space>          --  Scroll forward (page down).
"  <Backspace>      --  Scroll backward (page up).
"  <Tab>            --  Move cursor to next hyperlink within this node.
"  <Enter>,<C-]>    --  Follow hyperlink under cursor.
"  ;,<C-T>          --  Return to last seen node.
"  .,>              --  Move to the "next" node of this node.
"  p,<              --  Move to the "previous" node of this node.
"  u                --  Move "up" from this node.
"  d                --  Move to "directory" node.
"  t                --  Move to the Top node.
"  <C-S>            --  Search forward within current node only.
"  s                --  Search forward through all nodes for a specified
"  string.
"  q                --  Quit browser.
"


" Signify   -- show git/hg file changes in gutter [help signify]
Bundle 'https://github.com/mhinz/vim-signify'


" Fugitive      -- Git commands and statusline display [help fugitive]
Bundle 'https://github.com/tpope/vim-fugitive'


" Lawrencium    -- Hg commands [help lawrencium]
Bundle 'https://github.com/ludovicchabant/vim-lawrencium'


" NERDTree      -- File browser [help NERDTree]
Bundle 'https://github.com/scrooloose/nerdtree'
"  <Leader>e         --  toggle NERDTree
"  ctrl-e            --  toggle NERDTree
"  <Leader>E         --  open nerdtree to current file (:NERDTreeFind %:p:h)
"  ctrl-E            --  open nerdtree to current file (:NERDTreeFind %:p:h)
"  I                 --  toggle view hidden files
"  B                 --  toggle view bookmarks
"  cd                --  set vim CWD to selected dir
"  C                 --  refocus view to selected dir
"  o                 --  open
"  r                 --  refresh dir
"  R                 --  refresh root
"  t                 --  open in new tab
"  T                 --  open in new tab silently
"  u                 --  up a dir
"  U                 --  up a dir and leave open
"  x                 --  close node
"  X                 --  close all nodes recursive
"  ?                 --  toggle help
"let g:NERDTreeBookmarksFile = "~/workspace/.bookmarks"

"Single click
let NERDTreeMouseMode=1
"Netrw in NERDTree
let NERDTreeHijackNetrw=1

map <silent> <C-e> <Esc>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>e <Esc>:NERDTreeToggle<CR>
"map <silent> <C-t> <Esc>:tabnew +:NERDTreeMirror<CR>
"nnoremap <C-B> <Esc>:Bookmark "

let g:nerdtree_plugin_open_cmd = "xdg-open"


" FindInNERDTree    -- NERDTRee show current file [help NERDTreeFind]
Bundle 'https://github.com/dmcinnes/FindInNERDTree'
nnoremap <Leader>E <Esc>:NERDTreeFind "%:p:h"<CR>


"Bundle 'https://github.com/itspriddle/vim-nerdtree-helpers'
""Bundle 'https://github.com/jistr/vim-nerdtree-tabs'
Bundle 'https://github.com/EvanDotPro/nerdtree-symlink'


"" BufExlorer       -- buffer management window  [help bufexplorer]
Bundle 'https://github.com/jlanzarotta/bufexplorer'
"  <c-b>            --  toggle BufExplorer
"  ?                --  toggle BufExplorer help
map <C-B>               <Esc>:BufExplorer<CR>
"  <leader>b        --  toggle BufExplorer
nnoremap <Leader>b      <Esc>:BufExplorer<CR>
set switchbuf=usetab


" CtrlP             -- file/buffer/mru finder [help ctrlp]
Bundle 'https://github.com/kien/ctrlp.vim'
"  <C-p>            -- CtrlP (fuzzy matching)
nnoremap <Leader>p <Esc>:CtrlP<CR>


" Syntastic         -- syntax highlighting [help syntastic]
Bundle 'https://github.com/scrooloose/syntastic'
if exists("g:loaded_syntastic_plugin")
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_quiet_warnings=0
    let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
    "let g:syntastic_disabled_filetypes = ['ruby', 'php']
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif


" NERDCommenter     -- commenting [help NERDCommenter]
Bundle 'https://github.com/scrooloose/nerdcommenter'
"  ,cm              --  minimal comment
"  ,cs              --  sexy comment
"  ,c<space>        --  toggle comment
let g:NERDCustomDelimiters = {
      \ 'puppet': { 'left': '#', 'leftAlt': '/*', 'rightAlt': '*/' }
      \ }


" UltiSnips         --  syntax-specific snippets [help ultisnips]
Bundle 'https://github.com/SirVer/ultisnips'
Bundle 'https://github.com/honza/vim-snippets'
"  snippetname<C-CR>    --  insert snippet
"  <tab>            --  next placeholder
"  <tab>            --  prev placeholder
"  ~/.vim/snippets-ulti/python:
"   climain         --  new cli script
"   setuppy         --  new setup.py script
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsExpandTrigger       = '<C-CR>'
let g:UltiSnipsJumpForwardTrigger  = '<A-d>'
let g:UltiSnipsJumpBackwardTrigger = '<A-a>'

let g:UltiSnipsSnippetsDir        = '~/.vim/snippets-ulti/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets-ulti']


" NeoComplCache -- code completion [help neocomplcache]
Bundle 'https://github.com/Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
"Bundle 'Valloric/YouCompleteMe'  "Requires newer vim


" unstack.vim   -- parse and open stacktrace paths [help unstack]
Bundle 'https://github.com/mattboehm/vim-unstack'
"  <leader> s   -- parse part/all of a stacktrace


" accordion.vim -- work w/ a number of vsplits at once [help accordion]
"Bundle 'https://github.com/mattboehm/vim-accordion'
""  :Accordion [n]       -- show [n] splits wide
""  :AccordionAll [n]    -- show [n] splits everywhere
""  :AccordionDiff       -- show 2 split diffs
""  :AccordionStop       -- stop auto layout and reset
""  show hsplits
"""let g:accordion_mode="h"
"let g:accordion_mode="v"
""  <Ctrl-w> 2   -- Show 2 splits wide
"nnoremap <C-w>2 :Accordion 2<CR>
""  <Ctrl-w> 3   -- Show 3 splits wide
"nnoremap <C-w>3 :Accordion 3<CR>
""  <Ctrl-w> 0   -- stop auto layout and reset
"nnoremap <C-w>0 :AccordionStop<CR>


" ViM Airline   -- helpful statusbar information w/ vimscript [help airline]
Bundle 'https://github.com/bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagline#enabled = 1
let g:airline#extensions#tagline#buffer_nr_show = 1
if has("gui_running")
    let g:airline_powerline_fonts = 1
    " base16, wombat, luna
    "let g:airline_theme="base16"
else
    " base16, wombat, luna
    "let g:airline_theme="wombat"
endif


" EasyMotion    -- easy visual motions [help easymotion]
Bundle 'https://github.com/Lokaltog/vim-easymotion'
"  <Leader>m-w/e    --  search forward (beg/end of word)
"  <Leader>m-b      --  search backward
"  <Leader>m-j      --  search line down
"  <Leader>m-k      --  search line up
let g:EasyMotion_leader_key = '<Leader>m'
"let g:EasyMotion_mapping_t  = '_t'
"let g:EasyMotion_mapping_gE = '_gE'


"Vim Colorschemes pack
"Bundle 'https://github.com/flazz/vim-colorschemes'


" Jellybeans    -- a good colorscheme w/ sensible diff highlighting
Bundle 'https://github.com/nanotech/jellybeans.vim'
"  :colorscheme jellybeans -- switch to the jellybeans colorscheme


" Vim-misc      -- functions for colorscheme-switcher and vim-session
Bundle 'https://github.com/xolox/vim-misc'


" Vim Colorscheme Switcher [help colorscheme-switcher]
Bundle 'https://github.com/xolox/vim-colorscheme-switcher'
let g:colorscheme_switcher_exclude = ['shine', 'morning', 'peachpuff', 'zellner', 'delek', 'default' ]
let g:colorscheme_switcher_keep_background = 1
"  <F8>         -- cycle colors forward
"  <Shift><F8>  -- cycle colors reverse


" HiColors
"  call HiTest() -- print highlighting colors 
Bundle 'https://github.com/vim-scripts/HiColors'


" Pasting       -- make paste work normally [help paste]
Bundle 'https://github.com/sickill/vim-pasta'


" Vim Room      -- focus just the relevant text [help vimroom] 
Bundle 'https://github.com/mikewest/vimroom'


" VOoM Outline Viewer   -- view outlines of code and text [help voom]
Bundle 'https://github.com/vim-scripts/VOoM'
"  VOoM modes:  html, markdown, python, rest,
"               thevimoutliner, txt2tags,
"               viki, vimwiki, wiki

"  :Voom [<format>] -- open Voom outline tab
"  :Voom rest       -- open ReStructuredText outline
"  ggg?G
"  <leader> V   -- toggle Voom outline sidebar
nnoremap <Leader>V :VoomToggle<cr>


" TagBar        -- source tag browser [help tagbar]
Bundle 'https://github.com/majutsushi/tagbar'
"  <leader> t   -- toggle TagBar outline sidebar"
nnoremap <Leader>t :TagbarToggle<cr>


" Vim Session   -- save and restore sessions between exits [help session]
Bundle 'https://github.com/xolox/vim-session'
"  :SaveSession <name>  -- save a session
"  :OpenSession <name>  -- open a saved session
"  :Restart             -- SaveSession restart && exit
"  :OpenSession restart -- open the 'restart' saved session
let g:session_autoload = 'no'
let g:session_autosave = 0
let g:session_autosave_periodic = 0


" Vim Unimpaired        --  moving between buffers [help unimpaired]
Bundle 'https://github.com/tpope/vim-unimpaired'
"  [a      :previous
"  ]a      :next
"  [A      :first
"  ]A      :last
"  [b      :bprevious
"  ]b      :bnext
"  [B      :bfirst
"  ]B      :blast
"  [l      :lprevious
"  ]l      :lnext
"  [L      :lfirst
"  ]L      :llast
"  [<C-L>  :lpfile
"  ]<C-L>  :lnfile
"  [q      :cprevious
"  ]q      :cnext
"  [Q      :cfirst
"  ]Q      :clast
"  [<C-Q>  :cpfile (Note that <C-Q> only works in a terminal if you disable
"  ]<C-Q>  :cnfile flow control: stty -ixon)
"  [t      :tprevious
"  ]t      :tnext
"  [T      :tfirst
"  ]T      :tlast


" Ack.vim       -- ack through files (instead of grep) [help ack]
Bundle 'https://github.com/mileszs/ack.vim'
" :Ack [options] PATTERN [directory]    -- search for pattern
" :AckAdd [options] PATTERN [directory] -- add a search pattern
" :AckWindow [options] PATTERN          -- search all visible buffers"


" vim-surround  -- paired tag wrappings [help surround]
Bundle 'https://github.com/tpope/vim-surround'
"  ds   -- delete surroundings
"  cs   -- change surroundings
"


" csapprox      -- adapt gvim colorschemes for terminal vim [help csapprox]
Bundle 'https://github.com/godlygeek/csapprox'
:let g:CSApprox_loaded = 1


" UndoTree      -- visualize vim undotree
Bundle 'https://github.com/mbbill/undotree'
"  <F5>     -- Toggle UndoTree (? for help)
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
    ""set undodir = '~/.undodir/'
    set undofile
endif


" vim-nginx -- nginx ftdetect, indent, and syntax
Bundle 'https://github.com/robotvert/vim-nginx'


" n3.vim    -- N3/Turtle RDF Syntax
Bundle 'https://github.com/vim-scripts/n3.vim'


" SPARQL    -- SPARQL syntax
Bundle 'https://github.com/vim-scripts/sparql.vim'



"" /begin Python

if has("python")
" Python-mode       -- Python [help pymode]
Bundle 'https://github.com/klen/python-mode'
"  :help pymode

"  [[    --  Jump to previous class or function
"  ]]    --  Jump to next class or function
"  [M    --  Jump to previous class or method
"  ]M    --  Jump to next class or method
"  aC    --  Select a class. Ex: vaC, daC, yaC, caC
"  iC    --  Select inner class. Ex: viC, diC, yiC, ciC
"  aM    --  Select a function or method. Ex: vaM, daM, yaM, caM
"  iM    --  Select inner function or method. Ex: viM, diM, yiM, ciM
"  g:pymode_python = { 'python', 'python3', 'disable' }
"
"  set g:pymode_python 'disable' (start time, occasional completion stall)
"let g:pymode_python = 'python'
"let g:pymode_python = 'python3'
let g:pymode_python = 'disable'

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"  :PymodeLintToggle    -- toggle lint checking
"  :PymodeLintAuto      -- autofix current buffer pep8 errors
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes"
"let g:pymode_lint_checkers = pyflakes pep8 mccabe pep257 pylint
" - auto-show an error window
let g:pymode_lint_cwindow = 1
" - show lint signs
let g:pymode_lint_signs = 1
" - run lint on write
let g:pymode_lint_on_write = 1
"run lint unmodified
let g:pymode_lint_unmodified = 0
"run lint while editing
let g:pymode_lint_on_fly = 0
"  let g:pymode_lint_ignore = ""
"  let g:pymode_lint_select = ""

"  Pymode lint line annotation symbols
"   XX = TODO
"   CC = COMMENT
"   RR = VISUAL
"   EE = ERROR
"   II = INFO
"   FF = PYFLAKES

" :PyModeLint       -- lint current buffer (once)
" :PyModeLintToggle -- toggle lint
"
" :PyModeLintAuto   -- auto-lint the current buffer (once)
"                       (commit before and after)
"
""let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_todo_symbol = 'XX'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

let g:pymode_breakpoint = 1
"  <F7>     -- set debugger breakpoints
let g:pymode_breakpoint_key = '<F7>'
"  auto lookup breakpoint cmd (pdb, ipdb, pudb)"
let g:pymode_breakpoint_cmd = ''

"  Searches upward for a .ropeproject file (that should be .vcs-ignored)
"  :PymodeRopeNewProject    -- Create a new .ropeproject in CWD
"  :PymodeRopeRegenerate    -- Regenerate rope project cache
let g:pymode_rope_lookup_project = 1

"  <C-c>d       -- show docs for current function w/ pymode
let g:pymode_rope_show_doc_bind = '<C-c>d'

"  rope for autocompletion
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
"  <C-Space>    -- rope autocomplete
let g:pymode_rope_completion_bind = '<C-Space>'

let g:pymode_rope_autoimport = 1

"  <leader> j       --  :RopeGotoDefinition
map <leader>j           :RopeGotoDefinition<CR>

"  <C-c> ro     -- organize Python imports; drop unused (:PymodeRopeAutoImport)
let g:pymode_rope_organize_imports_bind = '<C-c>ro'


"  :PymodeRopeUndo  -- Undo last project changes
"  :PymodeRopeRedo  -- Redo last project changes

"  <C-c> rr     -- rope rename
let g:pymode_rope_rename_bind = '<C-c>rr'


" vim-virtualenv    -- Python virtualenv [help virtualenv]
Bundle 'https://github.com/jmcantrell/vim-virtualenv'
"  :help
"  :VirtualEnvDeactivate
"  :VirtualEnvList
"  :VirtualEnvActivate <name>
"  :VirtualEnvActivate <TAB>


" Sort python imports
Bundle 'https://github.com/vim-scripts/sort-python-imports'
"  :PyFixImports    --  sort import statements


" Pytest.vim    -- py.test red/green results [help pytest]
Bundle 'https://github.com/alfredodeza/pytest.vim'
"  :Pytest clear    -- reset pytest globals
"  :Pytest file     --  pytest file
"  :Pytest class    --  pytest class
"  :Pytest method   --  pytest method
"  :Pytest {...} --pdb  -- pytest file/class/method with pdb
"  <leader>tf       --  pytest file
nmap <silent><Leader>tf <Esc>:Pytest file %:p<CR>
"nnoremap <C-f>         <Esc>:Pytest file<CR>
"  <leader>tc       --  pytest class
nmap <silent><Leader>tc <Esc>:Pytest class
"  <leader>tm       --  pytest method
nmap <silent><Leader>tm <Esc>:Pytest method
"  " cycle through test errors
"  <leader>tn       --  pytest next error
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"  <leader>tp       --  pytest prev error
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"  <leader>te       --  pytest error
nmap <silent><Leader>te <Esc>:Pytest error<CR>


" Pyrex         -- Pyrex syntax
Bundle 'https://github.com/vim-scripts/pyrex.vim'


" Jinja         -- Jinja Templates syntax
Bundle 'https://github.com/mitsuhiko/vim-jinja'

endif
"" /end Python


" os.vim   -- Operating System [help os]
Bundle 'https://github.com/Rykka/os.vim'

" clickbable.vim -- click-able links
Bundle 'https://github.com/Rykka/clickable.vim'
let g:clickable_browser = "x-www-browser"

" Riv.vim   -- ReStructuredText [help riv]
Bundle 'https://github.com/Rykka/riv.vim'
"  :RivIntro
"  :RivQuickStart
"  :RivPrimer
"  :RivSpecification
"  :RivCheatSheet
let g:riv_web_browser = 'x-www-browser'
" let g:riv_fold_level = -1
let g:riv_python_rst_hl = 0


" Salt      -- Salt syntax
Bundle 'https://github.com/saltstack/salt-vim'


" Trac      -- Trac [help trac]
Bundle 'https://github.com/mjbrownie/Trac.vim'


" webapi-vim -- vim web API [help webapi[-{html, http, json, xml}]]
Bundle 'https://github.com/mattn/webapi-vim'


" gist-vim  -- Create a gist.github.com [help gist-vim]
Bundle 'https://github.com/mattn/gist-vim'


" github-issues.vim     -- autocomplete, CRUD GitHub issues [help Gissues]
Bundle 'https://github.com/jaxbot/github-issues.vim'


" All of your Bundles must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""To ignore plugin indent changes, instead use:
"filetype plugin on
"
""see :h vundle for more details or wiki for FAQ
""Put your non-Bundle stuff after this line
