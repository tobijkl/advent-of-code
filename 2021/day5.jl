function day5(;part=1)
    # Pase input.
    input = open("day_5_input") do f
        function parseF(line)
            m = match(r"(?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)", line)
            return parse.(Int64, (m[:x1], m[:y1], m[:x2], m[:y2]))
        end
        return map(parseF, readlines(f))
    end
    n = maximum(x -> max(x...), input) + 1

    # Part 1.
    field = zeros(Int64, n, n)
    for (x1, y1, x2, y2) in input
        if x1 == x2
            for y in min(y1,y2):max(y1, y2)
                field[y+1, x1+1] += 1
            end
        elseif y1 == y2
            for x in min(x1,x2):max(x1, x2)
                field[y1+1, x+1] += 1
            end
        end
    end
    println("Day 5 part 1: ", sum(field .>= 2))

    # Part 2.
    for (x1, y1, x2, y2) in input
        if abs(x1-x2) == abs(y1-y2) 
            for (x, y) in zip(range(x1, stop=x2, length=abs(x1-x2)+1), range(y1, stop=y2, length=abs(y1-y2)+1))
                field[Int64(y+1), Int64(x+1)] += 1
            end
        end
    end

    println("Day 5 part 2: ", sum(field .>= 2))   
end

day5()