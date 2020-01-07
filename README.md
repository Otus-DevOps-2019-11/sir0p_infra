# sir0p_infra
Boris Korzun Infra repository

bastion_IP = 35.217.9.133
someinternalhost_IP = 10.128.0.2

testapp_IP = 34.70.172.79
testapp_port = 9292


Для создания правила брэндмауэра.

gcloud compute --project=infra-264217 firewall-rules create default-puma-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --target-tags=puma-server

gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone us-central1-a \
  --metadata startup-script-url=gs://sir0p-us-central1-a/startup_script



Для прямого доступа по "ssh someinternalhost" мы можем добавить в
~/.ssh/config

Host bastion          # bastion host (the broker)
Hostname 35.217.9.133    # Change this IP address to the address of the broker
#User myusername         # Change this default user accordingly
                         # (`user@bastion` can overwrite it)
Host someinternalhost    # the target host
ProxyCommand ssh -q bastion nc -q0 10.128.0.2 22

Так же можно воспользоваться nat, vpn сервисами gcp или прописать aliase для команд
