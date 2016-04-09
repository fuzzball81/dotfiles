#!/usr/bin/env python

import xml.etree.ElementTree as ET
import os
import re
import subprocess

def getPath(item, item_type =''):
    retPath = ''
    if item_type == 'source':
        retPath = os.getcwd()
    directory = item.find('directory').text
    if directory is not None:
        broken_out = directory.split('/')
	match = re.match('\$(.*)', broken_out[0])
        if match is not None:
            base = os.environ.get(match.group(1))
            if base is not None:
                broken_out[0] = base
        directory = '/'.join(broken_out)
        retPath = os.path.join(retPath, directory)
    name = item.find('name').text
    if name is not None:
        retPath = os.path.join(retPath, name)
    return retPath


if __name__ == '__main__':
    tree = ET.parse('config.xml')
    root = tree.getroot()
    for item in root.iter('item'):
        source = getPath(item.find('source'), 'source')
        dest = getPath(item.find('destination'))
	cmd = 'ln -s {0} {1}'.format(source, dest).split(' ')
	try:
            subprocess.check_call(cmd)
        except subprocess.CalledProcessError as cp:
            print '{0} exited with status {1}'.format(' '.join(cp.cmd),
                                                      cp.returncode)
