# Advent of Code 2023, Day 1

with open("day_1_input.txt", "r") as f:
    lines = f.readlines()

part_1_sum = 0
part_2_sum = 0

for line in lines:
    part_1_digits = []
    part_2_digits = []
    
    for i, c in enumerate(line):
        if c.isdigit():
            part_1_digits.append(c)
            part_2_digits.append(c)
        for j , num in enumerate(['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']):
            if line[i:].startswith(num):
                part_2_digits.append(str(j + 1))
    
    part_1_sum += int(str(part_1_digits[0]+part_1_digits[-1]))
    part_2_sum += int(str(part_2_digits[0]+part_2_digits[-1]))

print("Day 1")
print("Part 1:", part_1_sum)
print("Part 2:", part_2_sum)
    