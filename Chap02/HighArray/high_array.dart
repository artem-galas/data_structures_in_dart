import 'dart:io';

class HighArray {
  List<int> a; // ref to array a
  int nElems; // number of data items

  // Constructor
  HighArray(int max) {
    a = new List(max); // create array (List in Dart)
    nElems = 0; // initialize items count
  }

  // Find specified value
  bool find(int searchKey) {
    int j;
    for(j = 0; j < nElems; j++) // for each element
      if (a[j] == searchKey) // found item?
        break; // exit loop before end
    if (j == nElems) // gone to end?
      return false; // yes, can't find it
    else
      return true; // no, found it
  }

  // Put element into array
  void insert(int value) {
    a[nElems] = value; // insert it
    nElems ++; // increment size
  }

  // Delete element from array
  bool delete(int value) {
    int j;
    for(j = 0; j < nElems; j++) // look for it
      if(value == a[j])
        break;
    if(j == nElems) // can't find it
      return false;
    else { //found it
      for(int k = j; k < nElems; k++)
        a[k] = a[k + 1];
      nElems --;
      return true;
    }
  }

  // Display Array contents
  void display() {
    for(int j = 0; j < nElems; j++) // for each element
      stdout.write('${a[j]} '); // display it
    stdout.writeln(''); // add new line on the end
  }
}


main() {
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
  if(array.find(searchKey))
    stdout.writeln('Foundt $searchKey');
  else
    stdout.writeln("Can't find $searchKey");

  // Delete 3 items
  array.delete(00);
  array.delete(55);
  array.delete(99);

  // Display items again
  array.display();
}
