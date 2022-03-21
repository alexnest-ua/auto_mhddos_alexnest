## Опис

### runner.sh - скрипт на bash, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)

НА БЕЗКОШТОВНИХ AMAZON МАШИНАХ КРАЩЕ НЕ ЗАПУСКАЙТЕ, БО ЇМ ПОГАНО НАВІТЬ ВІД 1000 ПОТОКІВ НА 5 ЦІЛЕЙ  
  
  
* щоб запустити на нормальній Лінукс-машині:  
```shell
cd ~  
sudo rm -r auto_mhddos_alexnest
sudo apt install git -y  
git clone https://github.com/alexnest-ua/auto_mhddos_alexnest.git 
```
Якщо немає Docker а на машині(він потрібен зараз):  
```shell
cp ~/auto_mhddos_alexnest/install_docker.sh ~
bash install_docker.sh
```
```shell 
cp ~/auto_mhddos_alexnest/runner.sh ~  
screen -S "runner" bash runner.sh  
```
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  
  
* щоб подивитися що там працює у фоні:  
```shell 
sudo screen -ls  
```
* щоб перейти до процесу та дізнатися як у нього справи (що він виводить), пишіть:  
```shell 
screen -r runner  
```
Після цього, якщо хочете вбити процес - натискайте Ctrl+C  

* щоб знову від'єднатися, та залишити його працювати:  
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
  
  
## Список цілей  

  

runner.sh підтримує единий [список цілей](https://raw.githubusercontent.com/alexnest-ua/auto_mhddos/main/runner_targets), який можна тримати на github і постійно оновлювати.  
  
  
  
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються на 'runner.py'.  
