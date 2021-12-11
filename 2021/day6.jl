function day6()
    # Parse input.
    input = open("day_6_input") do f
        return parse.(Int64, split(readline(f), ","))
    end
    fish = [count(==(i), input) for i in 0:8]

    for d in 1:256
        first = popfirst!(fish)
        fish[6+1] += first
        push!(fish, first)

        # Part 1.
        if d == 80
            println("Day 6 part 1: ", sum(fish))
        end
    end

    # Part 2.
    println("Day 6 part 2: ", sum(fish))
end

day6()