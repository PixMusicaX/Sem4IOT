#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

struct graph
{
    char src;
    char dest;
    int weight;
};

int minDistance(int dist[], int visited[], int V)
{
    int min = INT_MAX, min_index;

    for (int v = 0; v < V; v++)
        if (visited[v] == 0 && dist[v] <= min)
            min = dist[v], min_index = v;

    return min_index;
}

void dijkstra(struct graph g[], int n, int V, int src)
{
    int adjMat[V][V];
    int dist[V];
    int visited[V];
    src = src - 'A';

    for (int i = 0; i < V; i++)
    {
        dist[i] = INT_MAX;
        visited[i] = 0;
        for (int j = 0; j < V; j++)
            adjMat[i][j] = 0;
    }
    dist[src] = 0;

    for (int i = 0; i < n; i++)
        adjMat[g[i].src - 'A'][g[i].dest - 'A'] = g[i].weight;

    for (int count = 0; count < V - 1; count++)
    {
        int u = minDistance(dist, visited, V);
        visited[u] = 1;
        for (int v = 0; v < V; v++)
        {
            if (!visited[v] && adjMat[u][v] && dist[u] != INT_MAX && dist[u] + adjMat[u][v] < dist[v])
                dist[v] = dist[u] + adjMat[u][v];
        }
    }

    printf("Vertex \t Distance from '%c'\n", src + 'A');
    for (int i = 0; i < V; i++)
        printf("%c \t %d\n", 'A' + i, dist[i]);
}

int main()
{
    printf("Dijkstra's Algorithm in C\n");
    int vertices = 5;
    struct graph g[] =
        {{'A', 'B', 3},
         {'A', 'E', 5},
         {'B', 'C', 8},
         {'B', 'D', 5},
         {'B', 'E', 3},
         {'D', 'C', 2},
         {'E', 'D', 4}};

    int numEdges = sizeof(g) / sizeof(g[0]);
    dijkstra(g, numEdges, vertices, 'A');
    return 0;
}