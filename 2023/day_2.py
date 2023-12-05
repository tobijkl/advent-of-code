# Advent of Code 2023, Day 1

from operator import mul
from functools import reduce

max_allowed = {"red": 12, "green": 13, "blue": 14}

with open("day_2_input.txt", "r") as f:
    games = f.readlines()

part_1_sum = 0
part_2_sum = 0
    
for i, game in enumerate(games):
    possible = True
    min_set = {"red": 0, "green": 0, "blue": 0} 

    game = game.split(": ")[1].strip()
    rounds = game.split("; ")
    for round in rounds:
        cubes = round.split(", ")
        for cube in cubes:
            count, color = cube.split(" ")
            if int(count) > max_allowed[color]:
                possible = False
                
            min_set[color] = max(min_set[color], int(count))
                
    part_2_sum += reduce(mul, min_set.values())       
    
    if possible:
        part_1_sum += i+1
        
       
print("Day 2")
print(f"Part 1: {part_1_sum}")
print(f"Part 2: {part_2_sum}")
        