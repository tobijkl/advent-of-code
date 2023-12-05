with open("day_3_input.txt", "r") as f:
    d = f.read().splitlines()
    
part_1_sum = 0
part_2_sum = 0
candi = {}
    
for i in range(0, len(d)):
    
    buffer = ""
    adjacent = False
    star = (False, False)
    
    for j in range(0, len(d[0])):
        
        if d[i][j].isdigit():
            buffer += d[i][j]
            for k in range(max(0, i-1), min(i+2, len(d))):
                for l in range(max(0, j-1), min(j+2, len(d[0]))):
                    if (not d[k][l].isdigit()) and d[k][l] != ".":
                        adjacent = True
                    if (not star[0]) and d[k][l] == "*":
                        star = (k, l)
                        
        if (not d[i][j].isdigit()) or (j == len(d[0])-1):
            if adjacent:
                part_1_sum += int(buffer)

            if star[0]:
                if star in candi:
                    part_2_sum += candi[star]*int(buffer)
                else:
                    candi[star] = int(buffer)
            
            buffer = ""
            adjacent = False
            star = (False, False)

print("Day 3")
print("Part 1 ", part_1_sum)
print("Part 2 ", part_2_sum)