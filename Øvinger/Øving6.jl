function cumulative(weights)
    rader, kolonner = size(weights)

    a = copy(weights)
    for rad = 2:rader
        for kolonne = 1:kolonner
            element = a[rad, kolonne]
            if (kolonne == 1)
                minste = min(element + a[rad-1, kolonne],
                            element + a[rad-1, kolonne+1])
            elseif (kolonne == kolonner)
                minste = min(element + a[rad-1, kolonne-1],
                            element + a[rad-1, kolonne])
            else
                minste = min(element + a[rad-1, kolonne-1],
                            element + a[rad-1, kolonne],
                            element + a[rad-1, kolonne+1])
            end
            a[rad, kolonne] = minste
        end
    end
    return a
end

a = zeros(Int8, (5, 5))
cumulative(a)


function back_track(path_weights)
    path = []
    rader, kolonner = size(path_weights)
    verdi = Inf
    indeks = Inf
    for kolonne = 1: kolonner
        if (path_weights[rader, kolonne] < verdi)
            verdi = path_weights[rader, kolonne]
            indeks = kolonne
        end
    end

    push!(path, (rader, indeks))

    for rad = rader-1:-1:1
        push!(path, (rad, pathFinder(path_weights, indeks, rad)))
        indeks = pathFinder(path_weights, indeks, rad)
    end
        return path
end

function pathFinder(matrix, indeks, rad)
    rader, kolonner = size(matrix)

    start = 0
    slutt = 0

    if (indeks == 1)
        start = 1
        slutt = 2
    elseif (indeks == kolonner)
        start = kolonner-1
        slutt = kolonner
    else
        start = indeks-1
        slutt = indeks+1
    end
        verdi = Inf
        indeks = Inf
    for kolonne = start:slutt
        if matrix[rad, kolonne] < verdi
            verdi = matrix[rad, kolonne]
            indeks = kolonne
        end
    end
    return indeks
end
back_track(a)
