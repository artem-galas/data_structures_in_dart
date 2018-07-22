import 'dart:io';

class OrderedArray {
  List<int> a; // ref to array a
  int nElems; // // number of data items

  // Constructor
  OrderedArray(int max) {
    a = new List<int>(max); // create array (List in Dart)
    nElems = 0; // initialize items count
  }

  int size() {
    return nElems;
  }

  /// Binary search
  int find(int searchKey) {
    int lowerBound = 0;
    int upperBound = nElems - 1;
    int curIn;

    while(true) {
      curIn = (lowerBound + upperBound) ~/ 2;
      if(a[curIn] == searchKey) {
        return curIn; // found It
      } else if (lowerBound > upperBound) {
        return nElems; // can't find it
      } else { // divide range
        if(a[curIn] < searchKey) {
          lowerBound = curIn + 1; // it's in upper half;
        } else {
          upperBound = curIn - 1; // it's in lower half;
        }
      }
    }
  }

  /// Insert element into ordered array
  void insert(int value) {
    int j;
    for(j = 0; j < nElems; j++) { // find where it goes
      if (a[j] > value) { // liner search
        break;
      }
    }
    for(int k = nElems; k > j; k--) { // move bigger ones up
      a[k] = a[k - 1];
    }
    a[j] = value; // insert it
    nElems++; // increment size
  }

  /// Delete element from array
  bool delete(int value) {
    int j = find(value);
    if (j == nElems) { // can't find it
      return false;
    } else { // found it
      for(int k = j; k > j; k++) { // move bigger ones down
        a[k] = a[k + 1];
      }
      nElems--; // decrement size
      return true;
    }
  }

  /// Display array contents
  void display() {
    for(int j = 0; j < nElems; j ++) { // for each element
      stdout.write('${a[j]} '); // display it
    }
    stdout.writeln('');
  }
}

void main() {
  int maxSize = 100; // array size
  OrderedArray array = new OrderedArray(maxSize); // // create instance of OrderedArray

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

  // Search item
  int searchKey = 55;

  if(array.find(searchKey) != array.size()) {
    stdout.writeln('Found $searchKey');
  } else {
    stdout.writeln("Can't find $searchKey");
  }

  // Display items
  array.display();

  // Delete 3 items
  array.delete(00);
  array.delete(55);
  array.delete(99);

  // Display items again
  array.display();
}
