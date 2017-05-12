#!/bin/bash

runSegment() {
    db=$(python ~/slingshot-utils/slingshot_functions.py get_current_dbi $(tmux display-message -p '#S'))
    echo "$db  "
}
