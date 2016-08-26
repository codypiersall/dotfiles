#! /usr/bin/env python
# Makes symlinks in $HOME for all the files in this directory (except this one)
from __future__ import print_function
import os
import sys


THIS_DIR = os.path.dirname(os.path.abspath(__file__))
EXCLUDE = {'.', '..', '.git', __file__, '.gitignore'}
HOME = os.environ['HOME']

EXCLUDE_ENDINGS = ('~', '.un')

def exclude(fname):
    fname = os.path.basename(fname)
    if fname in EXCLUDE:
        return True
    for ending in EXCLUDE_ENDINGS:
        if fname.endswith(ending):
            return True
    return False

def main():
    for file in os.listdir(THIS_DIR):
        source = os.path.join(THIS_DIR, file)
        symlink = os.path.join(HOME, file)
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
