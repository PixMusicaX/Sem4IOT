import random
import time

def bubble_sort(arr, n):
    count = 0
    if n == 1:
        return
    for i in range(n - 1):
        if arr[i] > arr[i+1]:
            arr[i], arr[i+1] = arr[i+1], arr[i]
            count = count + 1
    if (count==0):
        return
    bubble_sort(arr, n - 1)

n = 500
arr = []
print("Input size:", n)

# Best Case: Array is already sorted
for i in range(n):
    arr.append(i) 
start = time.time()
bubble_sort(arr,n)
end = time.time()
print("Best Case:", '{:.4f}'.format(end - start), "sec")
arr.clear()

# Average Case: Array is random
for i in range(n):
    arr.append(random.randint(0, n))
start = time.time()
bubble_sort(arr,n)
end = time.time()
print("Average Case:", '{:.4f}'.format(end - start), "sec")
arr.clear()

# Worst Case: Array is sorted in reverse order
for i in range(n):
    arr.append(n-i)
start = time.time()
bubble_sort(arr,n)
end = time.time()
print("Worst Case:", '{:.4f}'.format(end - start), "sec")
arr.clear()