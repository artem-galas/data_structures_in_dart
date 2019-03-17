import 'dart:io';

import '../03_stack_queue/stack/stack.dart';
import './until/graph.dart';

class GraphDfs extends Graph {
  StackX stack;

  GraphDfs(): super() {
    stack = new StackX(maxVerts);
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
  GraphDfs graph = new GraphDfs();
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
