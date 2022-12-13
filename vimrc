call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"автокомплит в языках
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Плагины для js/ts
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'maxmellon/vim-jsx-pretty'
" Plug 'neoclide/coc-eslint'

Plug 'voldikss/vim-floaterm'
Plug 'mihaifm/bufstop'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'TroyFletcher/vim-colors-synthwave'
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'yassinebridi/vim-purpura'

Plug 'wookayin/fzf-ripgrep.vim'
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install --frozen-lockfile --production',
"   \ 'branch': 'release/0.x'
"   \ }
call plug#end()





"настройки всяки
syntax on
" colorscheme synthwave
set number
set hidden 
set backspace=eol,start,indent
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set updatetime=250 
set mouse=a
set nowrap
set scrolloff=10 
set noshowmode
set hlsearch
set nocompatible 
set whichwrap+=<,>,h,l   
set incsearch
set nobackup
set nowb 
set noswapfile
filetype on



"Открывает буфер на той строке, где последний раз был курсор
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"Убирает всякие звуки
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Leader (Prefix)
let mapleader = " " 


" Навигация по буферам
" nmap <leader>uu :u<cr> 
nmap <leader>w :w!<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>


" Показывает положение курсора
"set cursorline
"set cursorcolumn


"переназначаю клавиши для перехода по окнам
nmap <silent> <C-l> : wincmd l<CR>
nmap <silent> <C-k> : wincmd k<CR>
nmap <silent> <C-h> : wincmd h<CR>
nmap <silent> <C-j> : wincmd j<CR>


"оключил стрелки
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>


"прозрачный фон
" hi Normal guibg=NONE ctermbg=NONE


"убирается подсветка результатов поиска
imap <silent> <F5> <Esc>:noh<CR>
map <F5> <Esc>:noh<CR>


"включение и выключение подсветки колонки
" ! - toggle
imap <F8> <Esc>:set cursorcolumn!<CR>
map <F8> <Esc>:set cursorcolumn!<CR>


"смена режима
inoremap ` <ESC>







" Темка
if (has("termguicolors"))
  set termguicolors
endif
colorscheme synthwave 
set background=dark
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE



" Airline
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = '' 
let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %3v')


" Prettier configs
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" Coc configs
" let g:coc_global_extensions = ['coc-tsserver']


" Автокомплит
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
  

"Перемещение строк 
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv


"Навигация по приложению
" nmap <leader>ac  <Plug>(coc-codeaction)
" nmap <leader>qf  <Plug>(coc-fix-current)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)


" Навигация по буферу
" map <leader>b :Bufstop<CR>
" let g:BufstopAutoSpeedToggle = 1


" Nerdtree navigation
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


"встроенный терминал
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_height=0.8


" Fzf навигация по файлам
" map <Leader>ff :Files<CR>
" map <Leader>fb :BLines<CR>
" map <Leader>fa :Rg<CR>
" let $FZF_DEFAULT_COMMAND = 'fd --type f'



" Show docs keys (может показать всякое интепесное)
" map <Leader>k :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
