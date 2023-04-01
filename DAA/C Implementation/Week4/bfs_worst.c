#include <stdio.h>
#include <stdbool.h>
#include <time.h>

#define nodes 8

void addEdge(int adj_matrix[nodes][nodes], char u, char v)
{
    int u_index = (int)(u - 'A');
    int v_index = (int)(v - 'A');
    adj_matrix[u_index][v_index] = 1;
    adj_matrix[v_index][u_index] = 1;
}

void bfs(int adj_matrix[nodes][nodes], bool visited[nodes], char start_node)
{
    int start = (int)(start_node - 'A');
    int queue[nodes];
    int front = -1, rear = -1;
    visited[start] = true;
    queue[++rear] = start;
    while (front != rear)
    {
        int current_node = queue[++front];
        printf("Visited: %c\n", current_node + 'A');
        for (int i = 0; i < nodes; i++)
        {
            if (adj_matrix[current_node][i] == 1 && !visited[i])
            {
                visited[i] = true;
                queue[++rear] = i;
            }
        }
    }
}

int main()
{
    printf("BFS in C\n");
    clock_t start, end;
    int adj_matrix[nodes][nodes] = {0};

    addEdge(adj_matrix, 'A', 'B');
    addEdge(adj_matrix, 'B', 'C');
    addEdge(adj_matrix, 'C', 'D');
    addEdge(adj_matrix, 'D', 'E');

    start = clock();
    bool visited[nodes] = {false};
    bfs(adj_matrix, visited, 'A');
    end = clock();
    printf("Worst Case Time Complexity: %.2f ms", ((double)(end - start)*1000)/ CLOCKS_PER_SEC);
    return 0;
}