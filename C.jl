#!/usr/bin/env julia

# Problem C

shooter = chomp(readline())
readline()  # throw away N

racers = readlines()
shooter_place = findfirst(x->x==shooter,racers)
for i in range(shooter_place-1,1,step=-1)
    println("$(racers[i]) is hit!")
end
