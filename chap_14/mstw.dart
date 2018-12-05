import 'dart:io';

class Edge {
  int srcVert;
  int destVert;
  int distance;

  Edge(this.srcVert, this.destVert, this.distance);
}

class PriorityQueue {
  int maxSize = 20;
  List<Edge> queueArray;
  int size;

  PriorityQueue() {
    queueArray = new List<Edge>(this.maxSize);
    size = 0;
  }

  void insert(Edge item) {
    int i;
    for(i = 0; i < size; i ++ ) {
      if(item.distance >= queueArray[i].distance) {
        break;
      }
    }

    for(int j = size - 1; j >= i; j --) {
      queueArray[j + 1] = queueArray[j];
    }

    queueArray[i] = item;
    size ++;
  }

  Edge removeMin() {
    return queueArray[--size];
  }

  void removeN(int n) {
    for(int i = n; i < size - 1; i ++) {
      queueArray[i] = queueArray[i + 1];
    }
    size --;
  }

  Edge peekMin() {
    return queueArray[size - 1];
  }

  bool isEmpty() {
    return size == 0;
  }

  Edge peekN(int n) {
    return queueArray[n];
  }

  int find(int findDex) {
    for(int i = 0; i < size; i ++) {
      if(queueArray[i].destVert == findDex) {
        return i;
      }
    }

    return -1;
  }
}

class Vertex {
  String label;
  bool isInTree;

  Vertex(this.label) {
    isInTree = false;
  }
}
class GraphMstw {
  final int maxVerts = 20;
  final int INFINITY = 1000000;
  List<Vertex> vertexList;
  List<List<int>> adjMat;
  int nVerts;
  int currentVert;
  PriorityQueue priorityQueue;
  int nTree;

  GraphMstw() {
    nTree = 0;
    currentVert = 0;
    vertexList = new List<Vertex>(maxVerts);
    adjMat = new List.generate(maxVerts, (int i) => new List(maxVerts));
    nVerts = 0;
    for(int i = 0; i < maxVerts; i ++) {
      for(int j = 0; j < maxVerts; j ++) {
        adjMat[i][j] = INFINITY;
      }
    }

    priorityQueue = new PriorityQueue();
  }

  void addVertex(String label) {
    vertexList[nVerts++] = new Vertex(label);
  }

  void addEdge(int start, int end, int weight) {
    adjMat[start][end] = weight;
    adjMat[end][start] = weight;
  }

  void displayVertex(int v) {
    stdout.write(vertexList[v].label);
  }

  void mstw() {
    currentVert = 0;

    while(nTree < nVerts - 1) {
      vertexList[currentVert].isInTree = true;
      nTree ++;

      for(int i = 0; i < nVerts; i ++) {
        if (i == currentVert) {
          continue;
        }
        if (vertexList[i].isInTree) {
          continue;
        }
        int distance = adjMat[currentVert][i];

        if(distance == INFINITY) {
          continue;
        }

        putInPriorityQueue(i, distance);
      }

      if(priorityQueue.size == 0) {
        stdout.writeln(' GRAPH NOT CONNECTED');
        return;
      }

      Edge edge = priorityQueue.removeMin();
      int sourceVert = edge.srcVert;
      currentVert = edge.destVert;

      stdout.write(vertexList[sourceVert].label);
      stdout.write(vertexList[currentVert].label);
      stdout.write(' ');
    }

    for(int i = 0; i < nVerts; i ++) {
      vertexList[i].isInTree = false;
    }
  }

  void putInPriorityQueue(int newVert, int newDist) {
    int queueIndex = priorityQueue.find(newVert);
    if(queueIndex != -1) {
      Edge tempEdge = priorityQueue.peekN(queueIndex);
      int oldDist = tempEdge.distance;
      if(oldDist > newDist) {
        priorityQueue.removeN(queueIndex);
        Edge edge = new Edge(currentVert, newVert, newDist);
        priorityQueue.insert(edge);
      }
    } else {
      Edge edge = new Edge(currentVert, newVert, newDist);
      priorityQueue.insert(edge);
    }
  }
}

void main() {
  GraphMstw graph = new GraphMstw();
  
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');
  graph.addVertex('E');
  graph.addVertex('F');

  graph.addEdge(0, 1, 6);   // AB 6
  graph.addEdge(0, 3, 4);   // AD 4
  graph.addEdge(1, 2, 10);  // BC 10
  graph.addEdge(1, 3, 7);   // BD 7
  graph.addEdge(1, 4, 7);   // BE 7
  graph.addEdge(2, 3, 8);   // CD 8
  graph.addEdge(2, 4, 5);   // CE 5
  graph.addEdge(2, 5, 6);   // CF 6
  graph.addEdge(3, 4, 12);  // DE 12
  graph.addEdge(4, 5, 7);   // EF 7

  stdout.write('Minimum spanning tree: ');
  graph.mstw();
}
