/// Modify the `ordered_array.dart` so that the insert() and delete()
/// routines, as well as find(), use a binary search, as suggested in the text.

import 'dart:io';

import '../ordered_array.dart';

class OrderedArrayTask4 extends OrderedArray {
  List<int> a;
  int nElems;

  // Constructor
  OrderedArrayTask4(int max)
      : super(max);

  /// Put element into ordered array using Binary Search
  @override
  void insert(int value) {
    int lowerBound = 0;
    int upperBound = nElems - 1;
    int j = 0;

    while(true) {
      if(lowerBound > upperBound) break;
      j = (lowerBound + upperBound) ~/ 2;
      if(a[j] < value) {
        lowerBound = j + 1;
        j ++;
      } else {
        upperBound = j -1;
      }
    }

    for(int k = nElems; k > j; k--) {
      a[k] = a[k - 1];
    }
    a[j] = value;
    nElems++;
  }

  /// Delete Element from array
  @override
  bool delete(int value) {
    int j = find(value);
    if (j == nElems) {
      return false;
    }
    else {
      for(int k = j; k > j; k++) {
        a[k] = a[k + 1];
      }
      nElems--;
      return true;
    }
  }
}

void main() {
  int maxSize = 100;
  OrderedArrayTask4 array = new OrderedArrayTask4(maxSize);

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
}
