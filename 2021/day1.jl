function day1()
    # Parse input
    input = open("day_1_input") do f
        return parse.(Int64, readlines(f))
    end

    # Part 1
    part1 = sum(diff(input) .> 0)
    println("Day 1 part 1: $part1")

    # Part 2
    # Two successive three-measurement windows have two values in common.
    # Requiring comparison only of the two unique values.
    part2 = sum(input[4:end] .> input[1:end-3])
    println("Day 1 part 2: $part2")
end

day1()