yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io --allowerasing
systemctl enable docker --now
curl -Ls "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
systemctl start docker
systemctl enable docker
echo "alias ls='ls --color=auto -al'" >> /root/.bashrc
history -c
