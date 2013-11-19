#!/bin/bash

. ./fball_setup.sh

# Получаем sms за текущие сутки.
curl "http://my.smscab.ru/sys/get.php?get_answers=1&login=$login&psw=$pass" > /tmp/#$dmark#.sms

count=0

while read cline; do
# Выделяем из sms число, если чисел несколько возьмём только первое, отбросив все символы кроме знака '-' (минус)
cnt=`echo $cline | cut -d',' -f 4|cut -d'=' -f 2|grep -Eo '(-)?[0-9]+' |head -n1`
if [ -n "$cnt" ]; then
count=`expr $count + $cnt`
fi
done </tmp/#$dmark#.sms

#вместо пробелов необходимо подставить символ %20
msg="Подтвердили%20участие:%20$count.%20Да%20пребудет%20с%20вами%20Сила..."

#Отправим сообщение находящееся в переменной msg контактам из списка группы #1.
curl "http://my.smscab.ru/sys/send.php?&login=$login&psw=$pass&charset=utf-8&phones=G1&mes=$msg"

#Удалим список sms
#rm /tmp/#$dmark#.sms
