import 'dart:io';

import '../chap_04/stack/stack.dart';

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
  StackX stack;

  Graph() {
    vertexList = new List<Vertex>(maxVerts);
    adjMat = new List.generate(maxVerts, (int i) => new List(maxVerts));
    nVerts = 0;
    stack = new StackX(maxVerts);
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

  void dfs() {
    vertexList[0].wasVisited = true;
    displayVertex(0);
    stack.push(0);

    while(!stack.isEmpty()) {
      int v = getAdjUnvisitedVertex(stack.peek());
      if (v == -1) {
        stack.pop();
      } else {
        vertexList[v].wasVisited = true;
        displayVertex(v);
        stack.push(v);
      }
    }

    for(int i = 0; i < nVerts; i ++) {
      vertexList[i].wasVisited = false;
    }
  }
}

void main() {
  Graph graph = new Graph();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');
  graph.addVertex('E');

  graph.addEdge(0, 1);
  graph.addEdge(1, 2);
  graph.addEdge(0, 3);
  graph.addEdge(3, 4);

  stdout.write('Visits: ');
  graph.dfs();
  stdout.writeln();
}
