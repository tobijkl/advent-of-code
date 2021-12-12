using Statistics

function day10()
    input = open("day_10_input") do f
        return readlines(f)
    end
    
    brackets = Dict('(' => ')', '[' => ']', '{' => '}', '<' => '>')
    points = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
    auto_points = Dict(')' => 1, ']' => 2, '}' => 3, '>' => 4)

    syntax_error_score = 0
    auto_complete_scores = []
    for line in input
        stack = []
        corrupted = false
        for b in line
            if b ∈ keys(brackets)
                push!(stack, b)                
            else
                c = pop!(stack)
                if b != brackets[c]
                    corrupted = true
                    syntax_error_score += points[b]
                end
            end
        end

        if !corrupted
            auto_complete_score = 0
            for s in reverse(stack)
                auto_complete_score *= 5
                auto_complete_score += auto_points[brackets[s]]
            end
            push!(auto_complete_scores, auto_complete_score)
        end
    end 

    println("Day 10 part 1: ", syntax_error_score)
    println("Day 10 part 2: ", Int64(median(auto_complete_scores)))
end

day10()