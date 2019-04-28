#!/usr/bin/env julia

# Problem B

coins = parse(Int64,chomp(readline()))

rupees = Int(floor(coins/3)) - 3
println("$(rupees) Rupees")
