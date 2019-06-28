curl -OL https://github.com/openwrt-cc/dnsmasq/raw/master/gfw.txt

echo -n "" > /etc/dnsmasq.d/gfw.conf

for i in `cat gfw.txt`; do echo "server=/"$i"/8.8.8.8" >> /etc/dnsmasq.d/gfw.conf; echo "ipset=/"$i"/GFW"  >> /etc/dnsmasq.d/gfw.conf; done

rm -rf gfw.txt

/etc/init.d/dnsmasq restart
