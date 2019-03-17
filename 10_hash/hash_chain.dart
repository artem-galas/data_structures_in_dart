import 'dart:io';
import 'dart:math';

class Link {
  int data;
  Link next;

  Link(int this.data){}

  int getKey() {
    return data;
  }

  void displayLink() {
    stdout.write('$data ');
  }
}

class SortedList {
  Link first;

  SortedList() {
    first = null;
  }

  /// Insert in ordered
  void insert(Link link) {
    int key = link.getKey();
    Link previous = null;
    Link current = first;

    while (current != null && key > current.getKey()) {
      previous = current;
      current = current.next;
    }
    if(previous == null) {
      first = link;
    } else {
      previous.next = link;
    }
    link.next = current;
  }

  /// Remove element
  void delete(int key) {
    Link previous = null;
    Link current = first;

    while (current != null && key != current.getKey()) {
      previous = current;
      current = current.next;
    }

    if (previous == null) {
      first = first.next;
    } else {
      previous.next = current.next;
    }
  }

  Link find(int key) {
    Link current = first;

    while(current != null && current.getKey() <= key) {
      if (current.getKey() == key) {
        return current;
      }
      current = current.next;
    }
    return null;
  }

  void displayList() {
    stdout.write('List (first -> last): ');
    Link current = first;
    while(current != null) {
      current.displayLink();
      current = current.next;
    }
    stdout.writeln();
  }
}

class HashTable {
  List<SortedList> hashArray;
  int arraySize;

  HashTable(int size) {
    arraySize = size;
    hashArray = new List<SortedList>(arraySize);

    for(int i = 0; i < arraySize; i ++) {
      hashArray[i] = new SortedList();
    }
  }

  void displayTable() {
    for(int i = 0; i < arraySize; i ++) {
      stdout.write('$i. ');
      hashArray[i].displayList();
    }
  }

  int hashFunc(int key) {
    return key % arraySize;
  }

  void insert(Link link) {
    int key = link.getKey();
    int hashVal = hashFunc(key);
    hashArray[hashVal].insert(link);
  }

  void delete(int key) {
    int hashVal = hashFunc(key);
    hashArray[hashVal].delete(key);
  }

  Link find(int key) {
    int hashVal = hashFunc(key);
    Link link = hashArray[hashVal].find(key);
    return link;
  }
}

void main() {
  int key;
  Link dataItem;
  int size, n;

  Random random = new Random();

  stdout.write('Enter size of hash table: ');
  size = int.parse(stdin.readLineSync());

  stdout.write('Enter initial number of items: ');
  n = int.parse(stdin.readLineSync());

  HashTable hashTable = new HashTable(size);

  for(int i = 0; i < n; i ++) {
    key = random.nextInt(100);
    dataItem = new Link(key);
    hashTable.insert(dataItem);
  }

  while(true) {
    stdout.writeln('Enter first leter of show, insert, delete, find');
    String choice = stdin.readLineSync();

    switch(choice) {
      case 's':
        hashTable.displayTable();
        break;
      case 'i':
        stdout.write('Enter key value to insert: ');
        key = int.parse(stdin.readLineSync());
        dataItem = new Link(key);
        hashTable.insert(dataItem);
        break;
      case 'd':
        stdout.write('Enter key value to deleete: ');
        key = int.parse(stdin.readLineSync());
        hashTable.delete(key);
        break;
      case 'f':
        stdout.write('Enter key value to deleete: ');
        key = int.parse(stdin.readLineSync());
        dataItem = hashTable.find(key);
        if (dataItem != null) {
          stdout.writeln('Found $key');
        } else {
          stdout.writeln('Could not find $key');
        }
        break;
      default:
        stdout.writeln('Invalid entry');
    }
  }
}
