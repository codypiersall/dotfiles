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

    flags = ['-x', lang, '-Wall', '-Wextra', '-Werror']

    return {'flags': flags}

