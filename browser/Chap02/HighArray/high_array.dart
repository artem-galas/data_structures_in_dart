class HighArray {
  List<int> a; // ref to array a
  int nElems; // number of data items

  // Constructor
  HighArray(int max) {
    a = new List<int>(max); // create array (List in Dart)
    nElems = 0; // initialize items count
  }

  /// Find specified value
  bool find(int searchKey) {
    int j;
    // for each element
    for(j = 0; j < nElems; j++) {
      // found item?
      if (a[j] == searchKey) {
        break; // exit loop before end
      }
    }
    // is end of array
    if (j == nElems) {
      return false;
    } else {
      return true;
    }
  }

  /// Insert element into array
  void insert(int value) {
    a[nElems] = value; // insert it
    nElems ++; // increment size
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
      for (int k = j; k < nElems; k++) {
        a[k] = a[k + 1];
      }
    }
    nElems --;
    return true;
  }

  /// Display Array contents
  void display() {
    List<int> printedArray = new List<int>();
    for (int j = 0; j < nElems; j++) {
      printedArray.insert(j, a[j]);
    }
    print(printedArray.join(' '));
  }
}

void main() {
  int maxSize = 100; // array size
  HighArray array = new HighArray(maxSize); // create instance of HighArray

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

  // Search Element
  int searchKey = 35;
  if (array.find(searchKey)) {
    print('Found $searchKey');
  } else {
    print("Can't find $searchKey");
  }

  // Delete 3 items
  array.delete(00);
  array.delete(55);
  array.delete(99);

  // Display items again
  array.display();
}
