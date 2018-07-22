import 'dart:io';

class LowArray {
  List<int> a; // ref to array a

  // Constructor
  LowArray(int size) {
    a = new List<int>(size); // create array (List in Dart)
  }

  // set value
  void setElement(int index, int value) {
    a[index] = value;
  }

  // get value
  int getElement(int index) {
    return a[index];
  }
}

void main(List<String> arguments) {
  LowArray array = new LowArray(100); // create LowArray instance
  int nElement = 0; // number of items in array
  int j; // loop variable

  // Insert 10 items
  array.setElement(0, 77);
  array.setElement(1, 99);
  array.setElement(2, 44);
  array.setElement(3, 55);
  array.setElement(4, 22);
  array.setElement(5, 88);
  array.setElement(6, 11);
  array.setElement(7, 00);
  array.setElement(8, 66);
  array.setElement(9, 33);

  // update number of items in array
  nElement = 10;

  // Display items
  for(j = 0; j < nElement; j++) {
    stdout.write('${array.getElement(j)} ');
  }
  stdout.writeln('');

  // Element Search
  int searchKey = 26;

  // for each element
  for(j = 0; j < nElement; j++) {
    // found item?
    if (array.getElement(j) == searchKey) {
      break;
    }
  }

  if(j == nElement) {
    stdout.writeln("Can't find $searchKey");
  } else {
    stdout.writeln('Found $searchKey');
  }

  // Delete Element with key 55
  for(j = 0; j < nElement; j++) {
    if (array.getElement(j) == 55) {
      break;
    }
  }
  // Higher ones down
  for(int k = j; k < nElement; k++) {
    array.setElement(k, array.getElement(k + 1));
  }
  nElement --; // decrement size


  // Display items
  for(int j = 0; j < nElement; j++) {
    stdout.write('${array.getElement(j)} ');
  }
  stdout.writeln('');

}
