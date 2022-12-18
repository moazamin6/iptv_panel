#! /bin/bash
kill $(ps aux | grep 'smartcodes' | grep -v grep | grep -v 'start_services.sh' | awk '{print $2}') 2>/dev/null
sleep 1
kill $(ps aux | grep 'smartcodes' | grep -v grep | grep -v 'start_services.sh' | awk '{print $2}') 2>/dev/null
sleep 1
kill $(ps aux | grep 'smartcodes' | grep -v grep | grep -v 'start_services.sh' | awk '{print $2}') 2>/dev/null
sleep 4
rm -f /home/smartcodes/iptv_xtream_codes/php/*.pid
sudo -u smartcodes /home/smartcodes/iptv_xtream_codes/php/bin/php /home/smartcodes/iptv_xtream_codes/crons/setup_cache.php
sudo -u smartcodes /home/smartcodes/iptv_xtream_codes/php/bin/php /home/smartcodes/iptv_xtream_codes/tools/signal_receiver.php >/dev/null 2>/dev/null &
sudo -u smartcodes /home/smartcodes/iptv_xtream_codes/php/bin/php /home/smartcodes/iptv_xtream_codes/tools/pipe_reader.php >/dev/null 2>/dev/null &
chown -R smartcodes:smartcodes /sys/class/net
chown -R smartcodes:smartcodes /home/smartcodes 2>/dev/null
sleep 4
/home/smartcodes/iptv_xtream_codes/nginx_rtmp/sbin/nginx_rtmp
/home/smartcodes/iptv_xtream_codes/nginx/sbin/nginx
/sbin/start-stop-daemon --start --quiet --pidfile /home/smartcodes/iptv_xtream_codes/php/VaiIb8.pid --exec /home/smartcodes/iptv_xtream_codes/php/sbin/php-fpm -- --daemonize --fpm-config /home/smartcodes/iptv_xtream_codes/php/etc/VaiIb8.conf
/sbin/start-stop-daemon --start --quiet --pidfile /home/smartcodes/iptv_xtream_codes/php/JdlJXm.pid --exec /home/smartcodes/iptv_xtream_codes/php/sbin/php-fpm -- --daemonize --fpm-config /home/smartcodes/iptv_xtream_codes/php/etc/JdlJXm.conf
/sbin/start-stop-daemon --start --quiet --pidfile /home/smartcodes/iptv_xtream_codes/php/CWcfSP.pid --exec /home/smartcodes/iptv_xtream_codes/php/sbin/php-fpm -- --daemonize --fpm-config /home/smartcodes/iptv_xtream_codes/php/etc/CWcfSP.conf
