#!/usr/bin/env python
import commands
import os
import re

base_name = '/dev'
sd_match = re.compile('sd.$')
mounts = set()

for disk in commands.getoutput('lsblk -rin').split('\n'):
    node = disk.split(' ')[0]
    if sd_match.match(node):
        full_path = os.path.join(base_name, node)
        print '{0} ${{goto 80}} ${{diskio_read {1}}} ${{goto 150}} ${{diskio_write {1}}}'.format(node, full_path)

