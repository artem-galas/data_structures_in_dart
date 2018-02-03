import 'dart:io';

class Link {
  int data;
  Link next;

  Link(this.data) {}

  void displayLink() {
    stdout.write('$data ');
  }
}

class SortedList {
  Link first;

  SortedList() {
    first = null;
  }

  bool isEmpty() {
    return first == null;
  }

  void insert(int key) {
    Link newLink = new Link(key);
    Link previous = null;
    Link current = first;

    while(current != null && key > current.data) {
      previous = current;
      current = current.next;
    }
    if (previous == null) {
      first = newLink;
    } else {
      previous.next = newLink;
    }
    newLink.next = current;
  }

  Link remove() {
    Link temp = first;
    first = first.next;
    return temp;
  }

  void diaplayList() {
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
  SortedList sortedList = new SortedList();

  sortedList.insert(20);
  sortedList.insert(40);

  sortedList.diaplayList();

  sortedList.insert(10);
  sortedList.insert(30);
  sortedList.insert(50);

  sortedList.diaplayList();

  sortedList.remove();

  sortedList.diaplayList();
}
