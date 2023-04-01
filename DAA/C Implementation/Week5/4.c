#include <stdio.h>
#include <stdlib.h>

struct Item
{
    int value, weight;
};

int cmp(const void *a, const void *b)
{
    struct Item *itemA = (struct Item *)a;
    struct Item *itemB = (struct Item *)b;

    double r1 = (double)itemA->value / (double)itemA->weight;
    double r2 = (double)itemB->value / (double)itemB->weight;

    if (r1 > r2)
        return -1;
    else if (r1 < r2)
        return 1;
    else
        return 0;
}

double fractionalKnapsack(int W, struct Item arr[], int N)
{
    qsort(arr, N, sizeof(struct Item), cmp);
    double finalvalue = 0.0;
    for (int i = 0; i < N; i++)
    {
        if (arr[i].weight <= W)
        {
            W -= arr[i].weight;
            finalvalue += arr[i].value;
        }
        else
        {
            finalvalue += arr[i].value * ((double)W / (double)arr[i].weight);
            break;
        }
    }
    return finalvalue;
}

int main()
{
    int W = 15;
    struct Item arr[] = {{1, 3}, {5, 2}, {10, 5}, {10, 7}, {5, 2}, {7, 8}, {8, 4}};
    int n = sizeof(arr) / sizeof(arr[0]);
    printf("Fractional Knapsack in C\n");
    printf("Knapsack Capacity: %d\n", W);
    printf("Item\tWeight\tValue\n");
    for (int i = 0; i < n; i++)
        printf("%d \t%d \t%d \n", i + 1, arr[i].weight, arr[i].value);
    printf("Maximum profit: %f", fractionalKnapsack(W, arr, n));
    return 0;
}