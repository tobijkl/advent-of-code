# Advent of Code 2022, Day 2

with open("day_2_input.txt", "r") as f:
    lines = f.read().splitlines()
    
part_1_points = 0
part_2_points = 0

for line in lines:   

    # Part 1
    part_1_points += ord(line[2])-87
    if line in ["A X", "B Y", "C Z"]:
        part_1_points += 3
    if line in ["A Y", "B Z", "C X"]:
        part_1_points += 6
        
        
    # Part 2
    if line[2] == "X":
        part_2_points += 0 # loose
        if line[0] == "A":
            part_2_points += 3
        elif line[0] == "B":
            part_2_points += 1
        else:
            part_2_points += 2
            
    elif line[2] == "Z":
        part_2_points += 6 # win
        if line[0] == "A":
            part_2_points += 2
        elif line[0] == "B":
            part_2_points += 3
        else:
            part_2_points += 1
            
    else:
        part_2_points += 3 # draw
        part_2_points += ord(line[0])-64
        


print("Day 2")
print(f"Part 1: {part_1_points}")
print(f"Part 2: {part_2_points}")