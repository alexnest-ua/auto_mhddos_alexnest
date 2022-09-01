# Опис docker

### ЯКЩО ВИ КОРИСТУВАЧ WINDOWS, ТО ЗАБУДЬТЕ ПРО ДОКЕР, БО ЦЕ ВІРТУАЛКА, ЯКА ЖРЕ УВЕСЬ ПРОЦЕССОР, ТА ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/runner_for_windows  
### ЯКЩО ВИ КОРИСТУВАЧ MAC - ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/auto_mhddos_mac
### ЯКЩО ВИ КОРИСТУВАЧ LINUX - ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/auto_mhddos_alexnest
  
### ЯКЩО ВИ ТАКИ ХОЧЕТЕ НАСИЛУВАТИ СВІЙ ПРОЦЕСОР ДОКЕРОМ - РОБІТЬ ТЕ ЩО НИЖЧЕ:  

ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) docker-контейнер для будь-яких машин   
Також він автоматично оновлює не лише свій скрипт та цілі, а й скрипт mhddos_proxy та proxy_finder 
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 1-2 (рандомно) хвилин), щоб дати машині трохи відпочити 
Увесь source code знаходиться тут: https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker  
  
[**Налаштування**](#%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F)  
[**Запуск у фон**](#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%BD%D0%B0-%D1%80%D0%BE%D0%B1%D0%BE%D1%82%D1%83-%D1%83-%D1%84%D0%BE%D0%BD%D1%96-247-%D0%BD%D0%B0-linux-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D1%96-%D1%82%D0%B0-%D0%B4%D0%BE-%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%BD%D1%8F-%D1%80%D0%BE%D0%B1%D0%BE%D1%82%D0%B8-%D0%BD%D0%B0-windows---%D0%BC%D0%BE%D0%B6%D0%BD%D0%B0-%D0%B7%D0%B0%D0%BA%D1%80%D0%B8%D0%B2%D0%B0%D1%82%D0%B8-%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB)  
 
[**Подивитися що там працює у фоні(для Linux додайте sudo на початку) та ВБИТИ процес**](#%D0%BF%D0%BE%D0%B4%D0%B8%D0%B2%D0%B8%D1%82%D0%B8%D1%81%D1%8F-%D1%89%D0%BE-%D1%82%D0%B0%D0%BC-%D0%BF%D1%80%D0%B0%D1%86%D1%8E%D1%94-%D1%83-%D1%84%D0%BE%D0%BD%D1%96%D0%B4%D0%BB%D1%8F-linux-%D0%B4%D0%BE%D0%B4%D0%B0%D0%B9%D1%82%D0%B5-sudo-%D0%BD%D0%B0-%D0%BF%D0%BE%D1%87%D0%B0%D1%82%D0%BA%D1%83-%D1%82%D0%B0-%D0%B2%D0%B1%D0%B8%D1%82%D0%B8-%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81)

Канал, де координуються цілі: https://t.me/ddos_separ (звідти і беруться сюди цілі, тому якщо у вас на Linux запущено цей скрипт - то можете відпочивати, він все зробить за вас)  
Чат, де ви можете задати свої питання: https://t.me/+8swDHSe_ROI5MmJi  
Також можете писати мені в особисті у телеграм, я завжди усім відповідаю: @brainqdead  
  
Туторіал по створенню автоматичних та автономних Linux-серверів: https://auto-ddos.notion.site/dd91326ed30140208383ffedd0f13e5c  

## Налаштування (встановлення)
  
* щоб скачати на Windows / Mac:  
https://www.docker.com/get-started/ (якщо виникають якісь проблеми: пишіть мені @brainqdead (телеграм))

* щоб скачати на Linux-машину(але краще ставте напряму: https://github.com/alexnest-ua/auto_mhddos_alexnest ):  
```
sudo apt update -y
sudo apt upgrade -y
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update -y
sudo apt remove docker docker-engine docker.io -y
sudo apt install docker-ce -y
sudo systemctl unmask docker.service
sudo systemctl unmask docker.socket
sudo systemctl start docker.service
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world
docker run -it --rm --pull always alexnestua/auto_mhddos
```
  
*чекаємо 5-10 хвилин поки все встановиться.*  

## Запуск на роботу у фоні (24/7 на Linux-сервері та до завершення роботи на Windows) - можна закривати термінал
Запуск автоматичного ДДоСу(без виведення на екран):  
```
docker run -itd --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 
```
* Буде запущено атаку з наступними параметрами за замовчуванням в залежності від вашого ПК



Далі воно буде автоматично оновлювати список проксі, цілі атаки та сам скрипт  

### Подивитися що там працює у фоні(для Linux додайте sudo на початку) та ВБИТИ процес:  
```shell
docker ps  -a
```
щоб вбити запущені раніше фонові Docker підпроцеси на Linux прописуєте:  
```shell
sudo docker kill $(sudo docker ps -aqf name=alexnestua)
```
або на Windows зайти у Docker Dekstop -> Containers / Apps -> Видалити container з ім'ям alexnestua

## Thanks

Special thanks to https://github.com/OleksandrBlack and https://twitter.com/SprechenFuehrer  
