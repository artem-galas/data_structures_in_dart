import 'dart:io';
/**
  The removeMax() method in Programming Project 2.2 suggests a way to sort the contents of an array by key value.
  Implement a sorting scheme that does not require modifying the HighArray class,
  but only the code in main().
  You’ll need a second array, which will end up inversely sorted.
  (This scheme is a rather crude variant of the selection sort in Chapter 3, “Simple Sorting.”)
 **/

class HighArray {
  List<int> a;
  int nElems;

  // Constructor
  HighArray(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  /// Find specified value
  bool find(int searchKey) {
    int j;
    for(j = 0; j < nElems; j++) {
      if (a[j] == searchKey) {
        break;
      }
    }
    if (j == nElems) {
      return false;
    } else {
      return true;
    }
  }

  /// Insert element into array
  void insert(int value) {
    a[nElems] = value;
    nElems ++;
  }

  /// Delete element from array
  bool delete(int value) {
    int j;
    for(j = 0; j < nElems; j++) {
      if (value == a[j]) {
        break;
      }
    }

    if(j == nElems) {
      return false;
    } else {
      for(int k = j; k < nElems; k++) {
        a[k] = a[k + 1];
      }
      nElems --;
      return true;
    }
  }

  /// Display Array contents
  void display() {
    for(int j = 0; j < nElems; j++) {
      stdout.write('${a[j]} ');
    }
    stdout.writeln('');
  }

  int removeMax() {
    int j;
    int max = a[0];
    for(j = 0; j < nElems; j++) {
      if(a[j] > max) {
        max = a[j];
        break;
      }
    }
    delete(max);
    return max;
  }
}


void main() {
  int maxSize = 100; // array size
  HighArray array = new HighArray(maxSize);

  // Insert 10 items
  array.insert(77);
  array.insert(99);
  array.insert(44);
  array.insert(55);
  array.insert(22);
  array.insert(88);
  array.insert(11);
  array.insert(00);
  array.insert(66);
  array.insert(33);

  // Display items
  array.display();

  int length = array.nElems;
  HighArray b = new HighArray(maxSize);
  for(int i = 0; i < length; i++) {
    int item = array.removeMax();
    b.insert(item);
  }

  b.display();
}
