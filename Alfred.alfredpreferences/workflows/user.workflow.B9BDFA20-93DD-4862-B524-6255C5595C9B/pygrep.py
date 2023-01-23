from alfred_utils.feedback import Feedback
import os
import sys

# import addition packages you want to access here

directory = sys.argv[1]
query = " ".join(sys.argv[2:])
fb = Feedback()
# fb.add_item('hi', query)

result = os.popen(" ".join([
    "grep -ri --exclude-dir=.git",
    query,
    directory,
])
)

total_lines = 0

while 1:
  line = result.readline()
  if not line:
    if total_lines == 0:
      fb.add_item("No results found")
    break
  else:
    tokens = line.split(":")
    if len(tokens) > 0:
      fb.add_item(repr(tokens[1])[1:-1], tokens[0], tokens[0])
      total_lines += 1

print fb
