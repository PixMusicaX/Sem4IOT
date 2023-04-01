#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int minIndex(int a[], int i, int j)
{
    if (i == j)
        return i;
    int k = minIndex(a, i + 1, j);
    return (a[i] < a[k])? i : k;
}

void selection_sort(int a[], int n, int index)
{
    if (index == n)
       return;
    int k = minIndex(a, index, n-1);
    if (k != index)
    {
       a[k]= a[k] + a[index];
       a[index - 1] = a[k] - a[index];
       a[k] = a[k] - a[index];
    }
    selection_sort(a, n, index + 1);
}

int main()
{
    int n = 10000, i;
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
    selection_sort(arr, n, 0);
    end = clock();
    printf("Best Case: %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    // Average Case: Array is random
    for (i = 0; i < n; i++)
        arr[i] = rand() % n;
    start = clock();
    selection_sort(arr, n, 0);
    end = clock();
    printf("Average Case: %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    // Worst Case: Array is sorted in reverse order
    for (i = 0; i < n; i++)
        arr[i] = n - i;
    start = clock();
    selection_sort(arr, n, 0);
    end = clock();
    printf("Worst Case %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    free(arr);
    return 0;
}