import random
import time

# Function to search using linear search
def linear_search(arr, x):
    for i in range(len(arr)):
        if arr[i] == x:
            return i
    return -1

# Function to search using binary search
def binary_search(arr, l, r, x):
    if r >= l:
        mid = l + (r - l) // 2
        if arr[mid] == x:
            return mid
        if arr[mid] > x:
            return binary_search(arr, l, mid - 1, x)
        return binary_search(arr, mid + 1, r, x)
    return -1

# Main function
n = 1000
arr = [random.randint(0, n*10) for i in range(n)]
arr.sort()
   
# Linear search : best case
x = arr[0]
start = time.time()
for i in range(10000):
    result = linear_search(arr, x)
end = time.time()
print("Best case scenario for linear search:", '{:.4f}'.format(end - start), "sec")

# binary search : best case
x = arr[n//2]
start = time.time()
for i in range(10000):
    result = binary_search(arr, 0, n-1, x)
end = time.time()
print("Best case scenario for binary search:", '{:.4f}'.format(end - start), "sec")

# Linear search : average case
x = arr[(n-1)//2]
start = time.time()
for i in range(10000):
    result = linear_search(arr, x)
end = time.time()
print("Average case scenario for linear search:", '{:.4f}'.format(end - start), "sec")

# binary search : average case
x = arr[75]
start = time.time()
for i in range(10000):
    result = binary_search(arr, 0, n-1, x)
end = time.time()
print("Average case scenario for binary search:", '{:.4f}'.format(end - start), "sec")
    
# Linear search : Worst case
x = arr[n-1]
start = time.time()
for i in range(10000):
    result = linear_search(arr, x)
end = time.time()
print("Worst case scenario for linear search:", '{:.4f}'.format(end - start), "sec")

# binary search : Worst case
x = arr[n-1]
start = time.time()
for i in range(10000):
    result = binary_search(arr, 0, n-1, x)
end = time.time()
print("Worst case scenario for binary search:", '{:.4f}'.format(end - start), "sec")