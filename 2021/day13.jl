function day13()
    dots, folds = open("day_13_input") do f
        lines = readlines(f)      

        dots = map(x -> parse.(Int64, x), split.(filter(x -> ',' ∈ x, lines), ','))
        folds = map(x -> [x[1][12], parse(Int64, x[2])], split.(filter(x -> '=' ∈ x, lines), '='))

        return dots, folds
    end

    paper = zeros(Bool, maximum(last, dots)+1, maximum(first, dots)+1)
    for dot in dots
        paper[dot[2]+1, dot[1]+1] = 1
    end

    for (idx, fold) in enumerate(folds)
        if fold[1] == 'y' # horizontal
            new_paper = paper[1:fold[2], :]
            for (k,i) in enumerate(fold[2]+2:size(paper, 1))
                new_paper[end-k+1, :] .|= paper[i, :]
            end
            paper = new_paper
        elseif fold[1] == 'x' # vertical
            new_paper = paper[:, 1:fold[2]]
            for (k,i) in enumerate(fold[2]+2:size(paper, 2))
                new_paper[:, end-k+1] .|= paper[:, i]
            end
            paper = new_paper
        end

        if idx == 1
            println("Day 13 part 1: ", sum(paper))
        end
    end

    println("Day 13 part 2: ")
    for row in eachrow(paper)
        println(join([b ? '#' : ' ' for b in row]))
    end
end

day13()