from collections import deque
import time

def initializeMatrix(n):
    adj_matrix = []
    for i in range(n):
        row = [0] * n
        adj_matrix.append(row)
    return adj_matrix

def addEdge(adj_matrix, u, v):
    u_index = ord(u) - 65
    v_index = ord(v) - 65
    adj_matrix[u_index][v_index] = 1
    adj_matrix[v_index][u_index] = 1

def bfs(adj_matrix, start_node):
    n = len(adj_matrix)
    visited = [False] * n
    queue = deque([start_node])
    while queue:
        node = queue.popleft()
        node_index = ord(node) - 65
        if not visited[node_index]:
            visited[node_index] = True
            print("Visited:",node)
            for neighbor_index in range(n):
                if adj_matrix[node_index][neighbor_index] == 1 and not visited[neighbor_index]:
                    neighbor = chr(neighbor_index + 65)
                    queue.append(neighbor)

adj_matrix = initializeMatrix(5)
addEdge(adj_matrix, 'A', 'C')
addEdge(adj_matrix, 'C', 'B')
addEdge(adj_matrix, 'C', 'D')
#addEdge(adj_matrix, 'D', 'E')
addEdge(adj_matrix, 'C', 'E')

print("BFS in Python")
start = time.time()
bfs(adj_matrix, 'C')
end = time.time()
print("Worst Case Time Complexity:", (end - start)*1000, "ms")