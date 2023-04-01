def floydWarshall(graph):
    dist = list(map(lambda i: list(map(lambda j: j, i)), graph))
    for k in range(V):
        for i in range(V):
            for j in range(V):
                dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
    printSolution(dist)

def printSolution(dist):
    print("The following matrix shows the shortest distances between every pair of vertices:")
    for i in range(V):
        for j in range(V):
            if(dist[i][j] == INF):
                print("%7s" %("INF"), end="")
            else:
                print("%7d\t" %(dist[i][j]), end="")
            if j == V-1:
                print("")
                
V = 5
INF = 99999
graph = [[0, 3, 8, INF, -4],
         [INF, 0, INF, 1, 7],
         [INF, 4, 0, INF, INF],
         [2, INF, -5, 0, INF],
         [INF, INF, INF, 6, 0]]
floydWarshall(graph)