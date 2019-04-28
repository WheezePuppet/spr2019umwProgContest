#!/usr/bin/env julia

# Problem F

function record(f)
    if f ∈ keys(wins)
        w = wins[f]
    else
        w = 0
    end
    if f ∈ keys(losses)
        l = losses[f]
    else
        l = 0
    end
    return "$(w)-$(l)"
end
    

num_fighters = parse(Int64,chomp(readline()))
fighters = [ chomp(readline()) for i in 1:num_fighters ]
wins = Dict()
losses = Dict()

num_matches = parse(Int64,chomp(readline()))
matches = [ chomp(readline()) for i in 1:num_matches ]

for match in matches
    parts = split(match," ")
    winner = parts[1]
    loser = parts[3][1:length(parts[3])-1]
    if winner ∉  keys(wins)
        wins[winner] = 0
    end
    wins[winner] += 1
    if loser ∉  keys(losses)
        losses[loser] = 0
    end
    losses[loser] += 1
end

undefeateds = [ String(f) for f in keys(wins) if !(f in keys(losses)) ]
total_losers = [ String(f) for f in keys(losses) if !(f in keys(wins)) ]
normals = [ String(x) for x in (setdiff(keys(wins) ∪  keys(losses), (undefeateds ∪ total_losers)))]

function compareto(f1,f2)
    if f1 ∈ keys(wins) && f2 ∈ keys(wins) && f1 ∉ keys(losses) && f2 ∉ keys(losses)
        if wins[f1] == wins[f2]
            return f1 < f2
        else
            return wins[f1] > wins[f2]
        end
    end
    if f1 ∈ keys(losses) && f2 ∈ keys(losses) && f1 ∉ keys(wins) && f2 ∉ keys(wins)
        if losses[f1] == losses[f2]
            return f1 < f2
        else
            return losses[f1] < losses[f2]
        end
    end
    f1_score = 2*wins[f1] - losses[f1]
    f2_score = 2*wins[f2] - losses[f2]
    if f1_score > f2_score
        return true
    elseif f2_score > f1_score
        return false
    end
    return f1<f2
end

sort!(undefeateds, lt=compareto)
sort!(normals, lt=compareto)
sort!(total_losers, lt=compareto)

da_order = [ undefeateds; normals; total_losers ]

for f in da_order
    println("$(f): $(record(f))")
end

