FROM ubuntu:16.04
ENV container docker
EXPOSE 22

RUN set -eux \
 && apt-get update -y && apt-get dist-upgrade -y \
 && apt-get install -y --no-install-recommends ssh sudo libffi-dev systemd openssh-client curl \
 && apt-get -y install puppet \
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
 && sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config \
 && mkdir /var/run/sshd \
 && /usr/sbin/sshd

CMD ["/lib/systemd/systemd"]
