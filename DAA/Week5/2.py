class Graph:
    def __init__(self, v):
        self.V = v
        self.graph = [[0 for j in range(v)] for i in range(v)]

    def addEdge(self, u, v, w):
        u_index = ord(u) - 65
        v_index = ord(v) - 65
        self.graph[u_index][v_index] = w
        self.graph[v_index][u_index] = w

    def printMST(self, parent):
        print("Edge \tWeight")
        for i in range(1, self.V):
            print(
                f"{chr(parent[i]+65)} - {chr(i+65)} \t{self.graph[i][parent[i]]}")

    def minKey(self, key, mstSet):
        min = float('inf')
        min_index = -1
        for v in range(self.V):
            if key[v] < min and mstSet[v] == False:
                min = key[v]
                min_index = v
        return min_index

    def primMST(self):
        key = [float('inf')] * self.V
        parent = [None] * self.V
        key[0] = 0
        mstSet = [False] * self.V
        parent[0] = -1
        for i in range(self.V):
            u = self.minKey(key, mstSet)
            mstSet[u] = True
            for v in range(self.V):
                if self.graph[u][v] > 0 and mstSet[v] == False and key[v] > self.graph[u][v]:
                    key[v] = self.graph[u][v]
                    parent[v] = u
        self.printMST(parent)
        total_cost = sum([self.graph[i][parent[i]] for i in range(1, self.V)])
        print("Total minimum cost:", total_cost)


if __name__ == '__main__':
    print("Prim's algorithm in Python")
    g = Graph(5)
    g.addEdge('A', 'B', 2)
    g.addEdge('A', 'C', 7)
    g.addEdge('A', 'D', 2)
    g.addEdge('B', 'D', 5)
    g.addEdge('B', 'E', 7)
    g.addEdge('C', 'D', 5)
    g.addEdge('D', 'E', 4)
    g.primMST()