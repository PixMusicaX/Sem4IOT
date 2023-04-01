#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Approach 1: Linear Search
void linear_search(int *arr, int n, int *max, int *min)
{
    int i;
    *max = arr[0];
    *min = arr[0];
    for (i = 1; i < n; i++)
    {
        if (arr[i] > *max)
        {
            *max = arr[i];
        }
        if (arr[i] < *min)
        {
            *min = arr[i];
        }
    }
}

// Approach 2: Divide and Conquer
void divide_and_conquer(int *arr, int l, int r, int *max, int *min)
{
    int mid;
    if (l == r)
    {
        *max = arr[l];
        *min = arr[l];
    }
    else if (r - l == 1)
    {
        if (arr[r] > arr[l])
        {
            *max = arr[r];
            *min = arr[l];
        }
        else
        {
            *max = arr[l];
            *min = arr[r];
        }
    }
    else
    {
        mid = l + (r - l) / 2;
        int lmax, lmin, rmax, rmin;
        divide_and_conquer(arr, l, mid, &lmax, &lmin);
        divide_and_conquer(arr, mid + 1, r, &rmax, &rmin);
        *max = (lmax > rmax) ? lmax : rmax;
        *min = (lmin < rmin) ? lmin : rmin;
    }
}

int main()
{
    int n = 100000000, i, max, min;
    clock_t start, end;
    int *arr;

    // Allocating memory dynamically
    arr = (int *)malloc(n * sizeof(int));
    if (arr == NULL)
    {
        printf("Memory allocation failed\n");
        return 0;
    }
    printf("Finding max and min in C\n");
    printf("Input size: %d\n", n);

    // Best Case: Array is already sorted
    for (i = 0; i < n; i++)
        arr[i] = i;
    start = clock();
    linear_search(arr, n, &max, &min);
    end = clock();
    printf("Linear Search (Best Case): %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);
    start = clock();
    divide_and_conquer(arr, 0, n - 1, &max, &min);
    end = clock();
    printf("Divide & Conquer (Best Case): %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    // Average Case: Array is random
    for (i = 0; i < n; i++)
        arr[i] = rand() % (n * 10);
    start = clock();
    linear_search(arr, n, &max, &min);
    end = clock();
    printf("Linear Search (Average Case): %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);
    start = clock();
    divide_and_conquer(arr, 0, n - 1, &max, &min);
    end = clock();
    printf("Divide & Conquer (Average Case): %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    // Worst Case: Array is sorted in reverse order
    for (i = 0; i < n; i++)
        arr[i] = n - i;
    start = clock();
    linear_search(arr, n, &max, &min);
    end = clock();
    printf("Linear Search (Worst Case): %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);
    start = clock();
    divide_and_conquer(arr, 0, n - 1, &max, &min);
    end = clock();
    printf("Divide & Conquer (Worst Case): %.2f ms\n", ((double)(end - start)) * 1000 / CLOCKS_PER_SEC);

    free(arr);
    return 0;
}