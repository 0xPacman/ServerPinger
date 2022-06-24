echo "🇸​​​​​🇪​​​​​🇷​​​​​🇻​​​​​🇪​​​​​🇷​​​​​ 🇵​​​​​🇮​​​​​🇳​​​​​🇬​​​​​🇪​​​​​🇷​​​​​ ​​​​​"
echo "==============================="

read -p "How many servers? " nb

servers=($(for i in $(seq 1 $nb); do echo "server$i"; done))

for i in $(seq 1 $nb); do
    read -p "Enter the ip of server $i: " ip
    servers[$i]=$ip
done
echo "==============================="
for i in $(seq 1 $nb); do
    str=`timeout 2 ping -c 1 ${servers[$i]} 2>/dev/null | grep -ow ms | head -n 1`
    if [[ $str = "ms" ]]; then
        echo "The server ${servers[$i]} is up and running ✅​ "
    else
        echo "The server ${servers[$i]} is down ⛔​"
    fi

done
