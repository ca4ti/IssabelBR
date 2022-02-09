#!/bin/bash
clear
echo "+-+-+-+-+-+-+-+-+-+-+-+";
echo "|I|b|i|n|e|t|w|o|r|k|/|";
echo "+-+-+-+-+-+-+-+-+-+-+-+";
echo "|I|n|f|o|r|m|a|t|i|c|a|";
echo "+-+-+-+-+-+-+-+-+-+-+-+";
echo ""
echo "Update para corrigir Balance Trunk Issabel"
echo ""
sleep 10
yum install wget mtr vim mlocate nmap tcpdump mc nano lynx rsync screen htop subversion deltarpm dos2unix bind-utils -y
yum downgrade issabel-callcenter-4.0.0-4 -y
amportal a ma install trunkbalance
updatedb
svn co https://github.com/ibinetwork/IssabelBR/trunk/ /usr/src/IssabelBR
sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_issabel.conf
sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_issabel.conf
sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_issabelpbx.conf
echo "#include /etc/asterisk/extensions_tratamento_hangupcause.conf" >> /etc/asterisk/extensions_override_issabelpbx.conf
rsync --progress -r /usr/src/IssabelBR/etc/asterisk/ /etc/asterisk/
rsync --progress -r /usr/src/IssabelBR/repo/ /etc/yum.repos.d/
chown asterisk.asterisk /etc/asterisk/extensions_tratamento_hangupcause.conf
rm -Rf /usr/src/IssabelBR
yum update -y
amportal restart
clear
echo "+-+-+-+-+-+-+-+-+-+-+-+";
echo "|I|b|i|n|e|t|w|o|r|k|/|";
echo "+-+-+-+-+-+-+-+-+-+-+-+";
echo "|I|n|f|o|r|m|a|t|i|c|a|";
echo "+-+-+-+-+-+-+-+-+-+-+-+";
echo ""
echo "Update para corrigir Balance Trunk Issabel - INSTALADO COM SUCESSO!"
echo ""
sleep 10
