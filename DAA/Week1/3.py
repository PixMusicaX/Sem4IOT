import random
import time

def insertion_sort(arr, n):
    if n<=1:
        return
    insertion_sort(arr,n-1)
    last = arr[n-1]
    j = n-2
    while (j>=0 and arr[j]>last):
        arr[j+1] = arr[j]
        j = j-1
    arr[j+1]=last


n = 5000
arr = []
print("Input size:", n)

# Best Case: Array is already sorted
for i in range(n):
    arr.append(i) 
start = time.time()
insertion_sort(arr,n)
end = time.time()
print("Best Case:", '{:.4f}'.format(end - start), "seconds")
arr.clear()

# Average Case: Array is random
for i in range(n):
    arr.append(random.randint(0, n))
start = time.time()
insertion_sort(arr,n)
end = time.time()
print("Average Case:", '{:.4f}'.format(end - start), "seconds")
arr.clear()

# Worst Case: Array is sorted in reverse order
for i in range(n):
    arr.append(n-i)
start = time.time()
insertion_sort(arr,n)
end = time.time()
print("Worst Case:", '{:.4f}'.format(end - start), "seconds")
arr.clear()
