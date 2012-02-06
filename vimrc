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
""" Status Line """
"""""""""""""""""""
set laststatus=2
set statusline=%t\ %{fugitive#statusline()}\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %h%m%r%y%=%c,%l/%L\ %P

"""""""""""""""""""
""" KeyBindings """
"""""""""""""""""""
let mapleader=','

" Copy/Cut/Paste
nmap <leader>y "+y
nmap <leader>x "+y
nmap <leader>p "+gp
nmap <leader>P "+gP

" NERDTree Bindings
nmap <leader>B :NERDTreeToggle<CR>

" ctags Bindings
nmap <leader>r :!ctags --exclude='*/tmp/*' --exclude='*/log/*' -R ./*<CR><CR>

" FuzzyFinder Bindings
nmap <leader>R :FuzzyFinderTextMateRefreshFiles<CR>
nmap <leader>t :FuzzyFinderTextMate<CR>
nmap <leader>T :FuzzyFinderTag<CR>
nmap <leader>b :FuzzyFinderBuffer<CR>
nmap <leader>f :FuzzyFinderFile<CR>
nmap <leader>F :FuzzyFinderTaggedFile<CR>

