# sir0p_infra
Boris Korzun Infra repository

Для прямого доступа по "ssh someinternalhost" мы можем добавить в
~/.ssh/config

Host bastion          # bastion host (the broker)
Hostname 35.217.9.133    # Change this IP address to the address of the broker
#User myusername         # Change this default user accordingly
                         # (`user@bastion` can overwrite it)
Host someinternalhost    # the target host
ProxyCommand ssh -q bastion nc -q0 10.128.0.2 22

Так же можно воспользоваться nat, vpn сервисами gcp или прописать aliase для команд
