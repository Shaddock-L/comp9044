#n 
1d
$d
/^[^|]*[a-zA-Z][^|]*\|/d
/^[^|]*\|(1[1-9]|[2-9][0-9]|[0-9]{3,})\|/d
s/^([^|]*)\|([^|]*)\|([^|]*)\|([^|]*)$/\4 - \3/p