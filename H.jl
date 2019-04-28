#!/usr/bin/env julia

# Problem H

function win(switches)
    all(switches)
end

function flip(switches, n)
    switches = copy(switches)
    if n == 1
        switches[1] = !switches[1]
        switches[2] = !switches[2]
    elseif n == length(switches)
        switches[n-1] = !switches[n-1]
        switches[n] = !switches[n]
    else
        switches[n-1] = !switches[n-1]
        switches[n] = !switches[n]
        switches[n+1] = !switches[n+1]
    end
    return switches
end

N = parse(Int64,chomp(readline()))
switches = [ line == "On" ? true : false for line in readlines() ]

function gives_win(switches, n)
    global N
#println("gives_win($(switches),$(n))")
    switches = flip(switches,n)
    if win(switches)
        return 1
    end
    for k in (n+1):N
        ans = gives_win(switches, k)
        if ans > -1
            return ans + 1
        end
    end
    return -1
end


answer = gives_win(switches, 1)
if answer == -1
    println("There is no solution.")
else
    println("Link must pull $(answer) switches.")
end
