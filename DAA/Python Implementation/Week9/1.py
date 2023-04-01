import sys

def tsp(graph, s):
    n = len(graph)
    visited = [False] * n
    visited[s] = True
    return tsp_helper(graph, s, visited)

def tsp_helper(graph, s, visited):
    n = len(graph)
    if all(visited):
        return graph[s][0]
    min_cost = sys.maxsize
    for i in range(n):
        if not visited[i]:
            visited[i] = True
            cost = graph[s][i] + tsp_helper(graph, i, visited)
            min_cost = min(min_cost, cost)
            visited[i] = False
    return min_cost

graph = [[0, 20, 18, 20], [20, 0, 18,12], [18, 18, 0, 6], [10, 12, 6, 0]]
print("Minimum weight Hamiltonian Circuit:", tsp(graph, 0))