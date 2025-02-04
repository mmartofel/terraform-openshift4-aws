# Once you run terraform apply after a while you can track ocp cluster installation progress
#

./installer-files/openshift-install wait-for install-complete --dir installer-files/temp --log-level=debug

