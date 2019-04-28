#!/usr/bin/env julia

# Problem G

# Return the location Mario will be at if he moves with the given number of
# jumps, and (possibly) moves right immediately after, or false if such a move
# is not possible.
function move(mario, jumps=0, right=true)
    global level, R, C
    if !right
        return false
    end

    if (mario[1]==R || level[mario[1]+1,mario[2]] == ' ') && jumps ≥ 1
        # Can't jump in midair.
        return false
    end
    if level[mario[1]-1,mario[2]] == '#' && jumps ≥ 1
        # A block in the way of this jump.
        return false
    end
    if level[mario[1]-2,mario[2]] == '#' && jumps ≥ 2
        # A block in the way of this jump.
        return false
    end

    if jumps ≥ 2
        mario = (mario[1]-jumps, mario[2])
    end

    if !right
        if mario[1] == R || level[mario[1]+1,mario[2]] == '#'
            # If you're not making progress to the right, then it's pointless
            # to just sit here.
            return false
        end
    end
    if right
        if level[mario[1],mario[2]+1] == ' '
            mario = (mario[1], mario[2]+1)
        else
            return false
        end
    end

    if mario[1] == R
        return false
    end
    if level[mario[1]+1,mario[2]] == ' '
        mario = (mario[1]+1,mario[2])
        return mario
    end
    if level[mario[1]+1,mario[2]] == '#'
        return mario
    end
    return mario
end

num_additional_blank_rows = 4
num_additional_blank_cols = 1
R = parse(Int64,chomp(readline())) + num_additional_blank_rows
C = parse(Int64,chomp(readline())) + num_additional_blank_cols
global level = Matrix{Char}(undef,R,C)
for r in 1:num_additional_blank_rows
    for i in 1:C
        level[r,i] = ' '
    end
end
for r in (num_additional_blank_rows+1):R
    row = chomp(readline())
    for i in 1:length(row)
        level[r,i] = row[i]
    end
end

# Starting point for Mario.
mario = (R-1,1)


function leads_to_finish(mario)
    if mario == false
        return false
    end
    if mario[2] == C-num_additional_blank_cols
        return true
    end
    if leads_to_finish(move(mario))
        return true
    end
    if leads_to_finish(move(mario,1))
        return true
    end
    if leads_to_finish(move(mario,2))
        return true
    end
    if leads_to_finish(move(mario,0,false))
        return true
    end
    return false
end

if leads_to_finish(mario)
    println("Mario can make it!")
else
    println("Mario cannot make it!")
end
