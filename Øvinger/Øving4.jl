function counting_sort_letters(A, position)
    start = Int('a') - 1
    C = fill(0, 26)
    B = fill("", length(A))

    for i in 1:length(A)
        pos = Int(A[i][position]) - start
        C[pos] +=1
    end

    for i in 2:26
        C[i] += C[i-1]
    end

    for i in length(A):-1:1
        pos = Int(A[i][position]) - start
        B[C[pos]] = A[i]
        C[pos] -= 1
    end
    return B
end

print(counting_sort_letters(["ccc", "cba", "ca", "ab", "abc"], 2))

function counting_sort_length(A)
    sortedList = Array{String}(undef, length(A))
    max = 0
    for i in A
        if length(i) > max
            max = length(i)
        end
    end
    countingList = zeros(Int, 1, max + 1)
    for j = 1:length(A)
        index = Int(length(A[j]) + 1)
        countingList[index] += 1
    end
    for i = 2:max + 1
        countingList[i] += countingList[i - 1]
    end
    for j = length(A):-1:1
        index = Int(length(A[j]) + 1)
        sortedList[countingList[index]] = A[j]
        countingList[index] -= 1
    end
    return sortedList
end

print(counting_sort_length(["bbb", "aa", "aaaa", "ccc"]))
