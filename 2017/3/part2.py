puzzle = 361527

grid = {0: {0: 1}}

curDir = 'R'
x = 0
y = 0

def getSumNum():
    summing = 0

    if y+1 in grid[x]:
        summing += grid[x][y+1]

    if y-1 in grid[x]:
        summing += grid[x][y-1]

    if x+1 in grid and y in grid[x+1]:
        summing += grid[x+1][y]

    if x-1 in grid and y in grid[x-1]:
        summing += grid[x-1][y]

    if x+1 in grid and y+1 in grid[x+1]:
        summing += grid[x+1][y+1]

    if x-1 in grid and y-1 in grid[x-1]:
        summing += grid[x-1][y-1]

    if x+1 in grid and y-1 in grid[x+1]:
        summing += grid[x+1][y-1]

    if x-1 in grid and y+1 in grid[x-1]:
        summing += grid[x-1][y+1]

    return summing

for number in range(2, puzzle+1):
    if (curDir is 'R'):
        x += 1
        if x not in grid:
            grid[x] = {}

        if y+1 not in grid[x]:
            curDir = 'U'

    elif (curDir is 'U'):
        y += 1
        if x-1 not in grid or y not in grid[x-1]:
            curDir = 'L'

    elif (curDir is 'L'):
        x -= 1
        if x not in grid:
            grid[x] = {}

        if y-1 not in grid[x]:
            curDir = 'D'

    elif (curDir is 'D'):
        y -= 1
        if x+1 not in grid or y not in grid[x+1]:
            curDir = 'R'

    sumNum = getSumNum()
    grid[x][y] = sumNum
    if sumNum > puzzle:
        print "Number: ", sumNum
        break;
