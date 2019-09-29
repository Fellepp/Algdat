using Pkg
Pkg.add("DataStructures")

mutable struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end
Node(id) = Node(id, [], nothing, nothing, nothing)


function makenodelist(adjacencylist)
    nodes = []
    for i = 1:length(adjacencylist)
        push!(nodes, Node(i))
    end
    i = 1
    for neighbours in adjacencylist
        for node in neighbours
            push!(nodes[i].neighbours, nodes[node])
        end
        i += 1
    end
    return nodes
end

function printnodelist(nodelist)
    println("Skriver ut nodeliste med printnodelist")
    for node in nodelist
        neighbourlist = [neighbours.id for neighbours in node.neighbours]
        println("id: $(node.id), neighbours: $neighbourlist")
    end
end


function main(;n=5, degree=3)
    println("Kjører makenodelist")
    adjacencylist = generateadjacencylist(n, degree)
    @info "adjacencylist" adjacencylist
    nodelist = makenodelist(adjacencylist)
    printnodelist(nodelist)
end


generateadjacencylist(n, degree) = [rand(1:n, degree) for id = 1:n]


# Det kan være nyttig å kjøre mange tester for å se om programmet man har laget
# krasjer for ulike instanser
function runmanytests(;maxlistsize=15)
    # Kjører n tester for hver listestørrelse – én for hver grad
    for n = 1:maxlistsize
        for degree = 1:n
            adjacencylist = generateadjacencylist(n, degree)
            @info "Listelendge $n" n, degree #, adjacencylist
            makenodelist(adjacencylist)
        end
    end
end

printnodelist(makenodelist([[2,3], [3], [4], []]))
#main()
#runmanytests()

using DataStructures: Queue, enqueue!, dequeue!

function bfs!(nodes, start)
    for u in nodes
        u.color = "WHITE"
        u.distance = nothing
        u.predecessor = nothing
    end
    start.color = "GRAY"
    start.distance = 0
    q = Queue(Node)
    enqueue!(q, start)
    while (length(q) > 0)
        u = dequeue!(q)
        if (isgoalnode(u)) return u
        end
        for v in u.neighbours
            if (v.color == "WHITE")
                v.color = "GRAY"
                v.distance = u.distance + 1
                v.predecessor = u
                enqueue!(q, v)
            end
        end
        u.color = "BLACK"
    end
    return nothing
end

nodes = []
for i = 1:5
    push!(nodes, Node(i))
end

bfs!(nodes, nodes[1])
