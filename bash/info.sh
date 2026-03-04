echo "" &&
printf "\033[32mCheck OS Version :\033[0m\n";  grep -o 'PRETTY_NAME="[^"]*"' /etc/os-release | sed 's/PRETTY_NAME="//' | sed 's/"$//' && echo && \
printf "\033[32mCheck the POS Build\033[0m\n"; rpm -qa | grep bean && echo && \
printf "\033[32mCheck register environment:\033[0m\n"; grep -o 'ingress\.[^\.]*' /beanstore-client/pos/.vendorOptions | cut -d '.' -f 2-3 && echo && \
printf "\033[32mCheck the DNS configuration:\033[0m\n"; cat /etc/resolv.conf && echo && \
printf "\033[32mCheck what NTP servers are being used:\033[0m\n"; grep 'server' /etc/ntp.conf && echo && \
printf "\033[32mCheck the Aurus URLs being used:\033[0m\n"; grep -E 'primary_url|secondary_url' /beanstore-client/pos/config/aesdkconfig/aesdk-config.properties && echo && \
printf "\033[32mCheck for Printer:\033[0m\n"; dmesg | grep -A 2 'Product: TM-H6000V' | grep -E 'Product: TM-H6000V|Manufacturer: EPSON|SerialNumber' | awk '{ $1=""; $2=""; $3=""; $4=""; print substr($0,3) }' && echo && \

printf "\033[32mCheck for PIN Pad:\033[0m\n"; dmesg | grep -E ' Product: M450-1|Manufacturer: Verifone Inc.|SerialNumber' | tail -n 3 | awk '{ $1=""; $2=""; $3=""; $4=""; print substr($0,3) }' && echo && \

printf "\033[32mCheck for Scanner:\033[0m\n"; dmesg | grep -A 2 'Product: Magellan 9400i OEM Scanner' | grep -E 'Product: Magellan 9400i OEM Scanner|Manufacturer: Datalogic|SerialNumber' | tail -n 3 | awk '{ $1=""; $2=""; $3=""; $4=""; print substr($0,3) }'
