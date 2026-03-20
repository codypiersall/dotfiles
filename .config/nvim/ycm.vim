let g:ycm_filetype_blacklist = {
    \ 'rust': 1,
\}

"let g:ycm_key_list_previous_completion = ["<Up>"]
"
" YouCompleteMe options
" autoload .ycm_extra_conf file (do not ask for confirmation)
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

highlight link YcmErrorSection Error


