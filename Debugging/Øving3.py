import math

def bisect_right(A, p, r, v):
    i = p
    if (p < r):
        q = math.floor((p + r) / 2)
        if (v >= A[q]):
            i = bisect_right(A, q + 1, r, v)
        else:
            i = bisect_right(A, p, q, v)
    return i


a = [1, 3, 3, 4, 5]
print(bisect_right(a, 0, len(a), 3))
