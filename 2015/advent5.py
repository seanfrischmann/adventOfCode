data = open("testData.txt","r")
data = data.read().splitlines()

disallowed_strings = [
        'ab', 'cd', 'pq', 'xy'
]

vowels = [
        'a', 'e', 'i', 'o', 'u'
]

count_nice = 0
count_nice2 = 0


for test in data:
    has_disallowed = False

    for x in disallowed_strings:
        if x in test:
            has_disallowed = True

    previous = ''
    has_duplicate = False

    count_vowels = 0
    has_vowels = False

    pairs = []
    pair = ''

    two_ago = ''
    previos = ''
    has_repeats_one_btwn = False

    for x in test:
        if x == previous:
            has_duplicate = True

        if x in vowels:
            count_vowels += 1

        if previous != '':
            pair = previous + x
            pairs.append(pair)

        if x == two_ago:
            has_repeats_one_btwn = True

        two_ago = previous
        previous = x

    has_pairs = False
    for x in pairs:
        if test.count(x) >= 2:
            has_pairs = True
            break

    if count_vowels >= 3:
        has_vowels = True

    if (not has_disallowed) and has_duplicate and has_vowels:
        count_nice += 1

    if has_pairs and has_repeats_one_btwn:
        count_nice2 += 1


print (count_nice)
print (count_nice2)
