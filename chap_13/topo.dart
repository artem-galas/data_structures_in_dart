import 'dart:io';

import 'until/graph.dart';

class GraphTopo extends Graph {
  List<String> sortedArray;

  GraphTopo(): super() {
    sortedArray = new List<String>(maxVerts);
  }

  @override
  void addEdge(int start, int end) {
    adjMat[start][end] = 1;
  }

  int noSuccessors() {
    bool isEdge;

    for(int row = 0; row < nVerts; row ++) {
      isEdge = false;
      for(int col = 0; col < nVerts; col ++) {
        if(adjMat[row][col] > 0) {
          isEdge = true;
          break;
        }
      }
      if (!isEdge) {
        return row;
      }
    }
    return -1;
  }

  void topo() {
    int originNumberVerts = nVerts;

    while(nVerts > 0) {
      int currentVertex = noSuccessors();
      if(currentVertex == -1) {
        stdout.write('Error: Graph has cycles');
        return;
      }
      sortedArray[nVerts -1] = vertexList[currentVertex].label;

      deleteVertex(currentVertex);
    }

    stdout.write('Topologically sorted order: ');
    for(int i = 0; i < originNumberVerts; i ++) {
      stdout.write(sortedArray[i]);
    }
    stdout.writeln();
  }

  void deleteVertex(int delVertex) {
    if(delVertex != nVerts - 1) {
      for(int i = delVertex; i < nVerts - 1; i ++) {
        vertexList[i] = vertexList[i + 1];
      }

      for(int row = delVertex; row < nVerts - 1; row ++) {
        moveRowUp(row, nVerts);
      }

      for(int col = delVertex; col < nVerts - 1; col ++) {
        moveColLeft(col, nVerts - 1);
      }
    }
    nVerts -- ;
  }

  void moveRowUp(int row, int length) {
    for(int col = 0; col < length; col ++ ) {
      adjMat[row][col] = adjMat[row + 1][col];
    }
  }

  void moveColLeft(int col, int length) {
    for(int row = 0; row < length; row ++ ) {
      adjMat[row][col] = adjMat[row][col + 1];
    }
  }
}

void main() {
  GraphTopo graphTopo = new GraphTopo();
  graphTopo.addVertex('A'); // 0
  graphTopo.addVertex('B'); // 1
  graphTopo.addVertex('C'); // 2
  graphTopo.addVertex('D'); // 3
  graphTopo.addVertex('E'); // 4
  graphTopo.addVertex('F'); // 5
  graphTopo.addVertex('G'); // 6
  graphTopo.addVertex('H'); // 7

  graphTopo.addEdge(0, 3); // AD
  graphTopo.addEdge(0, 4); // AE
  graphTopo.addEdge(1, 4); // BE
  graphTopo.addEdge(2, 5); // CF
  graphTopo.addEdge(3, 6); // DG
  graphTopo.addEdge(4, 6); // EG
  graphTopo.addEdge(5, 7); // FH
  graphTopo.addEdge(6, 7); // GH
  
  graphTopo.topo();
}
