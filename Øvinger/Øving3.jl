function bisect_left(A, p, r, v)
    i = p
    if p < r
        q = floor(Int, (p+r)/2)  # floor() er en innebygd funksjon som runder ned. ceil() runder opp.
        if v <= A[q]
            i = bisect_left(A, p, q, v)
        else
            i = bisect_left(A, q+1, r, v)
        end
    end
    return i
end

a = [1, 2, 3, 4, 5, 6, 7]

function bisect_right(A, p, r, v)
    i = p
    if  p < r
        q = floor(Int, (p+r)/2)
        if (v < A[q])
            i = bisect_right(A, p, q, v)
        else
            i = bisect_right(A, q+1, r, v)
        end
    end
    return i
end

println(bisect_left(a, 1, length(a) + 1, 4))
println(bisect_right(a, 1, length(a) + 1, 4))

function partition(A, p, r)
    x = A[r]
    i = p-1
    for j = p:r - 1
        if A[j] <= x
            i = i += 1
            tmp = A[i]
            A[i] = A[j]
            A[j] = tmp
        end
    end
    tmp = A[i + 1]
    A[i + 1] = A[r]
    A[r] = tmp
    return i+1
end

function quicksort(A, p, r)
    if p < r
        q = partition(A, p, r)
        quicksort(A, p, q-1)
        quicksort(A, q+1, r)
    end
end

function algdat_sort!(A)
    quicksort(A, 1, length(A))
end

function find_median(A, lower, upper)
    i = bisect_left(A, 1, length(A) + 1, lower)
    j = bisect_right(A, 1, length(A) + 1, upper)
    medianList = A[i:j-1]
    l = lenght(medianList)
    if (l%2 == 0)
        return (medianList[floor(Int, l/2)] + medianList[floor(Int, l/2 + 1)]) / 2
    end
    return medianList[ceil(Int, l/2)]
end
