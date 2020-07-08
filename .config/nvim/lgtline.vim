 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Lightline Configuration " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get default from :h lightline

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ }

let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'hunks', 'fugitive' ],
            \           [ 'readonly', 'absolutepath', 'modified' ],
            \           [ ] ],
            \ 'right': [ [  'coc_error', 'coc_warning', 'coc_hint', 'coc_info', 'percent', 'line' ],
            \            [ 'fileencoding', 'fileformat' ],
            \            [ 'filetype' ], ]
            \ }

let g:lightline.inactive = {
            \ 'left': [ [ 'mode', 'paste'],
            \           [ 'readonly', 'filename', 'modified' ] ],
            \ 'right': [ [ 'percent', 'line' ],
            \            [ 'fileencoding', 'fileformat' ],
            \            [ 'filetype' ], ]
            \ }

let g:lightline.tabline = {
            \ 'left': [ [ 'bufferinfo' ],
            \           [ 'separator' ],
            \           [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
            \ 'right': [ [ 'close' ], ],
            \}

let g:lightline.tab = {
            \ 'active': [ 'tabnum', 'filename', 'modified' ],
            \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
            \}

let g:lightline.component = {
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&ff}',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'percent': '%3p%% ',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%l/%L  : %-2v',
            \ 'line': '%l  : %-2v',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}',
            \ 'sep1': '',
            \ 'sep2': '.',
            \ 'separator': '',
            \}

let g:lightline.component_function = {
            \ 'readonly': 'StatuslineReadonly',
            \ 'fugitive': 'StatuslineFugitive',
            \ 'hunks': 'StatuslineSignify',
            \ 'filetype': 'MyFiletype',
            \ 'bufferinfo': 'lightline#buffer#bufferinfo',
            \}

let g:lightline.component_expand = {
            \ 'coc_error'        : 'LightlineCocErrors',
            \ 'coc_warning'      : 'LightlineCocWarnings',
            \ 'coc_info'         : 'LightlineCocInfos',
            \ 'coc_hint'         : 'LightlineCocHints',
            \ 'coc_fix'          : 'LightlineCocFixes',
            \ 'buffercurrent'    : 'lightline#buffer#buffercurrent',
            \ 'bufferbefore'     : 'lightline#buffer#bufferbefore',
            \ 'bufferafter'      : 'lightline#buffer#bufferafter',
            \ }

let g:lightline.component_type = {
            \ 'readonly'         : 'error',
            \ 'coc_error'        : 'error',
            \ 'coc_warning'      : 'warning',
            \ 'coc_info'         : 'tabsel',
            \ 'coc_hint'         : 'middle',
            \ 'coc_fix'          : 'middle',
            \ 'buffercurrent'    : 'tabsel',
            \ 'bufferbefore'     : 'raw',
            \ 'bufferafter'      : 'raw',
            \ }

let g:lightline.mode_map = {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'L',
            \ "\<C-v>": 'B',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'S-LINE',
            \ "\<C-s>": 'S-BLOCK',
            \ 't': 'T',
            \ }

""" Ordinary Separaors
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '|', 'right': '|'
            \}

""" Powerline Separators
" let g:lightline.separator = {
"             \   'left': '', 'right': ''
"             \}
" let g:lightline.subseparator = {
"             \   'left': '', 'right': ''
"             \}

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.enable = {
            \ 'statusline': 1,
            \ 'tabline': 1
            \ }

""" Lightline ALE Symbols
" let g:lightline#ale#indicator_checking = "\uf110 "
" let g:lightline#ale#indicator_infos = "\uf129 "
" let g:lightline#ale#indicator_warnings = "\uf071 "
" let g:lightline#ale#indicator_errors = "\uf05e "
" let g:lightline#ale#indicator_ok = "\uf00c "

""" Function to add Coc Support
function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
        return ''
    endif
    return printf('%s %d', a:sign, info[a:kind])
endfunction
function! LightlineCocErrors() abort
    return s:lightline_coc_diagnostic('error', "\uf05e")
endfunction
function! LightlineCocWarnings() abort
    return s:lightline_coc_diagnostic('warning', "\uf071")
endfunction
function! LightlineCocInfos() abort
    return s:lightline_coc_diagnostic('information', "\uf129")
endfunction
function! LightlineCocHints() abort
    return s:lightline_coc_diagnostic('hints', 'H')
endfunction
autocmd User CocDiagnosticChange call lightline#update()

""" Statusline Functions for Icon Support and External Plugins Support
source ~/.config/nvim/statusline_functions.vim
