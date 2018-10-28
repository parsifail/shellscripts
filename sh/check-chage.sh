#!/bin/bash
# Check Password expiry on Linux
# Keith Rogers - 13/Feb/2014 (Version 1.1)
# Stoycho Ganev - 02/Sep/2014 (Version 1.2), 16/Dec/2014 (version 1.3)
# Ventseslav Petrov - 17/Dec/2014 (Version 1.4)

unset LANG
LC_TIME="en_US.UTF-8"

function calculate_days_till_expiry {                                                                                                                                                          
     get_expiry_date=$(sudo /usr/bin/chage -l $usr | grep 'Password inactive' | cut -d: -f2)                                                                                                    
     if [[ $get_expiry_date = ' never' ]]                                                                                                                                                      
     then                                                                                                                                                                                      
          CRIT=$CRIT" CRITICAL:$1(never)"                                                                                                                                                      
          prx=2                                                                                                                                                                                
     elif                                                                                                                                                                                      
     password_expiry_date=$(date -d "$get_expiry_date" "+%s")                                                                                                                                  
     current_date=$(date "+%s")                                                                                                                                                                
     diff=$(($password_expiry_date-$current_date))                                                                                                                                             
     let DAYS=$(($diff/(60*60*24)))
     echo -e "\n[$DAYS][$diff]\n" >> /dev/null 
     then                                                                                                                                                                                      
     if (($DAYS>=22 && $DAYS<=120))                                                                                                                                                             
     then                                                                                                                                                                                      
          OK=$OK" OK:$1($DAYS)"
          prx=0
     elif (($DAYS>=10 && $DAYS<=21))
     then
          WARN=$WARN" WARN:$1($DAYS)"
          prx=1
     elif (($DAYS<=9 || $DAYS>90))
     then
          CRIT=$CRIT" CRITICAL:$1($DAYS)"
          prx=2
     fi
fi
}

#USERLIST=$(sudo /usr/bin/grep -P '\$\d\$' /etc/shadow | cut -d: -f1 | grep -v 'root')
USERLIST=$(sudo /usr/bin/getent shadow | grep -P '\$\d\$' | cut -d: -f1 | grep -v 'root')
exitcode=0
for usr in $USERLIST; do
     calculate_days_till_expiry $usr
     if [ $prx -gt $exitcode ]; then
          exitcode=$prx
     fi
done

if [ $exitcode -ne 0 ]
then
        echo "$CRIT $WARN"
fi

if [ ! -z ${OK+x} ]
then
        echo "$OK"
fi

exit $exitcode
