function day11()
    function neighborhood(R, idx)
        Ifirst, Ilast = first(R), last(R)
        I1 = oneunit(Ifirst)
        return max(Ifirst, idx-I1):min(Ilast, idx+I1)
    end

    # Parse input.
    octopuses = open("day_11_input") do f
        return reduce(hcat, map(x -> parse.(Int, x), split.(readlines(f), "")))'
    end

    i, total_flashes = 0, 0
    while true
        i += 1
        octopuses .+= 1

        flashed = zeros(Bool, size(octopuses))      
        while true
            flashing = octopuses .> 9 .&& .!flashed
            flashed .|= flashing
            if sum(flashing) == 0
                break
            end

            if sum(flashed) == size(octopuses, 1)*size(octopuses,2)
                println("Day 11 part 2: ", i)
                return
            end

            total_flashes += sum(flashing)

            R = CartesianIndices(octopuses)
            for r in R
                if flashing[r]      
                    for n in neighborhood(R, r)
                        if n != r
                            octopuses[n] += 1
                        end
                    end
                end
            end

            octopuses[flashed] .= 0
        end

        if i == 100
            println("Day 11 part 1: ", total_flashes)
        end
    end
end

day11()