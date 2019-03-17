import 'dart:io';

import '../03_stack_queue/queue.dart';
import './until/graph.dart';

class GraphBfs extends Graph {
  Queue queue;

  GraphBfs(): super() {
    queue = new Queue(maxVerts);
  }

  void bfs() {
    vertexList[0].wasVisited = true;
    displayVertex(0);
    queue.insert(0);
    int v2;

    while (!queue.isEmpty()) {
      int v1 = queue.remove();
      while( (v2 = getAdjUnvisitedVertex(v1)) != -1) {
        vertexList[v2].wasVisited = true;
        displayVertex(v2);
        queue.insert(v2);
      }
    }
    for(int i = 0; i < nVerts; i ++) {
      vertexList[i].wasVisited = false;
    }
  }
}


void main() {
  GraphBfs graph = new GraphBfs();
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
  graph.bfs();
  stdout.writeln();
}
