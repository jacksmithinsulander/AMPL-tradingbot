#!/bin/bash

rm -rf amplprice.txt

price=$(curl -X 'GET'   'https://api.coingecko.com/api/v3/simple/token_price/ethereum?contract_addresses=0xd46ba6d942050d489dbd938a2c909a5d5039a161&vs_currencies=usd&include_market_cap=false&include_24hr_vol=false&include_24hr_change=false&include_last_updated_at=false'   -H 'accept: application/json' | grep 'usd' | sed -r 's/^[^:]*:(.*)$/\1/' | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' )

result=$( awk "BEGIN { print int (100*$price)}" )

touch amplprice.txt

echo "$result" >> amplprice.txt

