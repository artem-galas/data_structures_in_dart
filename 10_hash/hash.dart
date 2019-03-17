import 'dart:io';
import 'dart:math';

class DataItem {
  int data;

  DataItem(this.data) {}

  int getKey() {
    return data;
  }
}

class HashTable {
  int arraySize;
  List<DataItem> hashArray;
  DataItem nonItem;

  HashTable(int size) {
    this.arraySize = size;
    hashArray = new List<DataItem>(size);
    nonItem = new DataItem(-1);
  }

  void displayTable() {
    stdout.write('HashTable: ');

    for(int i = 0; i < arraySize; i++) {
      if(hashArray[i] != null) {
        stdout.write('${hashArray[i].getKey()} ');
      } else {
        stdout.write('** ');
      }
    }
    stdout.writeln();
  }

  /// Hash Function
  int hashFunc(int key) {
    return key % arraySize;
  }

  /// Insert a DataItem
  void insert(DataItem item) {
    int key = item.getKey();
    int hashVal = hashFunc(key);

    // until empty cell or -1
    while(hashArray[hashVal] != null && hashArray[hashVal].getKey() != -1) {
      ++ hashVal; // go to next cell
      hashVal %= arraySize;
    }
    // insert item
    hashArray[hashVal] = item;
  }

  /// Delete a DataItem
  DataItem delete(int key) {
    int hashVal = hashFunc(key);

    // until empty cell
    while(hashArray[hashVal] != null) {
      if (hashArray[hashVal].getKey() == key) {
        DataItem temp = hashArray[hashVal];
        hashArray[hashVal] = nonItem;
        return temp;
      }
      ++ hashVal;
      hashVal %= arraySize;
    }
    return null;
  }

  /// Find Element by key
  DataItem find(int key) {
    int hashVal = hashFunc(key);

    // until empty cell
    while (hashArray[hashVal] != null) {
      if (hashArray[hashVal].getKey() == key) {
        return hashArray[hashVal];
      }
      ++ hashVal;
      hashVal %= arraySize;
    }
    return null;
  }
}

void main() {
  DataItem dataItem;
  int key, size, n;

  Random random = new Random();

  // get size
  stdout.write('Enter size of hash table: ');
  size = int.parse(stdin.readLineSync());

  stdout.write('Enter initial number of items: ');
  n = int.parse(stdin.readLineSync());

  // make table
  HashTable hashTable = new HashTable(size);

  // insert data
  for (int i = 0; i < n; i ++) {
    key = random.nextInt(200);
    dataItem = new DataItem(key);
    hashTable.insert(dataItem);
  }

  // interact with user
  while(true) {
    stdout.writeln('Enter first leter of show, insert, delete, find: ');
    String choice = stdin.readLineSync();
    switch (choice) {
      case 's':
        hashTable.displayTable();
        break;
      case 'i':
        stdout.write('Enter key value to insert: ');
        key = int.parse(stdin.readLineSync());
        dataItem = new DataItem(key);
        hashTable.insert(dataItem);
        break;
      case 'd':
        stdout.write('Enter key value to delete: ');
        key = int.parse(stdin.readLineSync());
        hashTable.delete(key);
        break;
      case 'f':
        stdout.write('Enter key value to find: ');
        key = int.parse(stdin.readLineSync());
        dataItem = hashTable.find(key);
        if (dataItem != null) {
          stdout.writeln('Found $key');
        } else {
          stdout.writeln('Could NOT found $key');
        }
        break;
      default:
        stdout.writeln('Invalid command');
    }
  }
}
