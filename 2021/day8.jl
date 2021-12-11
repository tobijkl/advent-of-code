function day8()
    # Parse input.
    input = open("day_8_input") do f
        return map(line -> split.(split(line, " | "), " "), readlines(f))
    end

    # Part 1.
    a = 0
    for i in input
        a += sum([count(==(y), length.(i[2])) for y in [2, 3, 4, 7]])
    end
    println("Day 8 part 1: ", a)

    # Part 2.
    s = 0
    for (signals, digits) in input
        m = Dict()

        m[1] = first(filter(x -> length(x) == 2, signals))
        m[7] = first(filter(x -> length(x) == 3, signals))
        m[4] = first(filter(x -> length(x) == 4, signals))
        m[8] = first(filter(x -> length(x) == 7, signals))

        m[9] = first(filter(x -> length(x) == 6 && m[4] ⊆ x, signals))
        m[6] = first(filter(x -> length(x) == 6 && x != m[9] && m[1] ⊈ x, signals))
        m[0] = first(filter(x -> length(x) == 6 && x != m[9] && x != m[6], signals))

        m[3] = first(filter(x -> length(x) == 5 && m[1] ⊆ x, signals))
        m[5] = first(filter(x -> length(x) == 5 && x != m[3] && x ⊆ m[9], signals))
        m[2] = first(filter(x -> length(x) == 5 && x != m[3] && x != m[5], signals))

        mapping = Dict(Set(value) => key for (key, value) in m)
        s += parse(Int64, join(string.([mapping[Set(digit)] for digit in digits])))
    end
    println("Day 8 part 2: ", s)
end
day8()