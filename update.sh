echo 'download gfw.txt'
curl -OL https://github.com/openwrt-cc/dnsmasq/raw/master/gfw.txt

echo 'clear /etc/dnsmasq.d/gfw.conf'
echo -n "" > /etc/dnsmasq.d/gfw.conf

echo 'generate new gfw.conf'
for i in `cat gfw.txt`; do echo "server=/"$i"/8.8.8.8" >> /etc/dnsmasq.d/gfw.conf; echo "ipset=/"$i"/GFW"  >> /etc/dnsmasq.d/gfw.conf; done

echo 'remove gfw.txt'
rm -rf gfw.txt

echo 'restart dnsmasq'
/etc/init.d/dnsmasq restart
