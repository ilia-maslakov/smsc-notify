#!/bin/bash

. ./fball_setup.sh

fb_date=`date +%d/%m/%y`

msg="Футбол%20$fb_date(сбт)Д.парк%20в19.30!%20для%20подтверждения%20отправьте%20'1'"

# Отправляем sms сообщения о тренировке с просьбой об ответе
# число отпраленное пользователем соответствует количеству участников, если придёт один значит отправляет '1'

curl "http://my.smscab.ru/sys/send.php?&login=$login&psw=$pass&charset=utf-8&phones=G1&sender=&mes=$msg"
