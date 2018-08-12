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

  Link deleteFirst() {
    Link temp = first;
    first = first.next;
    return temp;
  }

  void displayList() {
    stdout.write('List frist -> last ');
    Link curent = first;
    while(curent != null) {
      curent.displayLink();
      curent = curent.next;
    }
    stdout.writeln();
  }
}

void main() {
  LinkList linkList = new LinkList();  // Создание нового списка
  linkList.insertFirst(22, 2.99);
  linkList.insertFirst(44, 4.99);
  linkList.insertFirst(66, 6.99);
  linkList.insertFirst(88, 8.99);

  linkList.displayList();

  while(!linkList.isEmpty()) {
    Link tempLink = linkList.deleteFirst();
    stdout.write('Deleted');
    tempLink.displayLink();
    stdout.writeln();
  }
  linkList.displayList();
}
