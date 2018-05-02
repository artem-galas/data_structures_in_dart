class LowArray {
  List<int> a; // ref to array a

  // Constructor
  LowArray(int size) {
    a = new List(size); // create array (List in Dart)
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
  List<int> printedArray = new List<int>();
  for(j = 0; j < nElement; j++) {
    printedArray.insert(j, array.getElement(j));
  }
  print(printedArray.join(' '));

  // Element Search
  int searchKey = 26;

  for(j = 0; j < nElement; j++) { // for each element
    if (array.getElement(j) == searchKey) { // found item?
      break;
    }
  }

  if(j == nElement) { // not found
    print("Can't find $searchKey");
  } else { // yes found
    print('Found $searchKey');
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
  List<int> printedArray2 = new List<int>();
  for(int j = 0; j < nElement; j++) {
    printedArray2.insert(j, array.getElement(j));
  }
  print(printedArray2.join(' '));
}
