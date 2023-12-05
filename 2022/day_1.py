# Advent of Code 2022, Day 1

with open("day_1_input.txt", "r") as f:
    lines = f.read()
    
cals = sorted(map(lambda x: sum(map(int, x.split("\n"))), lines.split("\n\n")))

print("Day 1 2022")
print("Part 1:", cals[-1])
print("Part 2:", cals[-1]+cals[-2]+cals[-3])