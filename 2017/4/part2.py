data = open('puzzle','r').readlines()
data = filter(None, [filter(None, x.strip().split(' ')) for x in data])

valid = 0
for phrase in data:
    phrase = [ list(x) for x in phrase]

    i = 0
    notValid = False
    while i < len(phrase) - 1:
        j = i+1
        while j < len(phrase):
            if (cmp(sorted(phrase[i]), sorted(phrase[j])) == 0):
                notValid = True
            j += 1
        i += 1

    if notValid is False:
        valid += 1

print "Valid Phrases: ", valid
