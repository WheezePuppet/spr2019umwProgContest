#!/usr/bin/env julia

# Problem E

N = parse(Int64,chomp(readline()))

bananas = [0,0,0,0,0]
eatens = [0,0,0,0,0]
names = ["Donkey","Cranky","Dixie","Diddy","Funky"]

for kong in range(1,5,step=1)
    global N
    global bananas, eatens
    taken = floor(N/5)
    eaten = N%5
    bananas[kong] += taken
    eatens[kong] += eaten
    N -= (taken + eaten)
end

bananas = [ bananas[x] + floor(N/5) for x in range(1,5,step=1) ]
pie = N%5

for kong in range(1,5,step=1)
    global bananas, eatens
    println("$(names[kong]) Kong has $(Int(bananas[kong])), and ate $(Int(eatens[kong])).")
end
println("$(Int(pie)) bananas were baked into a pie.")
