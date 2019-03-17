import 'dart:io';

class Vertex {
  String label;
  bool isInTree;

  Vertex(this.label) {
    isInTree = false;
  }
}

class DistPar {
  int distance;
  int parentVert;

  DistPar(this.parentVert, this.distance);
}

class GraphPath {
  final int maxVerts = 20;
  final int INFINITY = 1000000;
  List<Vertex> vertexList;
  List<List<int>> adjMat;
  int nVerts;
  int nTree;
  int currentVert;
  List<DistPar> sPath;
  int startToCurrent;

  GraphPath() {
    nTree = 0;
    currentVert = 0;
    startToCurrent = 0;
    nVerts = 0;
    vertexList = new List<Vertex>(maxVerts);
    adjMat = new List.generate(maxVerts, (int i) => new List(maxVerts));
    for(int i = 0; i < maxVerts; i ++) {
      for(int j = 0; j < maxVerts; j ++) {
        adjMat[i][j] = INFINITY;
      }
    }

    sPath = new List<DistPar>(maxVerts);
  }

  void addVertex(String label) {
    vertexList[nVerts++] = new Vertex(label);
  }

  void addEdge(int start, int end, int weight) {
    adjMat[start][end] = weight;
  }

  void path() {
    int startTree = 0;
    vertexList[startTree].isInTree = true;
    nTree = 1;

    for(int i = 0; i < nVerts; i ++) {
      int tempDist = adjMat[startTree][i];
      sPath[i] = new DistPar(startTree, tempDist);
    }

    while(nTree < nVerts) {
      int indexMin = getMin();
      int minDist = sPath[indexMin].distance;

      if(minDist == INFINITY) {
        stdout.writeln('There are unreachable verices');
        break;
      } else {
        currentVert = indexMin;
        startToCurrent = sPath[indexMin].distance;
      }

      vertexList[currentVert].isInTree = true;
      nTree ++;
      adjust_sPath();
    }

    displayPath();

    nTree = 0;

    for(int i = 0; i < nVerts; i ++) {
      vertexList[i].isInTree = false;
    }
  }

  int getMin() {
    int minDist = INFINITY;
    int indexMin = 0;
    for(int i = 1; i < nVerts; i ++) {
      if(!vertexList[i].isInTree && sPath[i].distance < minDist) {
        minDist = sPath[i].distance;
        indexMin = i;
      }
    }

    return indexMin;
  }

  void adjust_sPath() {
    int column = 1;
    while(column < nVerts) {
      if(vertexList[column].isInTree) {
        column ++;

        continue;
      }

      int currentToFringe = adjMat[currentVert][column];
      int startToFringe = startToCurrent + currentToFringe;
      int sPathDist = sPath[column].distance;

      if(startToFringe < sPathDist) {
        sPath[column].parentVert = currentVert;
        sPath[column].distance = startToFringe;
      }

      column ++;
    }
  }

  void displayPath() {
    for(int i = 0; i < nVerts; i ++) {
      stdout.write('${vertexList[i].label} = ');

      if(sPath[i].distance == INFINITY) {
        stdout.write('inf');
      } else {
        stdout.write(sPath[i].distance);
      }

      String parent = vertexList[sPath[i].parentVert].label;
      stdout.write('($parent) ');
    }

    stdout.writeln();
  }
}


void main() {
  GraphPath graphPath = new GraphPath();

  graphPath.addVertex('A'); // 0
  graphPath.addVertex('B'); // 1
  graphPath.addVertex('C'); // 2
  graphPath.addVertex('D'); // 3
  graphPath.addVertex('E'); // 4

  graphPath.addEdge(0, 1, 50); // AB 50
  graphPath.addEdge(0, 3, 80); // AD 80
  graphPath.addEdge(1, 2, 60); // BC 60
  graphPath.addEdge(1, 3, 90); // BD 90
  graphPath.addEdge(2, 4, 40); // CE 40
  graphPath.addEdge(3, 2, 20); // DC 20
  graphPath.addEdge(3, 4, 70); // DE 70
  graphPath.addEdge(4, 1, 50); // EB 50

  stdout.writeln('Shortest Path: ');
  graphPath.path();
  stdout.writeln();
}
