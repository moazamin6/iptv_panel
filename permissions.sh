#!/bin/bash
sudo chmod -R 777 /home/smartcodes 2>/dev/null
sudo find /home/smartcodes/admin/ -type f -exec chmod 644 {} \; 2>/dev/null
sudo find /home/smartcodes/admin/ -type d -exec chmod 755 {} \; 2>/dev/null
sudo find /home/smartcodes/wwwdir/ -type f -exec chmod 644 {} \; 2>/dev/null
sudo find /home/smartcodes/wwwdir/ -type d -exec chmod 755 {} \; 2>/dev/null
sudo chmod +x /home/smartcodes/nginx/sbin/nginx 2>/dev/null
sudo chmod +x /home/smartcodes/nginx_rtmp/sbin/nginx_rtmp 2>/dev/null
sudo chmod 400 /home/smartcodes/config 2>/dev/null
