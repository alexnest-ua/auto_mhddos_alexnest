#Just in case kill previous copy of mhddos_proxy
sudo pkill -f runner.sh
sudo pkill -f runner.py
sudo pkill -f ./start.py

# Install git, python3
yay -S git gcc glibc libffi openssl python3 rust --noconfirm --needed
yay -S wget python-pip screen curl --noconfirm --needed

pip3 install --upgrade pip

ulimit -n 1048576

#Install latest version of mhddos_proxy and MHDDoS
cd ~
sudo rm -r mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd ~/mhddos_proxy
sudo pip3 install -r requirements.txt
cd ~/auto_mhddos_alexnest
