import 'dart:io';

class Link {
  int intData;
  double doubleData;
  Link next;

  Link(int id, double dd) {
    intData = id;
    doubleData = dd;
    next = null;
  }

  void displayLink() {
    stdout.write('{ $intData, $doubleData } ');
  }
}

class LinkList {
  Link first;

  LinkList() {
    first = null;
  }

  bool isEmpty() {
    return first == null;
  }

  void insertFirst(int id, double dd) {
    Link newLink = new Link(id, dd);
    newLink.next = first;
    first = newLink;
  }

  Link find(int key) {
    Link current = first;
    while (current.intData != key) {
      if (current.next == null) {
        return null;
      } else {
        current = current.next;
      }
    }
    return current;
  }

  Link delete(int key) {
    Link current = first;
    Link prevous = first;

    while (current.intData != key) {
      if (current.next == null) {
        return null;
      } else {
        prevous = current;
        current = current.next;
      }
    }
    if (current == first) {
      first = first.next;
    } else {
      prevous.next = current.next;
    }
    return current;
  }

  Link deleteFirst() {
    Link temp = first;
    first = first.next;
    return temp;
  }

  void displayList() {
    stdout.write('List frist -> last ');
    Link curent = first;
    while (curent != null) {
      curent.displayLink();
      curent = curent.next;
    }
    stdout.writeln();
  }
}

void main() {
  LinkList linkList = new LinkList();
  linkList.insertFirst(22, 2.99);
  linkList.insertFirst(44, 4.99);
  linkList.insertFirst(66, 6.99);
  linkList.insertFirst(88, 8.99);

  linkList.displayList();

  Link findElement = linkList.find(44);
  if (findElement != null) {
    stdout.writeln('Found link with key ${findElement.intData}');
  } else {
    stdout.writeln("Can't find link");
  }

  Link deletetElement = linkList.delete(66);
  if (deletetElement != null) {
    stdout.writeln('Delete link with key ${deletetElement.intData}');
  } else {
    stdout.writeln("Can't delete link");
  }

  linkList.displayList();
}
