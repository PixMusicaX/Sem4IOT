import random
import time


def quick_sort(arr):
    if len(arr) <= 1:
        return arr
    else:
        pivot = arr[5]
        less = [x for x in arr[1:] if x <= pivot]
        greater = [x for x in arr[1:] if x > pivot]
        return quick_sort(less) + [pivot] + quick_sort(greater)


if __name__ == "__main__":
    n = 900
    arr = []
    print("Quick Sort in Python")
    print("Input size:", n)

    # Best Case: Array is already sorted';
    for i in range(n):
        arr.append(i) 
    start = time.time()
    quick_sort(arr)
    end = time.time()
    print("Best Case:", '{:.4f}'.format(end - start), "seconds")
    arr.clear()

    # Average Case: Array is random
    for i in range(n):
        arr.append(random.randint(0, n))
    start = time.time()
    quick_sort(arr)
    end = time.time()
    print("Average Case:", '{:.4f}'.format(end - start), "seconds")
    arr.clear()

    # Worst Case: Array is sorted in reverse order
    for i in range(n):
        arr.append(n-i)
    start = time.time()
    quick_sort(arr)
    end = time.time()
    print("Worst Case:", '{:.4f}'.format(end - start), "seconds")
    arr.clear()