#!/usr/bin/env python

import subprocess
import datetime
import json
from html import escape

data = {}

output = subprocess.check_output("khal list now", shell=True)
output = output.decode("utf-8")

lines = output.split("\n")
new_lines = []
for line in lines:
    clean_line = escape(line).split(" ::")[0]
    if len(clean_line) and not clean_line[0] in ['0', '1', '2']:
        clean_line = "\n<b>"+clean_line+"</b>"
    new_lines.append(clean_line)
output = "\n".join(new_lines).strip()

data['text'] = datetime.datetime.now().strftime("%H:%M - %d/%m/%y")
data['tooltip'] = output

print(json.dumps(data))
