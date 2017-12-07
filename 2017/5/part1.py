data = open('puzzle', 'r').readlines()
data = [ int(x.strip()) for x in data ]

steps = 1
i = 0
prev = 0
while i < len(data):
    steps += 1

    data[prev] += 1
    prev = i
    i += data[i]

print "Steps: ", steps, data
