#!/usr/bin/env julia

# Problem D

readline()  # throw away N
codes = readlines()

tot = 0

for i in range(1,length(codes),step=1)
    global tot
    code = codes[i]
    if code == "MB"
        tot += 15
    elseif code == "PO"
        tot += 7
    elseif code == "YA"
        tot += 5
    elseif code == "BW"
        tot -= 25
    elseif code == "NS"
        tot -= 15
    elseif code == "NW"
        tot += 8
    elseif code == "ST"
        tot += 12
    end
end

println("Score is $(tot).")

