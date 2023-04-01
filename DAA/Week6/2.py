import sys

class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = [[0 for column in range(vertices)]
                      for row in range(vertices)]

    def add_edge(self, u, v, w):
        self.graph[ord(u) - 65][ord(v) - 65] = w

    def min_distance(self, dist, sptSet):
        min = sys.maxsize
        min_index = -1

        for v in range(self.V):
            if dist[v] < min and sptSet[v] == False:
                min = dist[v]
                min_index = v

        return min_index

    def dijkstra(self, src):
        dist = [sys.maxsize] * (self.V)
        dist[src] = 0
        sptSet = [False] * (self.V)
        for i in range(self.V):
            u = self.min_distance(dist, sptSet)
            sptSet[u] = True
            for v in range(self.V):
                if self.graph[u][v] > 0 and sptSet[v] == False and dist[v] > dist[u] + self.graph[u][v]:
                    dist[v] = dist[u] + self.graph[u][v]

        print(f"Vertex \tDistance from '{chr(src+65)}'")
        for node in range(self.V):
            print(f"{chr(node+65)} \t {dist[node]}")


if __name__ == '__main__':
    g = Graph(5)
    g.add_edge('A', 'B', 3)
    g.add_edge('A', 'E', 5)
    g.add_edge('B', 'C', 8)
    g.add_edge('B', 'D', 5)
    g.add_edge('B', 'E', 3)
    g.add_edge('D', 'C', 2)
    g.add_edge('E', 'D', 4)

    print("Dijkstra's algorithm in Python")
    start = ord('A')-65
    g.dijkstra(start)