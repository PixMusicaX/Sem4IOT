#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

struct graph
{
    char src;
    char dest;
    int weight;
};

void primMST(int v, int n, struct graph g[])
{
    int adjMat[v][v], visited[v];
    int i, j;

    for (i = 0; i < v; i++)
    {
        for (j = 0; j < v; j++)
        {
            adjMat[i][j] = 0;
        }
        visited[i] = 0;
    }

    for (i = 0; i < n; i++)
    {
        int v1 = g[i].src - 'A';
        int v2 = g[i].dest - 'A';
        int wt = g[i].weight;
        adjMat[v1][v2] = adjMat[v2][v1] = wt;
    }
    int dist[v];
    int parent[v];
    for (i = 0; i < v; i++)
    {
        dist[i] = INT_MAX;
        parent[i] = -1;
    }
    dist[0] = 0;
    for (i = 0; i < n - 1; i++)
    {
        int minDist = INT_MAX;
        int minIndex = -1;
        for (j = 0; j < v; j++)
        {
            if (!visited[j] && dist[j] < minDist)
            {
                minDist = dist[j];
                minIndex = j;
            }
        }
        visited[minIndex] = 1;
        for (j = 0; j < v; j++)
        {
            if (adjMat[minIndex][j] && !visited[j] && adjMat[minIndex][j] < dist[j])
            {
                dist[j] = adjMat[minIndex][j];
                parent[j] = minIndex;
            }
        }
    }

    int minCost = 0;
    printf("Edges \tWeight\n");
    for (i = 1; i < v; i++)
    {
        if (parent[i] != -1)
        {
            char v1 = parent[i] + 'A';
            char v2 = i + 'A';
            int wt = adjMat[i][parent[i]];
            minCost += wt;
            printf("%c - %c \t%d\n", v1, v2, wt);
        }
    }
    printf("Minimum Spanning Tree: %d\n", minCost);
}

int main()
{
    printf("Prim's Algorithm in C\n");

    int vertices = 5;
    struct graph g[] =
        {
            {'A', 'B', 2},
            {'A', 'C', 7},
            {'A', 'D', 2},
            {'B', 'D', 5},
            {'B', 'E', 7},
            {'C', 'D', 5},
            {'D', 'E', 4}};

    int numEdges = sizeof(g) / sizeof(struct graph);
    primMST(vertices, numEdges, g);
    return 0;
}