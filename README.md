# Опис
 
runner.sh - ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) bash-скрипт для Linux-машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)      
Також він автоматично оновлює не лише свій скрипт та цілі, а й скрипт mhddos_proxy  
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 1-3 (рандомно) хвилин), тому знижується можливість блокування  
Увесь source code знаходиться тут: https://github.com/alexnest-ua/auto_mhddos_alexnest/blob/main/runner.sh  

[**Варіант для Mac**](https://github.com/alexnest-ua/auto_mhddos_mac)  
[**Варіант для Windows**](https://github.com/alexnest-ua/runner_for_windows)  
[**Варіант для Docker**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker)   
[**Варіант для Android**](https://telegra.ph/mhddos-proxy-for-Android-with-Termux-03-31)   
  

[**Запуск у фон**](#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%BD%D0%B0-%D1%80%D0%BE%D0%B1%D0%BE%D1%82%D1%83-%D1%83-%D1%84%D0%BE%D0%BD%D1%96-247-%D0%BD%D0%B0-linux-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D1%96---%D0%BC%D0%BE%D0%B6%D0%BD%D0%B0-%D0%B7%D0%B0%D0%BA%D1%80%D0%B8%D0%B2%D0%B0%D1%82%D0%B8-%D1%82%D0%B5%D1%80%D0%BC%D1%96%D0%BD%D0%B0%D0%BB)  
[**Повернення до фонового процесу**](#%D0%BF%D0%BE%D0%B2%D0%B5%D1%80%D0%BD%D0%B5%D0%BD%D0%BD%D1%8F-%D0%B4%D0%BE-%D1%84%D0%BE%D0%BD%D0%BE%D0%B2%D0%BE%D0%B3%D0%BE-%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%83)
  
Канал, де координуються цілі: https://t.me/ddos_separ (звідти і беруться сюди цілі, тому якщо у вас на Linux запущено цей скрипт - то можете відповчивати, він все зробить за вас)  
чат де ви можете задати свої питання: https://t.me/+8swDHSe_ROI5MmJi  
також можете писати мені в особисті у телеграм, я завжди усім відповідаю: @brainqdead
  
Туторіал по створенню автоматичних та автономних Linux-серверів: https://auto-ddos.notion.site/dd91326ed30140208383ffedd0f13e5c  

## Запуск на роботу у фоні (24/7 на Linux-сервері) - можна закривати термінал
Запуск автоматичного ДДоСу:  
```shell 
cd ~  
sudo rm -rf auto_mhddos_alexnest
sudo apt install git screen -y  
sudo git clone https://github.com/alexnest-ua/auto_mhddos_alexnest
cd ~/auto_mhddos_alexnest
screen -S "runner" bash runner.sh  
```  
  
Натискаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
якщо все успішно буде повідомлення [detached from runner]  

* Буде запущено атаку з параметрами за замовчуванням в залежності від кількості ядер вашого ПК
  
Далі кожні воно буде оновлювати саме список проксі, цілі атаки та перевіряти наявність оновлення (та встановлювати його якщо воно є)  
  

Щоб повернутися до процесу та/або **вбити** фоновий процес [читайте це](#%D0%BF%D0%BE%D0%B2%D0%B5%D1%80%D0%BD%D0%B5%D0%BD%D0%BD%D1%8F-%D0%B4%D0%BE-%D1%84%D0%BE%D0%BD%D0%BE%D0%B2%D0%BE%D0%B3%D0%BE-%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%83)


## Повернення до фонового процесу
* щоб подивитися що там працює у фоні:  
```shell 
screen -ls  
```
* щоб перейти до процесу та дізнатися як у нього справи (що він виводить), пишіть:  
```shell 
screen -r runner  
```
Після цього, якщо хочете **ВБИТИ** процес - натискайте Ctrl+C(або якщо не спрацює - у іншому вікні пишіть `sudo pkill -e -f runner`)  
у випадку якщо вбили успішно буде повідомлення: [screen is terminating]  

* щоб знову від'єднатися, та залишити його працювати:  
Настикаємо Ctrl+A , потім Ctrl+D - І ВСЕ ГОТОВО - ПРАЦЮЄ В ФОНІ  
