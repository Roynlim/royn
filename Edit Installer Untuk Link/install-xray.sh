#!/bin/bash
# XRay Installation
# Coded By Vinstechmy
# ==================================

# // Update & Installing Requirement
apt update -y
apt upgrade -y
apt install socat -y
apt install python -y
apt install curl -y
apt install wget -y
apt install sed -y
apt install nano -y
apt install python3 -y

# // Make Main Directory
mkdir -p /usr/local/Vinstechmy/

# // Installation XRay Core
wget -q -O /usr/local/Vinstechmy/xray-mini "https://raw.githubusercontent.com/tikikata/royn/main/EXTENSION/xray-mini" 
chmod +x /usr/local/Vinstechmy/xray-mini

# // Make XRay Mini Root Folder
mkdir -p /etc/xray-mini/
chmod 775 /etc/xray-mini/

# // Make Cek-Xray Path
mkdir -p /var/log/xray/

# // Installing XRay Mini Service
cat > /etc/systemd/system/xray-mini@.service << EOF
[Unit]
Description=XRay-Mini Service ( %i )
Documentation=https://vinstechmy-project.com https://github.com/XTLS/Xray-core
After=network.target nss-lookup.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/usr/local/Vinstechmy/xray-mini -config /etc/xray-mini/%i.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

# // String
ssl_path_crt="/etc/v2ray/v2ray.crt"
ssl_path_key="/etc/v2ray/v2ray.key"
Port1=6768
Port2=6769
uuid=$(cat /proc/sys/kernel/random/uuid)

# // Vless Direct
cat > /etc/xray-mini/vless-direct.json << END
{
    "log": {
        "access": "/var/log/xray/access.log",
        "error": "/var/log/xray/error.log",
        "loglevel": "info"
  },
  "inbounds": [
    {
      "port": ${Port1},
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid}",
            "flow": "xtls-rprx-direct"
#XRay
          }
        ],
        "decryption": "none",
        "fallbacks": [
          {
            "dest": 60000,
            "alpn": "",
            "xver": 1
          },
          {
            "dest": 60001,
            "alpn": "h2",
            "xver": 1
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
          "minVersion": "1.2",
          "certificates": [
            {
              "certificateFile": "${ssl_path_crt}",
              "keyFile": "${ssl_path_key}"
            }
          ]
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
END

# // Vless Splice
cat > /etc/xray-mini/vless-splice.json << END
{
    "log": {
        "access": "/var/log/xray/access.log",
        "error": "/var/log/xray/error.log",
        "loglevel": "info"
  },
  "inbounds": [
    {
      "port": ${Port2},
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid}",
            "flow": "xtls-rprx-splice"
#XRay
          }
        ],
        "decryption": "none",
        "fallbacks": [
          {
            "dest": 60000,
            "alpn": "",
            "xver": 1
          },
          {
            "dest": 60001,
            "alpn": "h2",
            "xver": 1
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
          "minVersion": "1.2",
          "certificates": [
            {
              "certificateFile": "${ssl_path_crt}",
              "keyFile": "${ssl_path_key}"
            }
          ]
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
END

# // Enable & Start Service
systemctl enable xray-mini@vless-direct
systemctl start xray-mini@vless-direct
systemctl enable xray-mini@vless-splice
systemctl start xray-mini@vless-splice

# // Downloading Menu
wget -q -O /usr/bin/add-xray "https://raw.githubusercontent.com/tikikata/royn/main/ADD/add-xray.sh"
wget -q -O /usr/bin/del-xray "https://raw.githubusercontent.com/tikikata/royn/main/DELETE/del-xray.sh"
wget -q -O /usr/bin/cek-xray "https://raw.githubusercontent.com/tikikata/royn/main/CEK/cek-xray.sh"
wget -q -O /usr/bin/renew-xray "https://raw.githubusercontent.com/tikikata/royn/main/RENEW/renew-xray.sh"
chmod +x /usr/bin/add-xray
chmod +x /usr/bin/del-xray
chmod +x /usr/bin/cek-xray
chmod +x /usr/bin/renew-xray

# // Remove Not Used Files
rm -f install-xray.sh
