function fish_greeting
  task

  set UPDATES_AVAILABLE (cat /home/f3rno/data/update-count)

  if math "$UPDATES_AVAILABLE > 0" > /dev/null
    set_color blue
    printf "\n$UPDATES_AVAILABLE updates available via dnf"
    set_color normal
  end
end
