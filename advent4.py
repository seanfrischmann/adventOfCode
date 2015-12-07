import hashlib as h

data = "ckczppom"
pattern_1 = "00000"
pattern_2 = "000000"

i = 0
loop = True
first_match = False
while loop:
    current = h.md5()
    current.update((data+str(i)).encode())
    if str(current.hexdigest()).startswith(pattern_1) and not first_match:
        print ("pattern 1:")
        print (current.hexdigest())
        print (i)
        first_match = True
    if str(current.hexdigest()).startswith(pattern_2):
        print ("pattern 2:")
        print (current.hexdigest())
        print (i)
        loop = False
    i += 1

