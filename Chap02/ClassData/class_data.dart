import 'dart:io';

class Person {
  String firstName;
  String lastName;
  int age;

  // Constructor shorthand
  Person(this.lastName, this.firstName, this.age) {}

  void displayPerson() {
    stdout.write('Last Name $lastName, ');
    stdout.write('First Name $firstName, ');
    stdout.writeln('Age $age');
  }

  String getLastName() {
    return lastName;
  }
}

class DataArray {
  List<Person> a; // reference to array
  int nElems; // number of data items

  // Constructor
  DataArray(int max) {
    a = new List<Person>(max); // create array (List in Dart)
    nElems = 0; // initialize items count
  }

  /// Find specified value (Liner search)
  Person find(String searchName) {
    int j;
    // for each element
    for(j = 0; j < nElems; j++) {
      if(a[j].getLastName() == searchName) {
        break; // exit loop before end
      }
    }
    if(j == nElems) {
      return null; // can't find it
    } else {
      return a[j]; // found it
    }
  }

  /// Insert Data to Array
  void insert(String lastName, String firstName, int age) {
    a[nElems] = new Person(lastName, firstName, age);
    nElems ++; // increment size
  }

  /// Delete person from array
  bool delete(String searchName) {
    int j;
    for(j = 0; j < nElems; j++) {
      if (a[j].getLastName() == searchName) {
        break;
      }
    }
    if (j == nElems) {
      return false;
    } else {
      // shift down
      for (int k = j; k < nElems; k ++) {
        a[k] = a[k + 1];
      }
    }
    nElems --; // decrement size
    return true;
  }

  /// Display array contents
  void display() {
    for(int j = 0; j < nElems; j++) {
      a[j].displayPerson();
    }
  }
}

void main() {
  int maxSize = 100; // array size
  DataArray array = new DataArray(maxSize); // create instance of DataArray

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

  // Display items
  array.display();

  // Search item
  String searchKey = 'Stimson';
  Person found = array.find(searchKey);

  if (found != null) {
    stdout.write('Found');
    found.displayPerson();
  } else {
    stdout.writeln("Can't find Person with key = $searchKey");
  }

  // Delete 3 items
  stdout.writeln('Deleting Smith, Yee, and Creswell');
  array.delete('Smith');
  array.delete('Yee');
  array.delete('Creswell');

  // Display
  array.display();
}
