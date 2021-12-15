using DataStructures: DefaultDict

function day12()
    # Parse input. Build adjacency list.
    graph = open("day_12_input") do f
        G = DefaultDict{String, Set{String}}(Set())
        for line in readlines(f)
            a, b = split(line, "-")
            push!(G[a], b)
            push!(G[b], a)
        end
        return G
    end

    function visit(visited, current, revisit)
        if current == "end"
            return 1
        end

        if islowercase(first(current))
            counts = [count(==(cave), visited) for cave in filter(x->islowercase(first(x)), keys(graph))]
            if (!revisit || count(==(2), counts) >= 1) && count(==(current), visited) > 0
                return 0
            end
        end

        push!(visited, current)

        sum = 0
        for next in filter(!=("start"), graph[current])
            sum += visit(copy(visited), next, revisit)
        end
        return sum
    end

    println("Day 12 part 1: ", visit([], "start", false))
    println("Day 12 part 2: ", visit([], "start", true))
end

day12()