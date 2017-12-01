data = open('puzzle','r')
data = data.read().strip()

last = False
total = 0
count = 0
for x in data:
    count += 1

    if last == int(x):
        total += int(x)

    last = int(x)

if int(data[0]) == last:
    total += last

print "Total part 1:", total
