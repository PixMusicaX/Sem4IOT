def knapSack(W, wt, val, n):
    dp = [0 for i in range(W+1)]
    for i in range(1, n+1):
        for w in range(W, 0, -1):
            if wt[i-1] <= w:
                dp[w] = max(dp[w], dp[w-wt[i-1]]+val[i-1])
    return dp[W]


if __name__ == '__main__':
    profit = [10, 12]
    weight = [3, 2]
    W = 7
    n = len(profit)
    print("0/1 Knapsack problem in Python")
    print("Knapsack Capacity:", W)
    print("Item\tWeight\tValue")
    for i in range(n):
        print(f"{i+1}\t{weight[i]}\t{profit[i]}")
    print(f"Maximum profit: {knapSack(W, weight, profit, n)}")