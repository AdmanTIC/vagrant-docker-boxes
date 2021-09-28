FROM centos:8
ENV container docker
EXPOSE 22

RUN set -eux \
 && yum update -y \
 && yum install -y openssh-server sudo libffi-devel systemd openssh curl \
 && yum clean all \
 && useradd --create-home -s /bin/bash vagrant \
 && echo -n 'vagrant:vagrant' | chpasswd \
 && echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant \
 && chmod 440 /etc/sudoers.d/vagrant \
 && mkdir -p /home/vagrant/.ssh \
 && chmod 700 /home/vagrant/.ssh \
 && curl -fs https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys \
 && chmod 600 /home/vagrant/.ssh/authorized_keys \
 && chown -R vagrant:vagrant /home/vagrant/.ssh \
 && sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers \
 && mkdir /var/run/sshd \
 && ssh-keygen -A \
 && /usr/sbin/sshd \
 && systemctl enable sshd

CMD ["/lib/systemd/systemd"]
