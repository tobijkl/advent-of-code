using DataStructures: DefaultDict

function day14()
    polymer, templates = open("day_14_input") do f
        s = readline(f)
        readline(f)
        r = Dict(split.(readlines(f), " -> "))
        return s, r
    end

    counter = DefaultDict{String, Int64}(0)
    for j in 0:1, i in 1:length(polymer)-j
        counter[polymer[i:i+j]] += 1
    end

    for i in 1:40
        for (key, value) in collect(counter)
            if length(key) == 2
                new = templates[key]
                counter[key] -= value
                counter[new] += value
                counter[key[1]*new] += value
                counter[new*key[2]] += value
            end
        end

        element_counts = filter(x -> length(x.first)==1, counter)
        diff = maximum(values(element_counts)) - minimum(values(element_counts))
        if i == 10
            println("Day 14 part 1: ", diff)
        elseif i == 40
            println("Day 14 part 2: ", diff)
        end
    end
end

day14()