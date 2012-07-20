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
set ts=2 sts=2 sw=2 noai nu et si

"""""""""""""""""""
""" Status Line """
"""""""""""""""""""
set laststatus=2
set statusline=%t\ 
set statusline+=%#warningmsg#\ 
set statusline+=%{SyntasticStatuslineFlag()}\ 
set statusline+=%*\ 
set statusline+=%{fugitive#statusline()}\ 
set statusline+=%{rvm#statusline()}\ 
set statusline+=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ 
set statusline+=%h%m%r%y%=%c,%l/%L\ 
set statusline+=%P\ 

""""""""""""""""""""""
""" Syntax Folding """
""""""""""""""""""""""
let perl_fold = 1

""""""""""""""""""""""""
""" Custom Functions """
""""""""""""""""""""""""

" Normalize tabstop, softtabstop and shiftwidth to one value
command! -nargs=* SetTabs call SetTabs()
function! SetTabs()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

" Function for displaying current tab settings
command! -nargs=* SummarizeTabs call SummarizeTabs()
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' et'
    else
      echon ' noet'
    endif
  finally
    echohl None
  endtry
endfunction

" Call a function and preserve cursor position
function! Preserve(command)
  " Preparation: save last search, cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Make the substitution
  execute a:command
  " Restore history and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"""""""""""""""""""
""" KeyBindings """
"""""""""""""""""""
let mapleader=','

" Modify and Reload Keybindings
nmap <leader>k :!gvim -f ~/.vimrc<CR>:source ~/.vimrc<CR>

" Search with Ack
nmap <leader>a :Ack<CR>
vmap <leader>a :Ack<CR>

" Toggle Non-Printable Characters
nmap <leader>l :set list!<CR>

" Tab-Related Bindings
nmap <S-Tab> :SummarizeTabs<CR>
nmap <C-Tab> :retab!<CR>

" Strip Trailing Whitespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

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

" Syntastic Bindings
nmap <leader>s :SyntasticCheck<CR>
nmap <leader>S :SyntasticToggleMode<CR>

" ConqueTerm Bindings
nmap <leader>Te  :ConqueTermSplit 
nmap <leader>Ts  :ConqueTermSplit bash<CR>
nmap <leader>Tr  :ConqueTermSplit pry<CR>
nmap <leader>Tpl :ConqueTermSplit psh<CR>
nmap <leader>Tpy :ConqueTermSplit ipython<CR>

" RubyConque Bindings
nmap <leader>rr  :ConqueTermSplit rake<CR>
nmap <leader>rs  :ConqueTermSplit rspec --color<CR>
nmap <leader>rc  :ConqueTermSplit cucumber --color<CR>
nmap <leader>rrf :call RunRubyCurrentFileConque()<CR>
nmap <leader>rsf :call RunRspecCurrentFileConque()<CR>
nmap <leader>rcf :call RunCucumberCurrentFileConque()<CR>

source ~/.vimrc.local
