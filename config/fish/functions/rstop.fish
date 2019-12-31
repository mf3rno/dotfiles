function rstop
  tmux kill-session -t "sox-$argv"
end
