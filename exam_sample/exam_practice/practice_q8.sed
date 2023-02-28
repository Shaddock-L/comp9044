#n
1d; $d                                          # remove the header and footer
/^[^|]*[[:alpha:]][^|]*\|/d                     # remove any poll that isn't a year
/^[^|]*\|(1[1-9]|[2-9][0-9]|[0-9]{3,})\|/d      # remove all positions > 10
s/^([^|]*)\|([^|]*)\|([^|]*)\|([^|]*)$/\4 - \3/ # remove field 1 and 2, swap field 3 and 4
p