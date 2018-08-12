/// The removeMax() method in `task_2.dart` suggests a way to sort the contents of an array by key value.
/// Implement a sorting scheme that does not require modifying the HighArray class, but only the code in main().
/// You’ll need a second array, which will end up inversely sorted.
/// (This scheme is a rather crude variant of the selection sort in Chap03, 'Simple Sorting.)

import 'dart:io';

import '../high_array.dart';

class HighArrayTask3 extends HighArray {

  HighArrayTask3(int max): super(max);

  /// Remove Max value
  int removeMax() {
    int max = a[0];
    int maxIndex = 0;

    for(int i = 0; i < nElems; i++) {
      if(a[i] > max) {
        max = a[i];
        maxIndex = i;
      }
    }

    for(int k = maxIndex; k < nElems - 1; k ++) {
      a[k] = a[k + 1];
    }
    nElems --;

    return max;
  }
}


void main() {
  int maxSize = 11; // array size
  HighArrayTask3 array = new HighArrayTask3(maxSize);

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
  HighArray orderedArray = new HighArray(maxSize);
  for(int i = 0; i < length; i++) {
    int item = array.removeMax();
    orderedArray.insert(item);
  }

  orderedArray.display();
}
