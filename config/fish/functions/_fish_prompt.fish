function fish_prompt
  eval $GOPATH/bin/powerline-go -error $status -shell bare -cwd-max-depth 1
end
