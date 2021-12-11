most_common(x) = Int(sum(x)/length(x) >= 0.5)
least_common(x) = 1 - most_common(x)
toBase10(x) = parse(Int64, join(string.(x)), base = 2)

function find(common, input)
    gas = []
    i = 1
    while length(input) > 1
        mc = common(getindex.(input, i))
        filter!(row -> row[i] == mc, input)
        push!(gas, mc)
        i += 1
    end
    return toBase10(Int.(first((input))))
end

function day3()
    # Parse input.
    input = open("day_3_input") do f
        return map(x -> parse.(Bool, x), split.(readlines(f), ""))
    end

    # Part 1
    γ = toBase10([most_common(getindex.(input, i)) for i in 1:length(first(input))])
    ϵ = toBase10([least_common(getindex.(input, i)) for i in 1:length(first(input))])
    println("Day 3 part 1: ", γ*ϵ)

    # Part 2.
    oxygen = find(most_common, copy(input))
    co2 = find(least_common, copy(input))
    println("Day 3 part 2: ", oxygen*co2)
end

day3()