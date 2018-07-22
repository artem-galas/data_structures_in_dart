/**
 * Modify the orderedArray.java program (Listing 2.4) so that the insert() and delete()
 * routines, as well as find(), use a binary search, as suggested in the text.
 */

import 'dart:io';

class OrderedArray {
  List<int> a;
  int nElems;

  // Constructor
  OrderedArray(int max) {
    a = new List<int>(max);
    nElems = 0;
  }

  int size() {
    return nElems;
  }

  // Binary search
  int find(int searchKey) {
    int lowerBound = 0;
    int upperBound = nElems - 1;
    int curIn;

    while(true) {
      curIn = (lowerBound + upperBound) ~/ 2;
      if(a[curIn] == searchKey) {
        return curIn;
      } else if (lowerBound > upperBound) {
        return nElems; // can't find it
      } else {
        if(a[curIn] < searchKey) {
          lowerBound = curIn + 1;
        } else {
          upperBound = curIn - 1;
        }
      }
    }
  }

  // Put element into ordered array
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

  // Display array contents
  void display() {
    for(int j = 0; j < nElems; j ++) {
      stdout.write('${a[j]} ');
    }
    stdout.writeln('');
  }
}

void main() {
  int maxSize = 100;
  OrderedArray array = new OrderedArray(maxSize);

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
