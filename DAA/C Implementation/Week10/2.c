#include <stdio.h>
#include <stdbool.h>

bool is_safe(int graph[][4], int vertex, int color_map[], int c) {
    for (int i = 0; i < 4; i++) {
        if (graph[vertex][i] == 1 && color_map[i] == c) {
            return false;
        }
    }
    return true;
}

bool color(int graph[][4], int vertex, int color_map[], int m) {
    if (vertex == 4) {
        return true;
    }
    for (int i = 1; i <= m; i++) {
        if (is_safe(graph, vertex, color_map, i)) {
            color_map[vertex] = i;
            if (color(graph, vertex+1, color_map, m)) {
                return true;
            }
            color_map[vertex] = 0;
        }
    }
    return false;
}

int main() {
    int graph[4][4] = {{0, 1, 0, 1}, {1, 0, 1, 1}, {0, 1, 0, 1}, {1, 1, 1, 0}};
    int m = 3;
    int color_map[4] = {0};

    if (color(graph, 0, color_map, m)) {
        printf("[");
        for (int i = 0; i < 4; i++) {
            printf("%d", color_map[i]);
            if (i != 3) {
                printf(", ");
            }
        }
        printf("]\n");
    } else {
        printf("No solution exists.\n");
    }

    return 0;
}