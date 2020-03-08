# sir0p_infra

[![Build Status](https://travis-ci.com/Otus-DevOps-2019-11/sir0p_infra.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2019-11/sir0p_infra)

Boris Korzun Infra repository
#HW 11 Ansible-3
Перенес плейбуки в раздельные роли
описал два окружения
Использовал плейбук из galaxy для nginx, и добавил его использоване для проксирования запросов с порта 80 на порт приложения (9292)
Зашифровал ansible-vault данные пользователей.
Установил trytravis и создал для него рабочий репозиторий.
Добавил в travis данный репозиторий
Форкнул репозиторий с тестами OTUS, адаптировал его под условия задачи (проверка всех шаблонов, terraform validate, tflint, ansible-lint)
добавил необходимые экслюды для линтера.
добавил бейдж

#HW 10
создал {{ необходимые }} роли.

В созаднии со звездочкой, подключил динамическое инвентори с помощью плугина gcp_compute, для этого пришлость обновить ansible и добавить зависимости.
Разобрался как передать ip адрес базы между пьесами с помощью magic vars
Изменил провижионер в app и db json файлах packer




#HW9 ansible-1

После удаления каталога с репозиторием коммандой ansible app -m command -a 'rm -rf
~/reddit'
выполнение плейбука выполняет клонирование заново

*
создаем json конфиг, например с помощью "ansible-inventory  --list --export > inventory.json", убирем лишнее - ungrouped
пишем "скрипт" который возращает его содержимое.
Задача выполена.



#HW8
Создал корзину storage-bucket_url = gs://production-storage-bucket-infra-264217
настройл терраформ для stage и prod на работу с удаленным бэкендом
Одновременно запустить нельзя. т.к. применение prod и stage переводит одну и ту же инфраструктуру из одного состояние в другое,
данный пример нужен для проверки работы блокировки одновременного запуска изменения при работе в комманде.
Блокировка работает.

Добавил провижинер




#HW7
добавление ключей одной строкой без разделителей - не очевидно
после добавления может повиснуть ВМ
terraform заменяет существующие данные metadata и в частности удалет ключи не указанные в конфигурации


#HW5

Для развертывания приложения с образа
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family reddit-full \
  --image-project=infra-264217 \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone us-central1-a
```

#HW 4
testapp_IP = 34.70.172.79
testapp_port = 9292


Для создания правила брэндмауэра.
```
gcloud compute --project=infra-264217 firewall-rules create default-puma-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --target-tags=puma-server
```
Для развертывания приложения с startup_script размещенным в bucket
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --zone us-central1-a \
  --metadata startup-script-url=gs://sir0p-us-central1-a/startup_script
```


#HW 3

bastion_IP = 35.217.9.133

someinternalhost_IP = 10.128.0.2


Для прямого доступа по "ssh someinternalhost" мы можем добавить в
~/.ssh/config
```
Host bastion          # bastion host (the broker)
Hostname 35.217.9.133    # Change this IP address to the address of the broker
#User myusername         # Change this default user accordingly
                         # (`user@bastion` can overwrite it)
Host someinternalhost    # the target host
ProxyCommand ssh -q bastion nc -q0 10.128.0.2 22
```
Так же можно воспользоваться nat, vpn сервисами gcp или прописать aliase для команд
