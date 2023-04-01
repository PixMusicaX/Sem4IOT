#include <stdio.h>
#include <stdlib.h>

struct graph
{
    char src;
    char dest;
    int weight;
};

int comparator(const void *p1, const void *p2)
{
    const struct graph *x = p1;
    const struct graph *y = p2;
    return x->weight - y->weight;
}

void makeSet(int parent[], int rank[], int n)
{
    for (int i = 0; i < n; i++)
    {
        parent[i] = i;
        rank[i] = 0;
    }
}

int findParent(int parent[], int component)
{
    if (parent[component] == component)
        return component;

    return parent[component] = findParent(parent, parent[component]);
}

void unionSet(int u, int v, int parent[], int rank[], int n)
{
    u = findParent(parent, u);
    v = findParent(parent, v);
    if (rank[u] < rank[v])
        parent[u] = v;
    else if (rank[u] > rank[v])
        parent[v] = u;
    else
    {
        parent[v] = u;
        rank[u]++;
    }
}

void kruskalMST(int v, int n, struct graph g[])
{

    qsort(g, n, sizeof(g[0]), comparator);
    int parent[v];
    int rank[v];
    makeSet(parent, rank, n);

    int minCost = 0;

    printf("Edges \tWeight\n");
    for (int i = 0; i < n; i++)
    {
        char v1 = g[i].src;
        char v2 = g[i].dest;
        int wt = g[i].weight;
        int p1 = v1 - 'A';
        int p2 = v2 - 'A';
        if (findParent(parent, p1) != findParent(parent, p2))
        {
            unionSet(p1, p2, parent, rank, v);
            minCost += wt;
            printf("%c - %c \t%d\n", v1, v2, wt);
        }
    }
    printf("Minimum Spanning Tree: %d\n", minCost);
}

int main()
{
    printf("Kruskal's Algorithm in C\n");
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
    kruskalMST(vertices, numEdges, g);

    return 0;
}