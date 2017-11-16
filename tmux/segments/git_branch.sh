#!/bin/bash

runSegment() {
  echo -n ' #(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)'
}
