data = open('testData','r')
data = data.read()

floor = 0
position = 1

for x in data:
    if x == '(':
        floor += 1
    elif x == ')':
        floor -= 1
    if floor == -1:
        finalPos = position
        break
    position += 1

print (position)
