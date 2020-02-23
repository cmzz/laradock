#!/usr/bin/expect

set timeout 3

# install docker
apt-get -y update 
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -y update 
apt-get -y install docker-ce docker-ce-cli containerd.io

mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://f7410aab.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload
systemctl restart docker


# install docker-compose
curl -L "http://172.17.56.144/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
