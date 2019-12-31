function rstart
  tmux new-session -d -s "sox-$argv" "sox -d /home/f3rno/documents/AIM/audio/unsorted/x1/$argv.ogg"
end
