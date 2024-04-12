  #!/bin/bash

#az login -t zemindar.onmicrosoft.com
chars=\"
subscriptions=$(az account management-group subscription show-sub-under-mg --name new-subscriptions | grep name | cut -d':' -f2 | sed 's/.$//' | sed "s/[$chars]//g")



#az login -t zemindar.onmicrosoft.com
declare -i a=1
for i in ${subscriptions[@]}; do
    az account subscription rename --id $i --name "$(printf "tc24-%04d\n" "$a")"
    #printf "tc24-%04d\n" "$a"
    a+=1
done;
