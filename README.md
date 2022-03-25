# Опис
  
runner.sh - ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) bash-скрипт для Linux-машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)  
Також він автоматично оновлює не лише свій скрипт та цілі, а й скрипти з mhddos_proxy та MHDDoS: https://github.com/alexnest-ua/auto_mhddos_test/blob/7e7ad084240b54756519e4ebcace3683948c4de2/runner.sh#L44  
Також мій скрипт імітує роботу людини (вимикає увесь ДДоС на 1-10 (рандомно) хвилин, тобто вашу машину 95% не забанять, якщо правильно підібрати кількість потоків: https://github.com/alexnest-ua/auto_mhddos_test/blob/24581b9f03280abb449062578040d65fc1097432/runner.sh#L109  
Скрипт розподіляє список машин по різним цілям

## Налаштування (встановлення)
  
* щоб скачати на Linux-машину:  
```shell
cd ~  
sudo rm -r auto_mhddos_test
sudo apt install git -y  
git clone https://github.com/alexnest-ua/auto_mhddos_test.git 
```
  
**ОБОВ'ЯЗКОВО** - запуск файлу, який встановить скрипти MHDDoS та усі залежності (один раз на новій машині):
```shell
cd ~/auto_mhddos_test
bash setup.sh
```
*чекаємо 5-10 хвилин поки все встановиться.*  

## Запуск на роботу у фоні (24/7 на Linux-сервері) - можна закривати термінал
Запуск автоматичного ДДоСу:  
```shell 
cd ~/auto_mhddos_test
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
cd ~/auto_mhddos_test
```
1. ***Для лінивих*** (буде обрано за замовчуванням: num_of_copies=1, threads=500 rpc=100 debug="" (1 ціль, 500 потоків, 100 запитів на проксі, без дебагу)
```shell
screen -S "runner" bash runner.sh 
```
2. Слаба машина(1 CPU + 1-2 GB RAM):
```shell
screen -S "runner" bash runner.sh 1 300 100 
```
3. Середня машина(2 CPUs + 2-4 GB RAM), саме ці параметри за замовчуванням:
```shell
screen -S "runner" bash runner.sh 1 500 100
```
4. Середня+ машина(2-4 CPUs + 4-8 GB RAM):
```shell
screen -S "runner" bash runner.sh 2 1500 200
```
5. Нормальна машина(4 CPUs + 8 GB RAM):
```shell
screen -S "runner" bash runner.sh 3 2000 250
```
6. Потужна машина(4+ CPUs + 8+ CB RAM):
```shell
screen -S "runner" bash runner.sh all 3000 500
```
  
*також ви можете змінювати параметри на будь-які інші значення, але я рекомендую саме ці.*  
*також можете додавати останнім **4-тим** параметром --debug, що слідкувати за ходом атаки, наприклад:*  
```shell
screen -S "runner" bash runner.sh 1 500 100 --debug
```

* Приклад БЕЗ параметру --debug:
![image](https://user-images.githubusercontent.com/74729549/160018092-45e2e40d-f70c-4f6b-af14-6d0066dee1c7.png)
* Приклад З параметром --debug:
![image](https://user-images.githubusercontent.com/74729549/160018182-991ee42a-1ff0-434c-86fc-453b7909e96d.png)


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
sudo pkill -f runner.sh
sudo pkill -f runner.py
sudo pkill -f ./start.py
```

* щоб знову від'єднатися, та залишити його працювати:  
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
  
Якщо немає Docker на машині(ВСТАНОВІТЬ НА МАЙБУТНЄ, бо можуть бути проблеми з python-скриптом, у зв'язку з кривими правками від розробників(якщо таке буде я автоматично переведу скрипт на docker)):  
```shell
cd auto_mhddos_test
bash install_docker.sh
```    
* якщо цікаво, чи запустилася docker-команда пропишіть це(ЗАРАЗ НЕ АКТУАЛЬНО):
```shell 
sudo docker ps -af ancestor=ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest  
```
Вам видасть список запущенних контейнерів

УВАГА!!! Скрипт при рестарті (кожні 10-20 хвилин) вбиває старі запущені скрипти саме з MHDDoSом, тому якщо запускаєте цей скрипт на машині-Linux, то інший MHDDoS запускайте лише через docker, або на іншій машині-Linux
  
## Список цілей  

  
runner.sh підтримує единий [список цілей](https://raw.githubusercontent.com/alexnest-ua/auto_mhddos_test/main/runner_targets), який можна тримати на github і постійно оновлювати.  
  
  
  
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються на 'runner.py'.  
