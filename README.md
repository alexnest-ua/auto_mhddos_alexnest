# Опис docker

# ЯКЩО ВИ КОРИСТУВАЧ WINDOWS, ТО ЗАБУДЬТЕ ПРО ДОКЕР, БО ЦЕ ВІРТУАЛКА, ЯКА ЖРЕ УВЕСЬ ПРОЦЕССОР, ТА ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/runner_for_windows
  
ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) docker-контейнер для будь-яких машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)  
Також він автоматично оновлює не лише цілі, а й скрипти з mhddos_proxy та MHDDoS  
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 2-6 (рандомно) хвилин), тому знижується можливість блокування  
Скрипт розподіляє список машин по різним цілям: https://github.com/alexnest-ua/targets/blob/main/targets_docker  
Увесь source code знаходиться тут: https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker  
  
[**Налаштування**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker#%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F)
[**Запуск команд**](

Канал, де координуються цілі: https://t.me/ddos_separ (звідти і беруться сюди цілі, тому якщо у вас на Linux запущено цей скрипт - то можете відпочивати, він все зробить за вас)  
Чат, де ви можете задати свої питання: https://t.me/+8swDHSe_ROI5MmJi  
Також можете писати мені в особисті у телеграм, я завжди усім відповідаю: @brainqdead  
  
Туторіал по створенню автоматичних та автономних Linux-серверів: https://auto-ddos.notion.site/dd91326ed30140208383ffedd0f13e5c  

## Налаштування (встановлення)
  
* щоб скачати на Windows / Mac:  
https://www.docker.com/get-started/ (якщо виникають якісь проблеми: пишіть мені @brainqdead (телеграм)

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

## Запуск на роботу у фоні (24/7 на Linux-сервері) - можна закривати термінал
Запуск автоматичного ДДоСу(без виведення на екран):  
```
docker run -itd --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 
```

**!!!УВАГА!!!** контейнер підтримує наступні параметри (САМЕ У ТАКОМУ ПОРЯДКУ ТА ЛИШЕ У ТАКІЙ КІЛЬКОСТІ(мінімум 3)), але можно і без них:  
docker run -it --rm --pull always --name alexnest alexnestua/auto_mhddos [num_of_copies] [threads] [rpc] [debug]  
- num_of_copies - кількість атакуємих за один прохід цілей
- threads - кількість потоків на кожне ядро процесора
- rpc - кількість запитів на проксі перед відправкою на ціль
- debug - можливість дебагу (якщо хочете бачити повний інфу по атаці - у 4-ий параметр додайте --debug)
  
### Приклади команд з різними параметрами(для Linux додавайте sudo, або краще ставте на пряму: https://github.com/alexnest-ua/auto_mhddos_alexnest):

1. ***Для лінивих*** (буде обрано за замовчуванням: num_of_copies=1, threads=3000 rpc=1000 debug="" (1 ціль, 3000 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу)
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest
```
**CPUs** - це потоки вашого процесора (не ядра) - зазвичай потоків у два рази більше ніж ядер  

2. Слаба машина(1 CPU + 1-2 GB RAM), саме ці параметри за замовчуванням:
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 1 3000 1000
```

3. Середня машина(2-4 CPUs + 2-8 GB RAM):
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 1 5000 2000
```

4. Нормальна машина(4-8 CPUs + 8-16 GB RAM):
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 2 6000 2000
```

6. Потужна машина(9+ CPUs + 16+ CB RAM):
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest all 6000 5000
```

Після цього, якщо хочете вбити процес - натискайте Ctrl+C  (у його відкритій вкладці)  

*також ви можете змінювати параметри на будь-які інші значення, але я рекомендую саме ці.*  
*також можете додавати останнім **4-тим** параметром --debug, що слідкувати за ходом атаки, наприклад:*  
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 1 3000 1000 --debug
```

* Приклад БЕЗ параметру --debug:
![image](https://github.com/alexnest-ua/special_files/blob/main/screenshots/docker_no_debug.png?raw=true)
* Приклад З параметром --debug:
![image](https://github.com/alexnest-ua/special_files/blob/main/screenshots/docker_debug.png?raw=true)

* щоб подивитися що там працює у фоні(для Linux додайте sudo) та вбити процес:  
```
docker ps  -a
щоб вбити запущені раніше фонові підпроцеси на Linux прописуєте:  
sudo docker kill $(docker ps -aqf name=alexnestua)
або на Windows зайти у Docker Dekstop -> Containers / Apps -> Видалити container з ім'ям alexnestua
```



## Список цілей  

  
alexnestua/auto_mhddos підтримує єдиний [список цілей](https://github.com/alexnest-ua/targets/blob/main/targets_docker), який можна тримати на github і постійно оновлювати.  
  
    
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються не на #.  

## Thanks

Special thanks to https://github.com/OleksandrBlack and https://twitter.com/SprechenFuehrer  
