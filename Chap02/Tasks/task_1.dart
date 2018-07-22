import 'dart:io';
/**
  To the HighArray class in the high_array.dart program (Listing 2.3),
  add a method called getMax() that returns the value of the highest key in the array, or –1
  if the array is empty.
  Add some code in main() to exercise this method.
  You can assume all the keys are positive numbers.
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
    }
    else {
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

  /// Find Max value
  int getMax() {
    if (nElems == 0) {
      return -1;
    }
    int max = a[0];
    for(int j = 0; j < nElems; j++) {
      if(a[j] > max) {
        max = a[j];
      }
    }
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
  stdout.writeln('Max value is ${array.getMax()}');

}
