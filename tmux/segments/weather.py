#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import subprocess

output = subprocess.check_output(['curl', 'http://wttr.in/oakland'])
output_list = output.split('\n')
m = re.match(r'(.*)(\ \ \ )(.*)(°F)(.*)', output_list[3])
print(m.group(3))
