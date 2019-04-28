#!/usr/bin/env julia

# Problem I

N = parse(Int64,chomp(readline()))
rooms = [ [ parse(Int64,y) for y in split(x,' ') ] for x in readlines() ]

function num_rooms_hit(θ,x)   # theta is in degrees
    θ *= 2*π /360
    x = 1

    m = tan(θ)
    b = -x * m
    function the_func(x)
        return m*x+b
    end

    function inverse_func(y)
        return (y-b)/m
    end

    global num_rooms = 0
    for room in rooms
        global num_rooms
        xl = room[1]
        yb = room[2]
        xr = room[3]
        yt = room[4]
        hit_edge = false
        if (yb < the_func(xr) < yt)
            hit_edge = true
        end
        if (yb < the_func(xl) < yt)
            hit_edge = true
        end
        if (xl < inverse_func(yb) < xr)
            hit_edge = true
        end
        if (xl < inverse_func(yt) < xr)
            hit_edge = true
        end
        if hit_edge
            num_rooms += 1
        end
    end
    return num_rooms
end

hit = [ num_rooms_hit(θ, x) for θ in range(.1,89.9,step=.1) for x in range(0,100,step=.1) ]
if maximum(hit) == 1
    println("We can hit 1 room.")
else
    println("We can hit $(maximum(hit)) rooms.")
end
