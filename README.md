# Опис
  
runner.sh - ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) bash-скрипт для Linux-машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)  
Також він автоматично оновлює не лише свій скрипт та цілі, а й скрипти з mhddos_proxy та MHDDoS: https://github.com/alexnest-ua/auto_mhddos_alexnest/blob/0566b426a4960b283024a37b6995c5b8260d2795/runner.sh#L46
Також мій скрипт імітує роботу людини (вимикає увесь ДДоС на 2-6 (рандомно) хвилин, тобто вашу машину 95% не забанять, якщо правильно підібрати кількість потоків: https://github.com/alexnest-ua/auto_mhddos_alexnest/blob/0566b426a4960b283024a37b6995c5b8260d2795/runner.sh#L132
Скрипт розподіляє список машин по різним цілям  
  
чат де координуються цілі: https://t.me/ddos_separ (звідти і беруться сюди цілі, тому якщо у вас на Linux запущено цей скрипт - то можете відповчивати, він все зробить за вас)  
чат де ви можете задати свої питання: https://t.me/+8swDHSe_ROI5MmJi  
також можете писати мені в особисті у телеграм, я завжди усім відповідаю: @brainqdead
  
Туторіал по створенню автоматичних та автономних Linux-серверів: https://auto-ddos.notion.site/dd91326ed30140208383ffedd0f13e5c  

## Налаштування (встановлення)
  
* щоб скачати на Linux-машину:  
```shell
cd ~  
sudo rm -r auto_mhddos_alexnest
sudo apt install git -y  
git clone https://github.com/alexnest-ua/auto_mhddos_alexnest
```
  
**ОБОВ'ЯЗКОВО** - запуск файлу, який встановить скрипти MHDDoS та усі залежності (один раз на новій машині):
```shell
cd ~/auto_mhddos_alexnest
bash setup.sh
```
*чекаємо 5-10 хвилин поки все встановиться.*  

## Запуск на роботу у фоні (24/7 на Linux-сервері) - можна закривати термінал
Запуск автоматичного ДДоСу:  
```shell 
cd ~/auto_mhddos_alexnest
screen -S "runner" bash runner.sh  
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

**!!!УВАГА!!!** runner.sh підтримує наступні параметри (САМЕ У ТАКОМУ ПОРЯДКУ ТА ЛИШЕ У ТАКІЙ КІЛЬКОСТІ(мінімум 3)), але можно і без них:  
runner.sh [num_of_copies] [threads] [rpc] [debug]  
- num_of_copies - кількість атакуємих за один прохід цілей
- threads - кількість потоків на кожне ядро процесора
- rpc - кількість запитів на проксі перед відправкою на ціль
- debug - можливість дебагу (якщо хочете бачити повний інфу по атаці - у 4-ий параметр додайте --debug)
  
### Приклади команд з різними параметрами:
перед уведенням команд обов'язково зробити ось це:
```shell
cd ~/auto_mhddos_alexnest
```
1. ***Для лінивих*** (буде обрано за замовчуванням: num_of_copies=1, threads=3000 rpc=1000 debug="" (1 ціль, 3000 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу)
```shell
screen -S "runner" bash runner.sh 
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

2. Слаба машина(1 CPU + 1-2 GB RAM), саме ці параметри за замовчуванням:
```shell
screen -S "runner" bash runner.sh 1 2000 1000
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

3. Середня машина(2 CPUs + 2-4 GB RAM):
```shell
screen -S "runner" bash runner.sh 1 5000 2000
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

4. Середня+ машина(2-4 CPUs + 4-8 GB RAM):
```shell
screen -S "runner" bash runner.sh 1 6000 2000
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

5. Нормальна машина(4-8 CPUs + 8-16 GB RAM):
```shell
screen -S "runner" bash runner.sh 2 6000 2000
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

6. Потужна машина(8+ CPUs + 16+ GB RAM):
```shell
screen -S "runner" bash runner.sh all 10000 5000
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

  
*також ви можете змінювати параметри на будь-які інші значення, але я рекомендую саме ці.*  
*також можете додавати останнім **4-тим** параметром --debug, що слідкувати за ходом атаки, наприклад:*  
```shell
screen -S "runner" bash runner.sh 1 3000 1000 --debug
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  


* Приклад БЕЗ параметру --debug:
![image](https://user-images.githubusercontent.com/74729549/161614083-dc5ee162-f3cf-4b0f-8ccf-7874bf9d224a.png)
* Приклад З параметром --debug:
![image](https://user-images.githubusercontent.com/74729549/161614196-b8e778a1-3131-4c66-a371-7579d1489869.png)


* щоб подивитися що там працює у фоні:  
```shell 
screen -ls  
```
* щоб перейти до процесу та дізнатися як у нього справи (що він виводить), пишіть:  
```shell 
screen -r runner  
```
Після цього, якщо хочете вбити процес - натискайте Ctrl+C  
щоб вбити усі підпроцеси прописуєте (У ІНШОМУ ВІКНІ ТЕРМІНАЛУ):  
```shell
sudo pkill -e -f runner.sh
sudo pkill -e -f runner.py
sudo pkill -e -f ./start.py
```

* щоб знову від'єднатися, та залишити його працювати:  
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
  
Якщо немає Docker на машині(ВСТАНОВІТЬ НА МАЙБУТНЄ, бо можуть бути проблеми з python-скриптом, у зв'язку з кривими правками від розробників(якщо таке буде я автоматично переведу скрипт на docker)):  
```shell
git clone https://github.com/alexnest-ua/auto_mhddos_alexnest
cd ~/auto_mhddos_alexnest
bash install_docker.sh
```    

Запуск атак через Docker: https://hub.docker.com/r/alexnestua/auto_mhddos  
  

* якщо цікаво, чи запустилася docker-команда пропишіть це:
```shell 
sudo docker ps -af ancestor=alexnestua/auto_mhddos  
```
Вам видасть список запущенних контейнерів  
  
щоб вбити запущені docker-контейнери з mhddos_proxy пишіть це:
```shell
sudo docker kill $(sudo docker ps -aqf ancestor=alexnestua/auto_mhddos) 
```

УВАГА!!! Скрипт при рестарті (кожні 10-20 хвилин) вбиває старі запущені скрипти саме з MHDDoSом, тому якщо запускаєте цей скрипт на машині-Linux, то інший MHDDoS запускайте лише через docker, або на іншій машині-Linux
  
## Список цілей  

  
runner.sh підтримує единий [список цілей](https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux), який можна тримати на github і постійно оновлювати.  
  
  
  
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються на 'runner.py'.  
