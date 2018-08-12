import 'dart:io';

class Link {
  int intData;
  Link next;

  Link(this.intData) {}

  void displayLink() {
    stdout.write('$intData ');
  }
}

class FirstLastList {
  Link first;
  Link last;

  FirstLastList() {
    first = null;
    last = null;
  }

  bool isEmpty() {
    return first == null;
  }

  void insertFirst(int item) {
    Link newLink = new Link(item);
    if (isEmpty()) {
      last = newLink;
    }
    newLink.next = first;
    first = newLink;
  }

  void insertLast(int item) {
    Link newLink = new Link(item);
    if (isEmpty()) {
      first = newLink;
    } else {
      last.next = newLink;
    }
    last = newLink;
  }

  int deleteFirst() {
    int temp = first.intData;
    if (first.next == null) {
      last = null;
    }
    first = first.next;
    return temp;
  }

  void displayList() {
    stdout.write('List (first -> last): ');
    Link current = first;
    while (current != null) {
      current.displayLink();
      current = current.next;
    }
    stdout.writeln();
  }
}

void main(List<String> args) {
  FirstLastList firstLastList = new FirstLastList();

  firstLastList.insertFirst(22);
  firstLastList.insertFirst(44);
  firstLastList.insertFirst(66);

  firstLastList.insertLast(11);
  firstLastList.insertLast(33);
  firstLastList.insertLast(55);

  firstLastList.displayList();

  firstLastList.deleteFirst();
  firstLastList.deleteFirst();

  firstLastList.displayList();
}
