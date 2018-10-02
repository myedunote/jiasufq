#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
rm -rf $0 >/dev/null 2>&1
clear;
#==========================================================================
IDAddress=`wget http://ipinfo.io/country -O - -q ; echo`;
if [ $IDAddress == "CN" ]
then
MirrorHost='https://git.oschina.net/52fancy/serverSpeeder/raw/master';#中国节点
else
MirrorHost='https://github.com/52fancy/serverSpeeder/raw/master';#美国节点
fi
key=xbml.vip
Welcome='
==========================================================================
                      欢迎使用小白一键综合脚本                                              
                        小白官网 xbml.vip                                              
                       欢迎大神小白进群交流                                            
                      云免交流QQ群：173504018                                                     
                                                                                       
                               by 小白 2017-03-07                              
==========================================================================';
echo "$Welcome";
echo "脚本仅支持6.X 64位 CentOS系统"
echo 
echo -n -e "请输入验证码 [\033[32m $key \033[0m] ："
read PASSWD
readkey=$PASSWD
if [[ ${readkey%%\ *} == $key ]]
    then
        echo 
		echo -e '\033[32m验证成功,即将进行下一部操作哦!\033[0m'
		sleep 3
    else
        echo
		echo -e '\033[31m验证失败 ，请重新尝试！  \033[0m'
		sleep 3
exit
fi
if [ `uname -r` != "2.6.32-504.3.3.el6.x86_64" ]
then
echo "内核不一致，即将替换内核"
echo -e "是否确认？[y or n]"
read code
if [ $code = "y" -o $code = "Y" ]
then
echo "请等待，正在替换内核。。。"
wget --no-check-certificate ${MirrorHost}/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm >/dev/null 2>&1
rpm -ivh kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm --force
rm -f kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm
wget --no-check-certificate ${MirrorHost}/kernel-2.6.32-504.3.3.el6.x86_64.rpm >/dev/null 2>&1
rpm -ivh kernel-2.6.32-504.3.3.el6.x86_64.rpm --force
rm -f kernel-2.6.32-504.3.3.el6.x86_64.rpm
echo "内核替换完成，系统即将重启"
echo "重启系统之后请再次执行该脚本"
sleep 5
reboot
rm -f serverSpeeder.sh
exit 0
fi
#52ml
if [ $code = "n" -o $code = "N" ]
then
echo "程序即将退出安装"
sleep 1
rm -f serverSpeeder.sh
exit 0
fi
#52ml
fi
#52ml
echo "正在安装锐速无限制版"
wget --no-check-certificate ${MirrorHost}/serverSpeeder.tar.gz >/dev/null 2>&1
tar -zxvf serverSpeeder.tar.gz >/dev/null 2>&1
bash install.sh
rm -f serverSpeeder.tar.gz >/dev/null 2>&1
rm -rf apxfiles >/dev/null 2>&1
rm -f install.sh >/dev/null 2>&1
echo "安装完成"
rm -f serverSpeeder.sh
exit 0