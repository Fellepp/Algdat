function findset(x::DisjointSetNode)
    if x!= x.p
        x.p = findset(x.p)
    end
    return x.p
end

function union!(x::DisjointSetNode, y::DisjointSetNode)
    link(findset(x), findset(y))
end

function link(x, y)
    if x.rank > y.rank
        y.p == x
    else
        x.p = y
    end
    if x.rank == y.rank
            y.rank = y.rank + 1
    end
end
