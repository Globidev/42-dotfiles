#!/bin/zsh

session_name="dev"
window_name="main"

tmux has-session -t $session_name &> /dev/null

if [ $? != 0 ]
 then
    tmux new-session -s $session_name -n $window_name -d
    tmux send-keys -t $session_name "~/.dotfiles/tmux/arrangements/dev" C-m
fi

tmux -2 attach -t $session_name
