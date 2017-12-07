data = open('puzzle', 'r').readlines()
data = filter(None, data[0].strip().split(' '))
data = [ int(x) for x in data ]

patterns = []
cycles = 0
length = len(data) - 1
while True:
    val = max(data)
    i = data.index(val)
    data[i] = 0

    while val > 0:
        if i+1 > length:
            i = 0
        else:
            i += 1

        data[i] += 1
        val -= 1

    print data
    pattern = ''.join(str(x) for x in data)
    cycles += 1

    if pattern in patterns:
        print "Part 1 Total: ", cycles
        break;
    else:
        patterns.append(pattern)
