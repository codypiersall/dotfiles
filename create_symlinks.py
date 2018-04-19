#! /usr/bin/env python
# Makes symlinks in $HOME for all the files in this directory (except this one)
from __future__ import print_function
import os
import sys


THIS_DIR = os.path.dirname(os.path.abspath(__file__))
EXCLUDE = {'.', '..', '.git', __file__, '.gitignore', 'install.sh', '.config'}
HOME = os.environ['HOME']

EXCLUDE_ENDINGS = ('~', '.un', '.swp')
DIRS = THIS_DIR, os.path.join(THIS_DIR, '.config')


def exclude(fname):
    fname = os.path.basename(fname)
    if fname in EXCLUDE:
        return True
    for ending in EXCLUDE_ENDINGS:
        if fname.endswith(ending):
            return True
    return False


def main():
    for dir in DIRS:
        for file in os.listdir(dir):
            source = os.path.join(dir, file)
            whatsleft = source[len(THIS_DIR) + 1:]
            symlink = os.path.join(HOME, whatsleft)
            force = '-f' in sys.argv
            if not exclude(source):
                if not os.path.exists(symlink) or force:
                    if os.path.exists(symlink):
                        os.remove(symlink)
                    os.symlink(source, symlink)
                    print('ln -s {} {}'.format(source, symlink))
                else:
                    print('file {} already exists'.format(symlink))


if __name__ == '__main__':
    main()
