function day4()
    # Parse input.
    input, puzzles = open("day_4_input") do f
        lines = readlines(f)

        input = parse.(Int64, split(lines[1], ","))

        n = 5
        parsePuzzle(up) = reduce(hcat, map(u -> parse.(Int64, split(u)), up))
        puzzles = [parsePuzzle(lines[idx:idx+n-1]) for idx in 3:n+1:length(lines)-1]

        return input, puzzles
    end

    # Part 1 and 2.
    check(puzzle) = any(all.(==(-1), [eachcol(puzzle)..., eachrow(puzzle)...]))
    score(puzzle, i) = (i*(sum(puzzle) + sum(puzzle.==(-1))))
    last = -1
    for i in input
        for puzzle in puzzles
            puzzle[puzzle.==i] .= -1

            if check(puzzle) && any(puzzle.!=-1)
                if last == -1
                    println("Day 4 part 1: ", score(puzzle, i))
                end
                last = score(puzzle, i)

                puzzle .= -1
            end
        end
    end
    println("Day 4 part 2: ", last)
end

day4()