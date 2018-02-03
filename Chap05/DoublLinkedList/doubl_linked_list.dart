import 'dart:io';

class Link {
  int data;
  Link next;
  Link previous;

  Link(this.data){}

  void displayLink() {
    stdout.write('$data ');
  }
}

class DoublLinkedList {
  Link first;
  Link last;

  DoublLinkedList() {
    first = null;
    last = null;
  }

  bool isEmpty() {
    return first == null;
  }

  void insertFirst(int data) {
    Link newLink = new Link(data);
    if (isEmpty()) {
      last = newLink;
    } else {
      first.previous = newLink;
    }
    newLink.next = first;
    first = newLink;
  }

  void insertLast(int data) {
    Link newLink = new Link(data);
    if (isEmpty()) {
      first = newLink;
    } else {
      last.next = newLink;
      newLink.previous = last;
    }
    last = newLink;
  }

  Link deleteFirst() {
    Link temp = first;
    if (first.next == null) {
      last = null;
    } else {
      first.next.previous = null;
    }
    first = first.next;
    return temp;
  }

  Link deleteLast() {
    Link temp = last;
    if (first.next == null) {
      first = null;
    } else {
      last.previous.next = null;
    }
    last = last.previous;
    return temp;    
  }

  bool insertAfter(int key, int data) {
    Link current = first;
    while (current.data != key) {
      current = current.next;
      if (current == null) {
        return false;
      }
    }
    Link newLink = new Link(data);
    if (current == last) {
      newLink.next = null;
      last = newLink;
    } else {
      newLink.next = current.next;
      current.next.previous = newLink;
    }
    newLink.previous = current;
    current.next = newLink;
    return true;
  }

  Link deleteKey(int key) {
    Link current = first;
    while(current.data != key) {
      current = current.next;
      if (current == null) {
        return null;
      }
    }
    if (current == first) {
      first = current.next;
    } else {
      current.previous.next = current.next;
    }

    if (current == last) {
      last = current.previous;
    } else {
      current.next.previous = current.previous;
    }
    return current;
  }

  void displayForward() {
    stdout.write('List (first -> last): ');
    Link current = first;
    while (current != null) {
      current.displayLink();
      current = current.next;
    }
    stdout.writeln();
  }

  void displayBackward() {
    stdout.write('List (last -> first): ');
    Link current = last;
    while (current != null) {
      current.displayLink();
      current = current.previous;
    }
    stdout.writeln();
  }
}

void main(List<String> args) {
  DoublLinkedList doublLinkedList = new DoublLinkedList();
  doublLinkedList.insertFirst(22);
  doublLinkedList.insertFirst(44);
  doublLinkedList.insertFirst(66);
  
  doublLinkedList.insertLast(11);
  doublLinkedList.insertLast(33);
  doublLinkedList.insertLast(55);

  doublLinkedList.displayForward();
  doublLinkedList.displayBackward();

  doublLinkedList.deleteFirst();
  doublLinkedList.deleteLast();
  doublLinkedList.deleteKey(11);

  doublLinkedList.displayForward();

  doublLinkedList.insertAfter(22, 77); 
  doublLinkedList.insertAfter(33, 88);

  doublLinkedList.displayForward();
}
