data2 = open('data2','r')
data = data2.read().splitlines()

total = 0
for value in data:
    values = value.split('x')
    side1 = int(values[0])* int(values[1])
    side2 = int(values[1]) * int(values[2])
    side3 = int(values[0]) * int(values[2])
    if (side1 <= side2) and (side1 <= side3):
        extra = side1
    elif (side2 <= side1) and (side2 <= side3):
        extra = side2
    else:
        extra = side3
    total = total + (side1 * 2) + (side2 * 2) + (side3 * 2) + extra

print total

