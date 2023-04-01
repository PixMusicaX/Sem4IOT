#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void bubble_sort(int *arr, int n)
{
  if (n == 1)
        return;
    int count = 0;
    for (int i=0; i<n-1; i++)
        {
            if (arr[i] > arr[i+1])
            {
                arr[i]= arr[i] + arr[i+1];
                arr[i + 1] = arr[i] - arr[i+1];
                arr[i] = arr[i] - arr[i+1];
                count++;
            }
        }
      if (count==0)
           return;
    bubble_sort(arr, n-1);
}

int main()
{
    int n = 5000, i;
    clock_t start, end;
    int *arr;

    // Allocating memory dynamically
    arr = (int *)malloc(n * sizeof(int));
    if (arr == NULL)
    {
        printf("Memory allocation failed\n");
        return 0;
    }

    // Best Case: Array is already sorted
    for (i = 0; i < n; i++)
        arr[i] = i;
    start = clock();
    bubble_sort(arr, n);
    end = clock();
    printf("Best Case: %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    // Average Case: Array is random
    for (i = 0; i < n; i++)
        arr[i] = rand() % n;
    start = clock();
    bubble_sort(arr, n);
    end = clock();
    printf("Average Case: %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    // Worst Case: Array is sorted in reverse order
    for (i = 0; i < n; i++)
        arr[i] = n - i;
    start = clock();
    bubble_sort(arr, n);
    end = clock();
    printf("Worst Case %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    free(arr);
    return 0;
}