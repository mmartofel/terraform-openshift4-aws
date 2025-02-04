# Source that script to get access to your newly created cluster from bastion host
#
# $ source ./set-ocp-access.sh
# 
# then you can follow with your regulat oc operations like:
#
# $ oc get nodes
#
# and the other stuff you can do with oc or kubectl if you wish to

export KUBECONFIG=/home/ec2-user/terraform-ibm/installer-files/temp/auth/kubeconfig
export PATH=$PATH:/home/ec2-user/terraform-ibm/installer-files