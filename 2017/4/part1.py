data = open('puzzle','r').readlines()
data = filter(None, [filter(None, x.strip().split(' ')) for x in data])

valid = 0
for phrase in data:
    if len(phrase) == len(set(phrase)):
        valid += 1

print "Valid Phrases: ", valid
