"""""""""""""""""""""
""" Load Pathogen """
"""""""""""""""""""""
call pathogen#infect()

""""""""""""""""
""" GUI Font """
""""""""""""""""
set guifont=Ubuntu\ Mono\ 10

""""""""""""""""""""""""
""" General Settings """
""""""""""""""""""""""""
colorscheme vividchalk
syntax on

filetype plugin indent on
set ts=2 sts=2 sw=2 noai nonu et si

"""""""""""""""""""
""" KeyBindings """
"""""""""""""""""""
let mapleader=','

" NERDTree Bindings
nmap <leader>B :NERDTreeToggle<CR>

" FuzzyFinder Bindings
nmap <leader>t :FuzzyFinderTextMate<CR>
nmap <leader>b :FuzzyFinderBuffer<CR>
nmap <leader>f :FuzzyFinderFile<CR>

