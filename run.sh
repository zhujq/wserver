#!/bin/bash
export USER=root
mkdir -p /v2ray
cd /v2ray
wget -O v2ray.zip http://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip v2ray.zip 
if [ ! -f "v2ray" ]; then
  mv /v2ray/v2ray-v$VER-linux-64/v2ray .
  mv /v2ray/v2ray-v$VER-linux-64/v2ctl .
  mv /v2ray/v2ray-v$VER-linux-64/geoip.dat .
  mv /v2ray/v2ray-v$VER-linux-64/geosite.dat .
fi

cp -f /config.json .
chmod +x v2ray
V2RAY_VMESS_AEAD_FORCED=false nohup ./v2ray run> /dev/null 2>&1 &
cd /
./server