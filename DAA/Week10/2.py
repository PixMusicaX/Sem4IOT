def color(graph, vertex, color_map, m):
    if vertex == len(graph):
        return True
    for i in range(1, m+1):
        if is_safe(graph, vertex, color_map, i):
            color_map[vertex] = i
            if color(graph, vertex+1, color_map, m):
                return True
            color_map[vertex] = 0

def is_safe(graph, vertex, color_map, c):
    for i in range(len(graph)):
        if graph[vertex][i] == 1 and color_map[i] == c:
            return False
    return True

graph = [[0, 1, 0, 1], [1, 0, 1, 1], [0, 1, 0, 1], [1, 1, 1, 0]]
m = 3
color_map = [0] * len(graph)

if color(graph, 0, color_map, m):
    print(color_map)
else:
    print("No solution exists.")