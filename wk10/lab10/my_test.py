import dna
import sys

DNA = dna.read_dna('data5')

data = [k for k in DNA]
cleaned = dna.clean_dna(data)
review = []
for i in range(len(cleaned)):
    a = cleaned[i]
    b = data[i]
    if a != b:
        review.append((a,b,i))
    