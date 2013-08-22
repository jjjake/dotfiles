#!/bin/bash

if [ $(uname) == "Darwin" ]; then
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
    
    #tmux new-window -t $SESSION -n data
    #tmux rename-window 'DATA'
    #tmux send-keys 'cd /1/data/' 'C-m'
    
    tmux select-window -t $SESSION:0
    
    tmux attach -t $SESSION
fi

if [ $(uname) == "Linux" ]; then
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
    
    tmux new-window -t $SESSION -n data
    tmux rename-window 'DATA'
    tmux send-keys 'cd /1/data/' 'C-m'
    
    tmux select-window -t $SESSION:0
    
    tmux attach -t $SESSION
fi
