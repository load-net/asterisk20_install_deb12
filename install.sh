cd /usr/src
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz
tar xzvf /usr/src/asterisk-20-current.tar.gz
cd /usr/src/asterisk-20.6.0/
contrib/scripts/install_prereq install
echo ################ ./configure --with-pjproject-bundled ###################################
cd /usr/src/asterisk-20.6.0/
./configure --with-pjproject-bundled

make -j4 && make install && make samples && make config && ldconfig

adduser --system --group --home /var/lib/asterisk --no-create-home --gecos "Asterisk" asterisk
usermod -a -G dialout,audio asterisk
chown -R asterisk: /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
echo " ################### Накатили права ################################### "
for ((i=0; i<5; i++))
do
    echo -n "."
    sleep 2
done
sed -i 's/;runuser = asterisk/runuser = asterisk/' /etc/asterisk/asterisk.conf
sed -i 's/;rungroup = asterisk/rungroup = asterisk/' /etc/asterisk/asterisk.conf
sed -i 's";\[radius\]"\[radius\]"g' /etc/asterisk/cdr.conf
sed -i 's";radiuscfg => /usr/local/etc/radiusclient-ng/radiusclient.conf"radiuscfg => /etc/radcli/radiusclient.conf"g' /etc/asterisk/cdr.conf
sed -i 's";radiuscfg => /usr/local/etc/radiusclient-ng/radiusclient.conf"radiuscfg => /etc/radcli/radiusclient.conf"g' /etc/asterisk/cel.conf
echo "################### ПОЧТИ ВСЕ ###################################"
systemctl restart asterisk

for ((i=0; i<5; i++))
do
    echo -n "."
    sleep 2
done
systemctl start asterisk && systemctl enable asterisk 
sleep 1
asterisk -rvvvvvvvvvvv
