#!/usr/bin/env python3
import sys

if(len(sys.argv) == 1):
    print(f"error: {sys.argv[0]} needs filenames", file=sys.stderr)
    sys.exit(1)
    
contents = []
spe = set()

#read all files first
for i in range(1, len(sys.argv)):
    with open(sys.argv[i], "r") as f:
        for line in f:
            contents.append(line)
            species = " ".join(line.split()[2:]).lower()
            if(species.endswith('s')):
                #print(f' here {species}')
                species = species[:-1]
            spe.add(species)
        
spe_dic = {x : [0,0] for x in spe}

for line in contents:
    species = " ".join(line.split()[2:]).lower()
    if(species.endswith('s')):
        species = species[:-1]
    
    spe_dic[species][0] += 1
    spe_dic[species][1] += int(line.split()[1])

keys = list(spe_dic.keys())
keys.sort()

for k in keys:
    print(f'{k.lower()} observations: {spe_dic[k][0]} pods, {spe_dic[k][1]} individuals')
                   
