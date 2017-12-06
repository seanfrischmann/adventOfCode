data = open('puzzle','r').readlines()
data = [ x.strip().split(' ') for x in data]

total = 0;
for row in data:
    large = False
    small = False
    row = filter(None, row)

    for num in row:
        num = int(num)

        if (large == False):
            large = num
            small = num
        else:
            if (num < small):
                small = num
            elif (num > large):
                large = num

    total += large - small

print "Total for part 2: ", total
