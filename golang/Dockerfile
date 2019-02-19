FROM golang
RUN apt-get update && apt-get install -y vim

###########################################################################
# Install zsh + oh my zsh:
###########################################################################

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "zsh", "wget"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR $GOPATH/src

EXPOSE 8088 22