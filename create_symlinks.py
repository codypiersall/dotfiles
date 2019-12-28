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
            target = os.path.join(dir, file)
            link_name = os.path.join(HOME, file)
            force = '-f' in sys.argv
            if not exclude(target):
                if (not os.path.exists(link_name)) or force:
                    print('ln -s {} {}'.format(target, link_name))
                    if os.path.islink(link_name) or os.path.exists(link_name):
                        os.remove(link_name)
                    os.symlink(target, link_name)
                else:
                    print('file {} already exists'.format(link_name))


if __name__ == '__main__':
    main()
