/// Modify the method from `task_1.dart` so that the item with the highest key is not only returned by the method,
/// but also removed from the array.
/// Call the method `removeMax()`.

import 'dart:io';

import '../high_array.dart';

class HighArrayTask2 extends HighArray {
  HighArrayTask2(int max)
      : super(max);

  /// Remove Max value
  int removeMax() {
    int max = a[0];
    int maxIndex;

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
  int maxSize = 10; // array size
  HighArrayTask2 array = new HighArrayTask2(maxSize);

  // Insert 10 items
  array.insert(77);
  array.insert(44);
  array.insert(55);
  array.insert(22);
  array.insert(88);
  array.insert(11);
  array.insert(00);
  array.insert(66);
  array.insert(99);
  array.insert(33);

  // Display items
  array.display();

  stdout.writeln('Max value is ${array.removeMax()}');

  array.display();
}
