import 'dart:io';

class Vertex {
  String label;
  bool wasVisited;

  Vertex(this.label) {
    this.wasVisited = false;
  }
}

class Graph {
  final int maxVerts = 20;
  List<Vertex> vertexList;
  List<List<int>> adjMat;
  int nVerts;

  Graph() {
    vertexList = new List<Vertex>(maxVerts);
    adjMat = new List.generate(maxVerts, (int i) => new List(maxVerts));
    nVerts = 0;
    for(int i = 0; i < maxVerts; i ++) {
      for(int j = 0; j < maxVerts; j ++) {
        adjMat[i][j] = 0;
      }
    }
  }

  void addVertex(String label) {
    vertexList[nVerts++] = new Vertex(label);
  }

  void addEdge(int start, int end) {
    adjMat[start][end] = 1;
    adjMat[end][start] = 1;
  }

  void displayVertex(int v) {
    stdout.write(vertexList[v].label);
  }

  int getAdjUnvisitedVertex(int v) {
    for(int i = 0; i < nVerts; i++) {
      if(adjMat[v][i] == 1 && vertexList[i].wasVisited == false) {
        return i;
      }
    }
    return -1;
  }
}