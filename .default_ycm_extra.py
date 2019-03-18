
CFLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-std=c99',
]


def Settings(**kwargs):
    """

    """
    if kwargs['language'] == 'cfamily':
        return {
            'flags': CFLAGS
        }
    else:
        return {'flags': []}

    return


