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

void dfs(int adj_matrix[nodes][nodes], bool visited[nodes], char current_node)
{
    int current = (int)(current_node - 'A');
    visited[current] = true;
    printf("Visited: %c\n", current_node);

    for (int i = 0; i < nodes; i++)
    {
        if (adj_matrix[current][i] == 1 && !visited[i])
        {
            dfs(adj_matrix, visited, (char)('A' + i));
        }
    }
}

int main()
{
    printf("DFS in C\n");
    int adj_matrix[nodes][nodes] = {0};
    clock_t start, end;

    addEdge(adj_matrix, 'A', 'B');
    addEdge(adj_matrix, 'B', 'C');
    addEdge(adj_matrix, 'C', 'D');
    addEdge(adj_matrix, 'D', 'E');
    
    // Perform depth-first search
    start = clock();
    bool visited[nodes] = {false};
    dfs(adj_matrix, visited, 'A');
    end = clock();
    printf("Worst Case Time Complexity: %.2f ms", ((double)((end - start)*1000)/ CLOCKS_PER_SEC));
    return 0;
}