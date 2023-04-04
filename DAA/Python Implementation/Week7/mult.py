import sys

def mcm(arr):
    n = len(arr)
    dp = [[0 for j in range(n)] for i in range(n)]

    for i in range(n-1, 0, -1):
        for j in range(i+1, n):
            dp[i][j] = sys.maxsize
            for k in range(i, j):
                steps = dp[i][k] + dp[k+1][j] + arr[i-1]*arr[k]*arr[j]
                if steps < dp[i][j]:
                    dp[i][j] = steps
    return dp[1][n-1]


arr = [8, 12, 13, 14, 19]
ans = mcm(arr)
print("Minimal number of scaler multiplications:", ans)


#Note: I know the complexity is not bearable but this IS the shortest way to solve this (in terms of lines of code ofc)
