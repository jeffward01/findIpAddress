#!/bin/bash
# Script to get ip address and location

my_ipAddy="$1"
longLocation="$2"
long="$3"
lat="$4"
shortLocation="$5"
holder="$6"
metroCode="$7"
areaCode="$8"

 
my_ipAddy=$(curl -s  ipinfo.io/ip)


longLocation=$(geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat  $my_ipAddy)

holder=$(echo $longLocation | cut -d ":" -f 2)
shortLocation=$(echo $holder | cut -d "," -f 1,3-5)
lat=$(echo $holder | cut -d "," -f 6)
long=$(echo $holder | cut -d "," -f 7)
metroCode=$(echo $holder | cut -d "," -f 8)
areaCode=$(echo $holder | cut -d "," -f 9)


echo IP Address: $my_ipAddy
echo  $shortLocation
echo
echo Latitude: "$lat" 
echo Longitude: "$long"
echo
echo Metro Code: "$metroCode"
echo Area Code: "$areaCode"
