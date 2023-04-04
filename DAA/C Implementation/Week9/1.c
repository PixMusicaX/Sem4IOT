#include <stdio.h>
#include <limits.h>

#define V 4

int graph[V][V] = {{0, 20, 18, 20},
                   {20, 0, 18,12},
                   {18, 18, 0, 6},
                   {10, 12, 6, 0}};

int VISITED_ALL = (1 << V) - 1;

int tsp(int mask,int pos){
    if(mask==VISITED_ALL){
        return graph[pos][0];
    }
    int ans=INT_MAX;
    for(int city=0;city<V;city++){
        if((mask&(1<<city))==0){
            int newAns=graph[pos][city]+tsp(mask|(1<<city),city);
            ans=ans<newAns?ans:newAns;
        }
    }
    return ans;
}

int main(){
    printf("Minimum weight Hamiltonian Circuit: %d\n",tsp(1<<0 ,0));
    return 0;
}
