#!/bin/bash

db=$(python ~/slingshot-utils/slingshot_functions.py get_current_dbi $(tmux display-message -p '#S'))
runSegment() {
    project_path=''
    case $(hostname) in
        (ZENO) echo "";;
        (tcraig-m01) echo "$db  ";;
        (*) echo "How did I get in the middle of nowhere?";;
    esac
}
