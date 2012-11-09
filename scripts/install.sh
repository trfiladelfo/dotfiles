bin=$DOTFILES/bin
src=$DOTFILES/src
install_ack() {
  url="http://betterthangrep.com/ack-standalone"
  curl $url -sLo $bin/ack && chmod +x $bin/ack
}

install_hub() {
  url="http://defunkt.io/hub/standalone"
  curl $url -Lo $bin/hub && chmod +x $bin/hub
}

