import 'dart:io';

class Array {
  List<int> array;
  int numberOfElements;

  Array(int max) {
    array = new List<int>(max);
    numberOfElements = 0;
  }

  void insert(int value) {
    array[numberOfElements] = value;
    numberOfElements ++;
  }

  void display() {
    for (int i = 0; i < numberOfElements; i ++) {
      stdout.write('${array[i]} ');
    }
    stdout.writeln();
  }

  void mergeSort() {
    List<int> workSpace = new List<int>(numberOfElements);
    _recursiveMergeSort(workSpace, 0, numberOfElements - 1);
  }

  void _recursiveMergeSort(List<int> workSpace, int lowerBound, int upperBound) {
    if (lowerBound == upperBound) {
      return;
    } else {
      int mid = (lowerBound + upperBound) ~/ 2;
      _recursiveMergeSort(workSpace, lowerBound, mid);
      _recursiveMergeSort(workSpace, mid + 1, upperBound);
      _merge(workSpace, lowerBound, mid + 1, upperBound);
    }
  }

  void _merge(List<int> workSpace, int lowPtr, int highPtr, int upperBound) {
    int i = 0;
    int lowerBound = lowPtr;
    int mid = highPtr - 1;
    int n = upperBound - lowerBound + 1;

    while (lowPtr <= mid && highPtr <= upperBound) {
      if (array[lowPtr] < array[highPtr]) {
        workSpace[i++] = array[lowPtr++];
      } else {
        workSpace[i++] = array[highPtr++];
      }
    }

    while (lowPtr <= mid) {
      workSpace[i++] = array[lowPtr++];
    }
    while (highPtr <= upperBound) {
      workSpace[i++] = array[highPtr++];
    }

    for (i=0; i < n; i ++) {
      array[lowerBound + i] = workSpace[i];
    }
  }
}

void main() {
  int maxSize = 100;
  Array array = new Array(maxSize);
  array.insert(64);
  array.insert(21);
  array.insert(33);
  array.insert(70);
  array.insert(12);
  array.insert(85);
  array.insert(44);
  array.insert(3);
  array.insert(99);
  array.insert(0);
  array.insert(108);
  array.insert(36);

  array.display();

  array.mergeSort();
  array.display();
}
