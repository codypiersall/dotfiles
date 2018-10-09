import os


def FlagsForFile(filename, **kwargs):
    """

    """
    ext = os.path.splitext(filename)[1]

    if ext == '.c':
        lang = 'c'
    elif ext.lower() in {'.c', '.cpp', '.cc'}:
        lang = 'c++'
    else:
        return {'flags': []}

    flags = ['-x', lang, '-Wall', '-Wextra', '-Werror', '-std=c99']

    return {'flags': flags}


def Settings(**kwargs):
    client_data = kwargs['client_data']
    return {
        'interpreter_path': client_data['g:ycm_python_interpreter_path'],
        'sys_path': client_data['g:ycm_python_sys_path']
    }
