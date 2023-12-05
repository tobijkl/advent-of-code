# Advent of Code 2022, Day 3

with open("day_3_input.txt", "r") as f:
    lines = f.read().splitlines()
    
def prio(char):
    if char > 'Z':
        return ord(char)-96
    else:
        return ord(char)-65+27
        

part_1_sum = 0
for line in lines:
    left = line[:len(line)//2]
    right = line[len(line)//2:]
    part_1_sum += prio(next(iter(set(list(left)).intersection(set(list(right))))))

part_2_sum = 0
for i in range(0, len(lines), 3):
    part_2_sum += prio(next(iter(
        set(list(lines[i]))
        .intersection(set(list(lines[i+1])))
        .intersection(set(list(lines[i+2])))
        )))

print("Day 3")
print(f"Part 1: {part_1_sum}")
print(f"Part 2: {part_2_sum}")