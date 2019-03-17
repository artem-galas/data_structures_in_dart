import 'dart:io';

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

  bool insert(int key) {
    if(currentSize == maxSize) {
      return false;
    }
    Node newNode = new Node(key);
    heapArray[currentSize] = newNode;
    trickleUp(currentSize ++);
    return true;
  }

  void trickleUp(int index) {
    int parent = (index - 1 ) ~/ 2;
    Node bottom = heapArray[index];

    while(index > 0 && heapArray[parent].data_key < bottom.data_key) {
      heapArray[index] = heapArray[parent];
      index = parent;
      parent = (parent - 1) ~/ 2;
    }
    heapArray[index] = bottom;
  }

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

  bool change(int index, int newValue) {
    if(index < 0 || index >= currentSize) {
      return false;
    }

    int oldValue = heapArray[index].data_key;
    heapArray[index].data_key = newValue;

    if(oldValue < newValue) {
      trickleUp(index);
    } else {
      trickleDown(index);
    }
    return true;
  }

  void displayHeap() {
    stdout.write('Heap Array: ');
    for(int i = 0; i < currentSize; i ++) {
      if (heapArray[i] != null) {
        stdout.write('${heapArray[i].data_key} ');
      } else {
        stdout.write('--');
      }
    }
    stdout.writeln();

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
}

void main() {
  int value, value2;
  Heap heap = new Heap(31);
  bool success;

  heap.insert(70);
  heap.insert(40);
  heap.insert(50);
  heap.insert(20);
  heap.insert(60);
  heap.insert(100);
  heap.insert(80);
  heap.insert(30);
  heap.insert(10);
  heap.insert(90);

  while(true) {
    stdout.writeln('Enter first letter of show, insert, remove, change: ');

    String choice = stdin.readLineSync();

    switch(choice) {
      case 's':
        heap.displayHeap();
        break;
      case 'i':
        stdout.write('Enter value to insert: ');
        value = int.parse(stdin.readLineSync());
        success = heap.insert(value);

        if(!success) {
          stdout.writeln("Can't insert; heap full");
        }
        break;
      case 'r':
        if(!heap.isEmpty()) {
          heap.remove();
        } else {
          stdout.writeln("Can't remove; heap is empty");
        }
        break;
      case 'c':
        stdout.write('Enter current index of item: ');
        value = int.parse(stdin.readLineSync());
        stdout.write('Enter new key: ');
        value2 = int.parse(stdin.readLineSync());
        success = heap.change(value, value2);

        if(!success) {
          stdout.writeln('Invalid index');
        }
        break;
      default:
        stdout.writeln('Invalid entry \n');
    }
  }
}
