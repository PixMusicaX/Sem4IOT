import random
import time

def minIndex( a , i , j ):
    if i == j:
        return i
    k = minIndex(a, i + 1, j)
    return (i if a[i] < a[k] else k)

def selection_sort(a, n, index):
    if index == n:
        return -1
    k = minIndex(a, index, n-1)
    if k != index:
        a[k], a[index] = a[index], a[k]
    selection_sort(a, n, index + 1)
    
n = 500
arr = []
print("Input size:", n)

# Best Case: Array is already sorted
for i in range(n):
    arr.append(i) 
start = time.time()
selection_sort(arr,n,0)
end = time.time()
print("Best Case:", '{:.4f}'.format(end - start), "seconds")
arr.clear()

# Average Case: Array is random
for i in range(n):
    arr.append(random.randint(0, n))
start = time.time()
selection_sort(arr,n,0)
end = time.time()
print("Average Case:", '{:.4f}'.format(end - start), "seconds")
arr.clear()

# Worst Case: Array is sorted in reverse order
for i in range(n):
    arr.append(n-i)
start = time.time()
selection_sort(arr,n,0)
end = time.time()
print("Worst Case:", '{:.4f}'.format(end - start), "seconds")
arr.clear()