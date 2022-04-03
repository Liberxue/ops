yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
docker run -d  -p 8989:8989/tcp --name go-ss --restart=always -e SERVER_PORT=8989 -e METHOD=AEAD_CHACHA20_POLY1305 -e PASSWORD=xjESqrUKLa8BgPE7yH teddysun/go-shadowsocks2
firewall-cmd --zone=public --add-port=8989/tcp --permanent
firewall-cmd --reload
history -c
