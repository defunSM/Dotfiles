nmap -sP 192.168.1.0/24 > /tmp/some-network-output.txt
awk '/nMap/ {print}' | /tmp/some-network-output.txt
