set -x GOPATH /home/cris/.go
set -x GOROOT /home/cris/.gimme/versions/go1.7.1.linux.amd64
set -x GIMME_ENV /home/cris/.gimme/envs/go1.7.1.env
set -x PATH $PATH $GOPATH/bin ~/bin

bass source ~/.nvm/nvm.sh --no-use ';' nvm use 7.9.0
bash ~/bin/key-repeat

