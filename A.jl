#!/usr/bin/env julia

# Problem A

P1 = parse(Int16,chomp(readline()))
P2 = parse(Int16,chomp(readline()))

if P1 == P2
    println("It is a tie.")
elseif P1 > P2
    println("Player 1 is the winner!")
else
    println("Player 2 is the winner!")
end
