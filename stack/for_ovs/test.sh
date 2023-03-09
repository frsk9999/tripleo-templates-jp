#!/bin/sh

sudo pip install ansible ansible-core
sudo mv /usr/bin/ansible /usr/bin/ansible.bk
sudo cp -p /usr/local/bin/ansible /usr/bin/ansible
sudo mv /bin/ansible-playbook /bin/ansible-playbook.bk
sudo cp -p /usr/local/bin/ansible-playbook /bin/ansible-playbook
