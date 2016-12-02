data = open('testData.txt','r')
data = data.read().splitlines()

total = 0
ribbon = 0
for value in data:
    values = [int(num) for num in value.split('x')]
    sides = [(values[0] * values[1]),(values[1] * values[2]),(values[0] * values[2])]
    values.sort()
    wrap = (values[0] * 2) + (values[1] * 2)
    bow = values[0] * values[1] * values[2]
    ribbon += wrap + bow
    sides.sort()
    total = total + (sides[0] * 2) + (sides[1] * 2) + (sides[2] * 2) + sides[0]

print ('total wrapping paper: ' + str(total))
print ('ribbon: ' + str(ribbon))
