#!/bin/sh
#显示时间
date

cat << EOF > /usr/local/etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": 8080,
    "listen":"127.0.0.1",
    "protocol": "vless",
    "settings": {
      "clients": [
        {
          "id": "c672fab4-24e2-45d7-a3cc-eb8ad15a3996",
          "level": 0       
        }
      ],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
      "path": "/mov"
      }     
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# start nginx
nginx
# Run V2Ray

/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json

