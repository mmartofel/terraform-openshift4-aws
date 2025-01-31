
# Generate SSH keys that can be used to connect to your newly created cluster machines.

ssh-keygen -t ed25519 -N '' -f id_ed25519 

# Not used for default, preserved for not standard mods.
#
# ssh-keygen -t rsa -N '' -f id_rsa 
# ssh-keygen -t rsa -b 4096 -f id_rsa


