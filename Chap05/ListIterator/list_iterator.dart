import 'dart:io';

class Link {
  int data;
  Link next;

  Link(this.data){}

  void displayLink() {
    stdout.write('$data ');
  }
}

class LinkList {
  Link first;

  LinkList() {
    first = null;
  }

  Link getFirst() {
    return first;
  }

  void setFirst(Link item) {
    first = item;
  }

  bool isEmpty() {
    return first == null;
  }

  ListIterator getIterator() {
    return new ListIterator(this);
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

class ListIterator {
  Link current;
  Link previous;
  LinkList ourList;

  ListIterator(LinkList list) {
    ourList = list;
    reset();
  }

  void reset() {
    current = ourList.getFirst();
    previous = null;
  }

  bool atEnd() {
    return current.next == null;
  }

  void nextLink() {
    previous = current;
    current = current.next;
  }

  Link getCurrent() {
    return current;
  }

  void insertAfter(int data) {
    Link newLink = new Link(data);
    if (ourList.isEmpty()) {
      ourList.setFirst(newLink);
      current = newLink;
    } else {
      newLink.next = current.next;
      current.next = newLink;
      nextLink();
    }
  }

  void insertBefore(int data) {
    Link newLink = new Link(data);
    if (previous == null) {
      newLink.next = ourList.getFirst();
      ourList.setFirst(newLink);
      reset();
    } else {
      newLink.next = previous.next;
      previous.next = newLink;
      current = newLink;
    }
  }

  int deleteCurrent() {
    int value = current.data;
    if (previous == null) {
      ourList.setFirst(current.next);
      reset();
    } else {
      previous.next = current.next;
      if (atEnd()) {
        reset();
      } else {
        current = current.next;
      }
    }
    return value;
  }
}

void main(List<String> args) {
  LinkList linkList = new LinkList();
  ListIterator iterator1 = linkList.getIterator();
  int value;

  iterator1.insertAfter(20);
  iterator1.insertAfter(40);
  iterator1.insertAfter(80);
  iterator1.insertBefore(60);

  while (true) {
    stdout.writeln('Enter first letter of: show, reset, next before, after, delete');
    String choise = stdin.readLineSync();
    switch(choise) {
      case 's':
        if(!linkList.isEmpty()) {
          linkList.displayList();
        } else {
          stdout.writeln('List is empty');
        }
        break;
      case 'r':
        iterator1.reset();
        break;
      case 'n':
        if (!linkList.isEmpty() && !iterator1.atEnd()) {
          iterator1.nextLink();
        } else {
          stdout.writeln("Can't go to next link");
        }
        break;
      case 'g':
        if (!linkList.isEmpty()) {
          value = iterator1.getCurrent().data;
          stdout.writeln('Retruned $value');
        } else {
          stdout.writeln('List is empty');
        }
        break;
      case 'b':
        stdout.write('Enter value to insert: ');
        String userInput = stdin.readLineSync();
        value = int.parse(userInput);
        iterator1.insertBefore(value);
        break;
      case 'a':
        stdout.write('Enter value to insert: ');
        String userInput = stdin.readLineSync();
        value = int.parse(userInput); 
        iterator1.insertAfter(value);
        break;
      case 'd':
        if (!linkList.isEmpty()) {
          value = iterator1.deleteCurrent();
          stdout.writeln('Deletet $value');
        } else {
          stdout.writeln("Can't delete");
        }
        break;
      default:
        stdout.writeln('Invalud command');  
    }
  }
}
