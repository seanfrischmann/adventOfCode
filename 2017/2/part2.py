data = open('puzzle','r').readlines()
data = [ x.strip().split(' ') for x in data]

total = 0;
for row in data:
    row = filter(None, row)
    i = 0
    while i < len(row) - 1:
        j = i + 1
        num1 = int(row[i])

        while j < len(row):
            num2 = int(row[j])

            if num1 % num2 == 0:
                total += num1 / num2

            elif num2 % num1 == 0:
                total += num2 / num1

            j += 1

        i += 1

print "Total for part two: ", total
