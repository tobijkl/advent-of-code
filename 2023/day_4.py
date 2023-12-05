with open("day_4_input.txt", "r") as f:
    cards = f.read().splitlines()
    
# Part 1
part_1_sum = 0    
wins = [0 for _ in range(len(cards))]
for i, card in enumerate(cards): 
    winning, having = card.split(" | ")
    winning = winning.split(": ")[1].split()
    having = having.split()
    
    matches = len(set(having).intersection(set(winning)))
    if matches > 0:
        part_1_sum += 2**(matches-1)
        wins[i] = matches

# Part 2
c = [1 for _ in range(len(cards))]
for i in range(len(wins)):
    if wins[i] > 0:
        for w in range(1, wins[i]+1):
            c[i+w] += c[i]
part_2_sum = sum(c)

print("Day 4")
print("Part 1:", part_1_sum)
print("Part 2:", part_2_sum)