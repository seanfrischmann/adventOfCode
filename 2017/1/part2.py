data = open('puzzle','r')
data = data.read().strip()

increment = len(data) / 2
last = False
total = 0
i = 0
for x in data:
    arraySpot = i + increment
    if arraySpot > len(data) - 1:
        arraySpot -= len(data)

    if data[arraySpot] == x:
        total += int(x)

    i += 1

print "Total part 2:", total
