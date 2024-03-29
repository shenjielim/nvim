vim.cmd([[
set encoding=utf8           " encoding
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
"set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set scrolloff=8           " have a gap between cursor and top of the file
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set updatetime=50           " faster update
set relativenumber
set wildcharm=<Tab>         " to move down a dropdown with Tab
set scrolloff=8             " leave gap above file
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set nowrap          " disable text wrapping
"set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
        "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
        " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
        if (has("termguicolors"))
            set termguicolors
            endif
            endif

            syntax enable

            " open new split panes to right and below
            set splitright
            set splitbelow

            " move line or visually selected block - alt+j/k
            inoremap <A-j> <Esc>:m .+1<CR>==gi
            inoremap <A-k> <Esc>:m .-2<CR>==gi
            vnoremap <A-j> :m '>+1<CR>gv=gv
            vnoremap <A-k> :m '<-2<CR>gv=gv
            " move split panes to left/bottom/top/right
            nnoremap <A-h> <C-W>H
            nnoremap <A-j> <C-W>J
            nnoremap <A-k> <C-W>K
            nnoremap <A-l> <C-W>L
            " move between panes to left/bottom/top/right
            nnoremap <C-h> <C-w>h
            nnoremap <C-j> <C-w>j
            nnoremap <C-k> <C-w>k
            nnoremap <C-l> <C-w>l

            "Enter visual block mode
            nnoremap <C-v> <C-v><C-v>

            " open file in a text by placing text and gf
            nnoremap gf :vert winc f<cr>
            " copies filepath to clipboard by pressing yf
            :nnoremap <silent> yf :let @+=expand('%:p')<CR>
            " copies pwd to clipboard: command yd
            :nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
            " Vim jump to the last position when reopening a file
            if has("autocmd")
                au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" |
                endif

                if exists('g:loaded_webdevicons')
                    call webdevicons#refresh()
                    endif
                    let g:startify_custom_header = [
                    \'                                                                                                                 ',
                    \'  ___ ___                                                                      ____.       _____  ______________ ',
                    \' /   |   \  ______  _  __ _____ _______   ____    ___.__. ____  __ __         |    | _____/ ____\/ ____\_____   \',
                    \'/    ~    \/  _ \ \/ \/ / \__  \\_  __ \_/ __ \  <   |  |/  _ \|  |  \        |    |/ __ \   __\\   __\   /   __/',
                    \'\    Y    (  <_> )     /   / __ \|  | \/\  ___/   \___  (  <_> )  |  /    /\__|    \  ___/|  |   |  |    |   |   ',
                    \' \___|_  / \____/ \/\_/   (____  /__|    \___  >  / ____|\____/|____/ /\  \________|\___  >__|   |__|    |___|   ',
                    \'       \/                      \/            \/   \/                  )/                \/               <___>   ',
                    \]
                    ]])

-- navigation keymaps
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")
vim.keymap.set('x', '<leader>P', "\"_dP")
vim.keymap.set('n', '<leader>p', "\"+p")
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")
vim.keymap.set('n', '<C-l>', ':let @/=""<CR>')
function FormatFile()
    -- save current cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- indent and format entire file
    vim.api.nvim_command('%s/\\s\\+$//e')                     -- remove trailing whitespace
    vim.api.nvim_command('normal gg=G')

    -- return to original cursor position
    vim.api.nvim_win_set_cursor(0, cursor_pos)
end

-- define a mapping for the macro
vim.keymap.set('n', '==', ':lua FormatFile()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- tmux mappings
vim.keymap.set('n','<C-h>',"<cmd> TmuxNavigateLeft<CR>" )
vim.keymap.set('n','<C-l>',"<cmd> TmuxNavigateRight<CR>" )
vim.keymap.set('n','<C-j>',"<cmd> TmuxNavigateDown<CR>" )
vim.keymap.set('n','<C-k>',"<cmd> TmuxNavigateUp<CR>" )
