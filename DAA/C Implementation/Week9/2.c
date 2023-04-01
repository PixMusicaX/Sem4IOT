#include <stdio.h>
#define INF 99999

void floydWarshall (int graph[][5]) 
{
    int dist[5][5], i, j, k;
    for (i = 0; i < 5; i++)
        for (j = 0; j < 5; j++)
            dist[i][j] = graph[i][j];
    for (k = 0; k < 5; k++) {
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                if (dist[i][k] + dist[k][j] < dist[i][j])
                    dist[i][j] = dist[i][k] + dist[k][j];
            }
        }
    }
    printf ("The following matrix shows the shortest distances between every pair of vertices:\n");
    for (i = 0; i < 5; i++) {
        for (j = 0; j < 5; j++) {
            if (dist[i][j] == INF)
                printf ("%7s", "INF");
            else
                printf ("%7d", dist[i][j]);
        }
        printf("\n");
    }
}

int main () 
{
    int graph[5][5] = {{0, 3, 8, INF, -4},
                       {INF, 0, INF, 1, 7},
                       {INF, 4, 0, INF, INF},
                       {2, INF, -5, 0, INF},
                       {INF, INF, INF, 6, 0}};
    floydWarshall(graph);
    return 0;
}