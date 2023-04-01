#include <stdio.h>
#include <limits.h>

int mcm(int arr[], int n)
{
    int dp[n][n];
    for (int i = 1; i < n; i++)
        dp[i][i] = 0;

    for (int i = n - 1; i > 0; i--)
    {
        for (int j = i + 1; j < n; j++)
        {
            dp[i][j] = INT_MAX;
            for (int k = i; k < j; k++)
            {
                int steps = (arr[i - 1] * arr[k] * arr[j]) + dp[i][k] + dp[k + 1][j];
                if (steps < dp[i][j])
                    dp[i][j] = steps;
            }
        }
    }
    return dp[1][n - 1];
}

int main()
{
    int arr[] = {8, 12, 13, 14, 19};
    int n = sizeof(arr) / sizeof(arr[0]);
    int ans = mcm(arr, n);
    printf("Minimal number of scaler multiplications: %d", ans);
}
