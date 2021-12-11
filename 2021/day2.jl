function day2()
    horizontal = 0
    depth = 0
    depth_with_aim = 0

    for line in eachline("day_2_input")
        direction, value = split(line)
        value = parse(Int64, value)

        if direction == "forward"
            horizontal += value
            depth_with_aim += depth * value
        elseif direction == "up"
            depth -= value
        elseif direction == "down"
            depth += value
        end
    end

    println("Day 2 part 1: ", horizontal*depth)
    println("Day 2 part 2: ", horizontal*depth_with_aim)
end

day2()