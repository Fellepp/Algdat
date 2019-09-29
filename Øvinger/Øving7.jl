function can_use_greedy(coins)
    for i = 1:length(coins)-1
        if coins[i]%coins[i+1] != 0
            return false
        end
    end
    return true
end

function min_coins_greedy(coins, value)
    coins_used = 0
    pos = 1
    while value>0
        if (value >= coins[pos])
            coins_used += 1
            value = value - coins[pos]
        else
            pos = pos + 1
        end
    end
    return coins_used
end

min_coins_greedy([1000, 500, 100, 20, 5, 1], 1226)
