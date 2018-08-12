import 'dart:io';

class Link {
  int data;
  Link next;

  Link(this.data) {}

  void displayLink() {
    stdout.write('$data ');
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
    int temp = first.data;
    if (first.next == null) {
      last = null;
    }
    first = first.next;
    return temp;
  }

  void displayList() {
    Link current = first;
    while (current != null) {
      current.displayLink();
      current = current.next;
    }
    stdout.writeln();
  }
}

class LinkQueue {
  FirstLastList list;

  LinkQueue() {
    list = new FirstLastList();
  }

  bool isEmpty() {
    return list.isEmpty();
  }

  void insert(int item) {
    list.insertLast(item);
  }

  int remove() {
    return list.deleteFirst();
  }

  void displayQueue() {
    stdout.write('Queue (front -> rear): ');
    list.displayList();
  }
}

void main(List<String> args) {
  LinkQueue linkQueue = new LinkQueue();

  linkQueue.insert(20);
  linkQueue.insert(40);

  linkQueue.displayQueue();

  linkQueue.insert(60);
  linkQueue.insert(80);

  linkQueue.displayQueue();

  linkQueue.remove();
  linkQueue.remove();

  linkQueue.displayQueue();
}