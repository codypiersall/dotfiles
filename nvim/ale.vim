let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'systemverilog': ['verilator'],
    \ 'verilog': ['verilator'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'vhdl': ['hdl-checker'],
\}

" E501: line too long
" W503: line break before binary operator
let g:ale_python_flake8_options = '--ignore E501,W503,E203'
let g:ale_tex_chktex_options = " -n8 "
" https://github.com/dense-analysis/ale/issues/1470
" Remove this line when Vim 8.1 is used.
let g:ale_echo_cursor = 0

highlight link ALEError Error

function! ALEInfo2_()
    let thing = execute("ALEInfo") | enew | put =thing
endfunction

command! ALEInfo2 call ALEInfo2_()
