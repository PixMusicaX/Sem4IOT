import random
import time

# Approach 1: Linear Search
def linear_search(arr, n):
    max = arr[0]
    min = arr[0]
    for i in range(1, n):
        if arr[i] > max:
            max = arr[i]
        if arr[i] < min:
            min = arr[i]
    return (max, min)

# Approach 2: Divide and Conquer
def divide_and_conquer(arr, l, r):
    if l == r:
        return (arr[l], arr[l])
    elif r - l == 1:
        if arr[r] > arr[l]:
            return (arr[r], arr[l])
        else:
            return (arr[l], arr[r])
    else:
        mid = l + (r - l) // 2
        lmax, lmin = divide_and_conquer(arr, l, mid)
        rmax, rmin = divide_and_conquer(arr, mid + 1, r)
        max = lmax if lmax > rmax else rmax
        min = lmin if lmin < rmin else rmin
        return (max, min)
    
if __name__=="__main__":
    n = 1000000
    arr = []
    print("Finding max and min in Python")
    print("Input size:", n)

    # Best Case: Array is already sorted
    for i in range(n):
        arr.append(i)
    start = time.time()
    result = linear_search(arr, n)
    end = time.time()
    print("Linear Search (Best Case):", '{:.4f}'.format(end - start), "seconds")
    start = time.time()
    result = divide_and_conquer(arr, 0, n - 1)
    end = time.time()
    print("Divide & Conquer (Best Case):", '{:.4f}'.format(end - start), "seconds")
    arr.clear()

    # Average Case: Array is random
    for i in range(n):
        arr.append(random.randint(0, n))
    start = time.time()
    result = linear_search(arr, n)
    end = time.time()
    print("Linear Search (Average Case):", '{:.4f}'.format(end - start), "seconds")
    start = time.time()
    result = divide_and_conquer(arr, 0, n - 1)
    end = time.time()
    print("Divide & Conquer (Average Case):", '{:.4f}'.format(end - start), "seconds")
    arr.clear()

    # Worst Case: Array is sorted in reverse order
    for i in range(n):
        arr.append(n - i)
    start = time.time()
    result = linear_search(arr, n)
    end = time.time()
    print("Linear Search (Worst Case):", '{:.4f}'.format(end - start), "seconds")
    start = time.time()
    result = divide_and_conquer(arr, 0, n - 1)
    end = time.time()
    print("Divide & Conquer (Worst Case):", '{:.4f}'.format(end - start), "seconds")
    arr.clear()