data = open('testData.txt','r')
data = data.read()

x = 0
y = 0
m = 0
n = 0
locations = [(0,0)]
houses = 1
spotInString = 0

for direction in data:
    if spotInString % 2 == 0:
        if direction is '^':
            y += 1
        elif direction is 'v':
            y -= 1
        elif direction is '>':
            x += 1
        elif direction is '<':
            x -= 1
        ret = (x,y)
    else:
        if direction is '^':
            n += 1
        elif direction is 'v':
            n -= 1
        elif direction is '>':
            m += 1
        elif direction is '<':
            m -= 1
        ret = (m,n)

    visited = False
    for location in locations:
        if ret == location:
            visited = True

    if not visited:
        houses += 1
        locations.append(ret)

    spotInString += 1

print ('Number of Houses: ' + str(houses))
#print ('Coordinates Visited: ' + str(locations))
