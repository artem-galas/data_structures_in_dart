import 'dart:io';
import 'dart:math';

class Node {
  int _data;

  Node(int this._data) {}

  int get data_key => _data;
  set data_key(int id) => _data = id;
}
class Heap {
  List<Node> heapArray;
  int maxSize;
  int currentSize;

  Heap(int this.maxSize) {
    currentSize = 0;
    heapArray = new List<Node>(maxSize);
  }

  bool isEmpty() => currentSize == 0;

  Node remove() {
    Node root = heapArray[0];
    heapArray[0] = heapArray[--currentSize];
    trickleDown(0);
    return root;
  }

  void trickleDown(int index) {
    int largerChild;
    Node top = heapArray[index];
    while(index < currentSize ~/ 2) {
      int leftChild = 2 * index + 1;
      int rightChild = leftChild + 1;

      if(rightChild < currentSize && heapArray[leftChild].data_key < heapArray[rightChild].data_key) {
        largerChild = rightChild;
      } else {
        largerChild = leftChild;
      }

      if(top.data_key >= heapArray[largerChild].data_key) {
        break;
      }

      heapArray[index] = heapArray[largerChild];
      index = largerChild;
    }
    heapArray[index] = top;
  }

  void displayHeap() {
    int nBlanks = 32;
    int itemsPerRow = 1;
    int column = 0;
    int j = 0;
    String dots = '............................';
    stdout.writeln(dots + dots);

    while(currentSize > 0) {
      if (column == 0) {
        for (int k = 0; k < nBlanks; k ++) {
          stdout.write(' ');
        }
      }
      stdout.write(heapArray[j].data_key);

      if(++j == currentSize) {
        break;
      }

      if (++column == itemsPerRow) {
        nBlanks ~/= 2;
        itemsPerRow *= 2;
        column = 0;
        stdout.writeln();
      } else {
        for(int k = 0; k < nBlanks * 2 - 2; k ++) {
          stdout.write(' ');
        }
      }
    }
    stdout.writeln("\n ${dots + dots}");
  }

  void displayArray() {
    for(int i = 0; i < maxSize; i ++) {
      stdout.write('${heapArray[i].data_key} ');
    }
    stdout.writeln();
  }

  void insertAt(int index, Node newNode) {
    heapArray[index] = newNode;
  }

  void incrementSize() {
    currentSize ++;
  }
}

void main() {
  int size, i;
  Random random = new Random();

  stdout.write('Enter number of items: ');
  size = int.parse(stdin.readLineSync());

  Heap heap = new Heap(size);
  for(i = 0; i < size; i ++) {
    Node newNode = new Node(random.nextInt(100));
    heap.insertAt(i, newNode);
    heap.incrementSize();
  }

  stdout.write('Random Array: ');
  heap.displayArray();

  for(i = size ~/ 2 - 1; i >= 0; i --) {
    heap.trickleDown(i);
  }

  stdout.write('Heap: ');
  heap.displayArray();
  heap.displayHeap();

  for(i = size - 1; i >= 0; i --) {
    Node biggestNode = heap.remove();
    heap.insertAt(i, biggestNode);
  }
  
  stdout.write('Sorted: ');
  heap.displayArray();
}
