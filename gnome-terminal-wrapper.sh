#!/bin/bash

# gnome-terminal wrapper for execute task concurrently
eval_tabs=
tab_count=$(( RANDOM % 3 + 1 ))
for (( i=0; i < tab_count; i++))
do
  eval_tabs=$eval_tabs" --tab -t xxx$i -e \"bash -x ./gnome-terminal-sub.sh\""
done

echo "gnome-terminal --maximize $eval_tabs"
eval "gnome-terminal --maximize $eval_tabs"
