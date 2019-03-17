import 'dart:io';

import '../03_stack_queue/stack/stack.dart';
import './until/graph.dart';

class GraphMst extends Graph {
  StackX stack;

  GraphMst(): super() {
    stack = new StackX(maxVerts);
  }

  void mst() {
    vertexList[0].wasVisited = true;
    stack.push(0);

    while(!stack.isEmpty()) {
      int currentVertex = stack.peek();
      int v = getAdjUnvisitedVertex(currentVertex);
      if (v == -1) {
        stack.pop();
      } else {
        vertexList[v].wasVisited = true;
        stack.push(v);
        
        displayVertex(currentVertex);
        displayVertex(v);
        stdout.write(' ');
      }
    }
    for(int i = 0; i < nVerts; i ++) {
      vertexList[i].wasVisited = false;
    }
  }
}

void main() {
  GraphMst graph = new GraphMst();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');
  graph.addVertex('E');

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(0, 3);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(2, 4);
  graph.addEdge(3, 4);

  stdout.write('Minimum spanning tree: ');
  graph.mst();
  stdout.writeln();
}
