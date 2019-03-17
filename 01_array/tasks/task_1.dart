/// To the HighArray class in the `high_array.dart` program
/// add a method called `getMax()` that returns the value of the highest key in the array, or –1 if the array is empty.
/// You can assume all the keys are positive numbers.

import 'dart:io';

import '../high_array.dart';

class HighArrayTask1 extends HighArray {

  /// Inheritance tha super class
  HighArrayTask1(int max)
      : super(max);

  /// Find Max value
  int getMax() {
    if (nElems == 0) {
      return -1;
    }
    int max = a[0];
    for(int i = 0; i < nElems; i++) {
      if(a[i] > max) {
        max = a[i];
      }
    }
    return max;
  }
}


void main() {
  int maxSize = 10; // array size
  HighArrayTask1 array = new HighArrayTask1(maxSize);

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
