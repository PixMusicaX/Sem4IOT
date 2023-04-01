class Graph:
    def __init__(self, vertices):
        self.V = vertices
        self.graph = []

    def addEdge(self, u, v, w):
        u_index = ord(u) - 65
        v_index = ord(v) - 65
        self.graph.append([u_index, v_index, w])

    def find(self, parent, i):
        if parent[i] != i:
            parent[i] = self.find(parent, parent[i])
        return parent[i]

    def union(self, parent, rank, x, y):
        if rank[x] < rank[y]:
            parent[x] = y
        elif rank[x] > rank[y]:
            parent[y] = x
        else:
            parent[y] = x
            rank[x] += 1

    def kruskalMST(self):
        result = []
        i = 0
        e = 0
        self.graph = sorted(self.graph, key=lambda item: item[2])
        parent = []
        rank = []
        for node in range(self.V):
            parent.append(node)
            rank.append(0)
        while e < self.V - 1:
            u, v, w = self.graph[i]
            i = i + 1
            x = self.find(parent, u)
            y = self.find(parent, v)
            if x != y:
                e = e + 1
                result.append([u, v, w])
                self.union(parent, rank, x, y)
        minimumCost = 0
        print("Edge \tWeight")
        for u, v, weight in result:
            minimumCost += weight
            print(f"{chr(u+65)} - {chr(v+65)} \t{weight}")
        print("Minimum Spanning Tree:", minimumCost)


if __name__ == '__main__':
    print("Kruskal's algorithm in Python")
    g = Graph(5)
    g.addEdge('A', 'B', 2)
    g.addEdge('A', 'C', 7)
    g.addEdge('A', 'D', 2)
    g.addEdge('B', 'D', 5)
    g.addEdge('B', 'E', 7)
    g.addEdge('C', 'D', 5)
    g.addEdge('D', 'E', 4)
    g.kruskalMST()