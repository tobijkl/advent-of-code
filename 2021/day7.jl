using Statistics

function day7()
    # Parse input.
    input = open("day_7_input") do f
        return parse.(Int64, split(readline(f), ","))
    end

    # Part 1.
    println("Day 7 part 1: ", Int64(sum(abs.(input .- median(input)))))

    # Part 2.
    cost(a, b) = (abs(a-b)/2)*(abs(a-b)+1)
    costs = [(sum(map(x -> cost(i, x), input)), i) for i in minimum(input):maximum(input)]
    println("Day 7 part 2: ", Int(costs[findmin(first, costs)[2]][1]))
end

day7()