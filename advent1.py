data = open('testData.txt','r')
data = data.read()

floor = 0
position = 1
finalPos = 0

for x in data:
    if x == '(':
        floor += 1

    elif x == ')':
        floor -= 1

    if floor == -1:
        finalPos = position

    if finalPos == 0:
        position += 1

print (position)
print (floor)
