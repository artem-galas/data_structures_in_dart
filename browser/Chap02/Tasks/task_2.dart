import 'dart:io';
/**
  Modify the method in Programming Project 2.1
  so that the item with the highest key is not only returned by the method,
  but also removed from the array.
  Call the method removeMax().
 **/

class HighArray {
  List<int> a;
  int nElems;

  // Constructor
  HighArray(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  // Find specified value
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

  /// Put element into array
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

  /// Remove Max value
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

  stdout.writeln('Max value is ${array.removeMax()}');

  array.display();
}
