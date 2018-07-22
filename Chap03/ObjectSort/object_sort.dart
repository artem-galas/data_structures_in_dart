import 'dart:io';

class Person {
  String firstName;
  String lastName;
  int age;

  // Constructor shorthand
  Person(this.lastName, this.firstName, this.age) {}

  /// Display Person Data
  void displayPerson() {
    stdout.write('Last Name $lastName, ');
    stdout.write('First Name $firstName, ');
    stdout.writeln('Age $age');
  }

  String getLastName() {
    return lastName;
  }
}

class ArrayInObject {
  List<Person> a;
  int nElems;

  ArrayInObject(int max) {
    a = new List<Person>(max);
    nElems = 0;
  }

  /// Insert Data to Array
  void insert(String lastName, String firstName, int age) {
    a[nElems] = new Person(lastName, firstName, age);
    nElems ++; // increment size
  }

  /// Display array contents
  void display() {
    for(int j = 0; j < nElems; j++) {
      a[j].displayPerson();
    }
  }

  /// Insertion Sort array
  void insertionSort() {
    int _in, out;
    for(out = 1; out < nElems; out ++) {
      Person temp = a[out];
      _in = out;
      while(_in > 0 && (a[_in - 1].getLastName().compareTo(temp.getLastName()) > 0)) {
        a[_in] = a[_in - 1];
        _in --;
      }
      a[_in] = temp;
    }
  }
}

void main() {
  int maxSize = 100; // array size
  ArrayInObject array = new ArrayInObject (maxSize); // create instance of ArrayInObject

  // Insert 10 items
  array.insert('Evans', 'Patty', 24);
  array.insert('Smith', 'Lorraine', 37);
  array.insert('Yee', 'Tom', 43);
  array.insert('Adams', 'Henry', 63);
  array.insert('Hashimoto', 'Sato', 21);
  array.insert('Stimson', 'Henry', 29);
  array.insert('Velasquez', 'Jose', 72);
  array.insert('Lamarque', 'Henry', 54);
  array.insert('Vang', 'Minh', 22);
  array.insert('Creswell', 'Lucinda', 18);

  stdout.writeln('Before Sorting');
  array.display();

  array.insertionSort();

  stdout.writeln('After Sorting');
  array.display();
}
