#!/bin/bash

SESSION=$USER
tmux has-session -t $SESSION

if [ $? -eq 0 ]; then
    echo "Session '$SESSION' already exists. Attaching..."
    sleep 1
    tmux attach -t $SESSION
    exit 0;
fi

tmux new-session -d -s $SESSION
tmux new-window -t $SESSION
tmux rename-window 'home'
tmux send-keys 'cd ~' 'C-m'

tmux select-window -t $SESSION:0
tmux attach -t $SESSION

if [ $(hostname) =! "archive.org" ]; then
    tmux new-window -t $SESSION -n data
    tmux rename-window 'DATA'
    tmux send-keys 'cd /1/data/' 'C-m'
fi

tmux select-window -t $SESSION:0
tmux attach -t $SESSION
