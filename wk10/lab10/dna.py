import re
def read_dna(dna_file):
    """
    Read a DNA string from a file.
    the file contains data in the following format:
    A <-> T
    G <-> C
    G <-> C
    C <-> G
    G <-> C
    T <-> A
    Output a list of touples:
    [
        ('A', 'T'),
        ('G', 'C'),
        ('G', 'C'),
        ('C', 'G'),
        ('G', 'C'),
        ('T', 'A'),
    ]
    Where either (or both) elements in the string might be missing:
    <-> T
    G <->
    G <-> C
    <->
    <-> C
    T <-> A
    Output:
    [
        ('', 'T'),
        ('G', ''),
        ('G', 'C'),
        ('', ''),
        ('', 'C'),
        ('T', 'A'),
    ]
    """
    output = []
    with open(dna_file,'r') as f:
        for line in f:
            ele = line.strip()
            ele = ele.split('<->')
            ret_1 = re.sub(' *', '',ele[0])
            ret_2 = re.sub(' *', '',ele[1])
            #print(ele)
            output.append((ret_1, ret_2))
    return output


def is_rna(dna):
    """
    Given DNA in the aforementioned format,
    return the string "DNA" if the data is DNA,
    return the string "RNA" if the data is RNA,
    return the string "Invalid" if the data is neither DNA nor RNA.
    DNA consists of the following bases:
    Adenine  ('A'),
    Thymine  ('T'),
    Guanine  ('G'),
    Cytosine ('C'),
    RNA consists of the following bases:
    Adenine  ('A'),
    Uracil   ('U'),
    Guanine  ('G'),
    Cytosine ('C'),
    The data is DNA if at least 90% of the bases are one of the DNA bases.
    The data is RNA if at least 90% of the bases are one of the RNA bases.
    The data is invalid if more than 10% of the bases are not one of the DNA or RNA bases.
    Empty bases should be ignored.
    """
    size = len(dna)
    dna_cnt = 0
    rna_cnt = 0
    invalid_cnt = 0
    for (l,r) in dna:
        if l == "" or r == "":
            continue
        #if l == "" or r == "":
            #invalid_cnt += 1
        elif l == "U" or r == "U":
            rna_cnt += 1
        elif l == "T" or r == "T":
            dna_cnt += 1
        elif (l,r) == ('C','G') or (l,r) == ("G", 'C'):
            rna_cnt += 1
            dna_cnt += 1
        else:
            invalid_cnt += 1
    dna_ratio = dna_cnt / size
    rna_ratio = rna_cnt / size
    invalid_ratio = invalid_cnt / size
    if invalid_ratio > 0.1:
        return "Invalid"
    if dna_ratio >= 0.9:
        return "DNA"
    if rna_ratio >= 0.9:
        return 'RNA'

def clean_dna(dna):
    """
    Given DNA in the aforementioned format,
    If the pair is incomplete, ('A', '') or ('', 'G'), ect
    Fill in the missing base with the match base.
    In DNA 'A' matches with 'T', 'G' matches with 'C'
    In RNA 'A' matches with 'U', 'G' matches with 'C'
    If a pair contains an invalid base the pair should be removed.
    Pairs of empty bases should be ignored.
    """
    gen_type = is_rna(dna)
    output = []
    i = 0
    #while i < len(dna):
    for i in range(len(dna)):
        l = dna[i][0]
        r = dna[i][1]
        if l == "" and r == "":
            continue
        if l == "":
            if r == "G":
                output.append(('C',r))
                continue
            elif r == "C":
                output.append(('G',r))
                continue
            if gen_type == 'DNA':
                if r == "U":
                    continue
                elif r == "A":
                    output.append(('T',r))
                    continue
                elif r == "T":
                    output.append(('A',r))
                    continue
            elif gen_type == "RNA":
                if r == "T":
                    continue
                elif r == "A":
                    output.append(('U',r))
                    continue
                elif r == "U":
                    output.append(('A',r))
                    continue
        elif r == "":
            if l == "G":
                output.append((l,'C'))
                continue
            elif l == "C":
                output.append((l,'G'))
                continue
            if gen_type == 'DNA':
                if l == "U":
                    continue
                elif l == "A":
                    output.append((l,'T'))
                    continue
                elif l == "T":
                    output.append((l,'A'))
                    continue
            elif gen_type == "RNA":
                if l == "T":
                    continue
                elif l == "A":
                    output.append((l,'U'))
                    continue
                elif l == "U":
                    output.append((l,'A'))
                    continue
        else:
            output.append((l,r))
    return output
            


def mast_common_base(dna):
    """
    Given DNA in the aforementioned format,
    return the most common first base:
    eg. given:
    A <-> T
    G <-> C
    G <-> C
    C <-> G
    G <-> C
    T <-> A
    The most common first base is 'G'.
    Empty bases should be ignored.
    """
    dic = {'A':0, 'T':0, 'G':0, 'C':0, 'U':0}
    cur_max = -1
    res = ""
    for (l,r) in dna:
        if l != "":
            dic[l] += 1
        if dic[l] > cur_max:
            cur_max = dic[l]
            res = l
    return res

def base_to_name(base):
    """
    Given a base, return the name of the base.
    The base names are:
    Adenine  ('A'),
    Thymine  ('T'),
    Guanine  ('G'),
    Cytosine ('C'),
    Uracil   ('U'),
    return the string "Unknown" if the base isn't one of the above.
    """
    dic = {'A': 'Adenine', 'T' : 'Thymine', 'G' : 'Guanine', 'C' : 'Cytosine', 'U' : 'Uracil' }
    return dic[base]
