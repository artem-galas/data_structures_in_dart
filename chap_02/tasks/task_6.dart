/// Write a `noDups()` method for the `HighArray` class of the `high_array.dart` program.
/// This method should remove all duplicates from the array.
/// That is, if three items with the key 17 appear in the array, `noDups()` should remove two of them.
/// Don’t worry about maintaining the order of the items.
/// One approach is to first compare every item with all the other items and
/// overwrite any duplicates with a null (or a distinctive value that isn’t used for real keys).
/// Then remove all the nulls. Of course, the array size will be reduced.


import 'dart:io';

import '../high_array.dart';

class HighArrayTask6 extends HighArray {

  HighArrayTask6(int max)
      : super(max);

  @override
  String toString() {
    String string = '';
    for(int j = 0; j < nElems; j++) {
      string += '${a[j]} ';
    }
    return string.trim();
  }

  void noDups() {
    int size = nElems - 1;
    int value = null;

    for(int i = 0; i <= size; i ++) {
      value = a[i];
      for (int j = i + 1; j <= size; j ++) {
        if (a[j] == value) {
          for(int k = j; k < size; k ++) {
            a[k] = a[k + 1];
          }
          nElems --;
          j --;
          size --;
        }
      }
    }
  }
}


void main() {
  int maxArraySize = 10;
  HighArrayTask6 highArrayTask6 = new HighArrayTask6(maxArraySize);

  highArrayTask6.insert(10);
  highArrayTask6.insert(15);
  highArrayTask6.insert(3);
  highArrayTask6.insert(15);
  highArrayTask6.insert(19);
  highArrayTask6.insert(18);
  highArrayTask6.insert(3);
  highArrayTask6.insert(8);
  highArrayTask6.insert(10);
  highArrayTask6.insert(65);

  stdout.write('With Duplicates highArrayTask6 = ');
  highArrayTask6.display();

  stdout.write('Without Duplicates highArrayTask6 = ');
  highArrayTask6.noDups();
  highArrayTask6.display();
}
