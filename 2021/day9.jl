function neighborhood(R, idx)
    Ifirst, Ilast = first(R), last(R)
    return [
        max(Ifirst, idx+CartesianIndex(-1, 0)), min(Ilast, idx+CartesianIndex(+1, 0)),
        max(Ifirst, idx+CartesianIndex(0, -1)), min(Ilast, idx+CartesianIndex(0, +1)),
    ]
end

function day9()
    # Parse input.
    input = open("day_9_input") do f
        return reduce(hcat, map(x -> parse.(Int, x), split.(readlines(f), "")))'
    end

    # Part 1
    # https://julialang.org/blog/2016/02/iteration/#eachindex_cartesianindex_and_cartesianindices
    low_points = Dict()
    R = CartesianIndices(input)
    for I in R
        if all(I == N || input[I] < input[N] for N in neighborhood(R, I))
            push!(low_points, (I => input[I]))
        end
    end
    println("Day 9 part 1: ", sum(values(low_points)) + length(low_points))

    # Part 2
    basin_lengths =  []
    for point in keys(low_points)
        # DFS
        basin, stack = [], [point]
        while !isempty(stack)
            next = pop!(stack)
            if next ∉ basin
                push!(basin, next)
            end

            for N in neighborhood(R, next)
                if input[N] >= input[next] && input[N] != 9 && (N ∉ basin)
                    push!(stack, N)
                end
            end
        end
        push!(basin_lengths, length(basin))
    end
    println("Day 9 part 2: ", prod(sort(basin_lengths)[end-2:end])) #1391940

end

day9()