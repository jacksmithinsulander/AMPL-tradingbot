: buy s" python3 buy.py" system ;

: sleep s" sleep 40m" system ;

: sell s" python3 sell.py" system ; 

: execution buy sleep sell ;

s" amplprice.txt" included 

: numComparison 112 > if execution else cr ." criteria not met, no trade executed" cr cr then ;

numComparison 

bye