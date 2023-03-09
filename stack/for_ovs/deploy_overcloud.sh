#!/bin/bash
. stackrc
#export OS_HEAT_HOST="192.168.24.2"
export OVERCLOUD_PLAN="overcloud"
export TRIPLEO_STACK_NAME="overcloud"
#export OVERCLOUD_ROLES="ControllerDeployedServer ComputeDeployedServer"
#export ControllerDeployedServer_hosts="192.168.24.100"
#export ComputeDeployedServer_hosts="192.168.24.101"
openstack overcloud deploy --templates \
	-v --debug \
	--no-cleanup \
	--stack overcloud \
	--libvirt-type kvm \
	-b /home/stack/templates/overcloud-baremetal-deploy.yaml \
        -e ~/containers-prepare-parameter.yaml \
        -e /home/stack/templates/custom.yaml \
        -e /home/stack/templates/scheduler_hints_env.yaml \
        -e /home/stack/templates/ips-from-pool-all.yaml \
	--networks-file /home/stack/templates/network_data.yaml \
	--vip-file /home/stack/templates/vip-data.yaml \
	-r /home/stack/templates/roles_data.yaml \
	--disable-validations \
	2>&1 |tee overcloud_deploy.log
#        -e /home/stack/templates/hostname-map.yaml \
#	--networks-file /home/stack/templates/network_data.yaml \
#	--vip-file /home/stack/templates/vip-data.yaml \
#	-e ~/overcloud-baremetal-deployed.yaml \
#	-e templates/tripleo-ansible-inventory.yaml \
#       -e ~/templates/vip-deployed-environment.yaml \
#	--networks-file /home/stack/templates/network_data.yaml \
#	-p templates/plan.yaml \
#	-e ~/networks-deployed-environment.yaml \
#	-e /home/stack/templates/environments/deployed-ports.j2.yaml \
#	--networks-file /home/stack/templates/network_data.yaml \
#	-e ~/overcloud-baremetal-deployed.yaml \
#	-b /home/stack/templates/overcloud-baremetal-deploy.yaml \
#	-e ~/networks-deployed-environment.yaml \
#	-b /home/stack/templates/overcloud-baremetal-deploy.yaml \
#	--override-ansible-cfg /home/stack/templates/tripleo-ansible-inventory.yaml
