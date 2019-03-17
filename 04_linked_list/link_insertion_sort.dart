import 'dart:io';
import 'dart:math';

class Link {
  int data;
  Link next;

  Link(this.data){}
}

class SortedList {
  Link first;

  SortedList() {
    first = null;
  }

  SortedList.fromArray(List<Link> linkArray) {
    first = null;
    for(int i = 0; i < linkArray.length; i++) {
      insert(linkArray[i]);
    }
  }

  void insert(Link item) {
    Link previous = null;
    Link current = first;

    while(current != null && item.data > current.data) {
      previous = current;
      current = current.next;
    }
    if (previous == null) {
      first = item;
    } else {
      previous.next = item;
    }
    item.next = current;
  }

  Link remove() {
    Link temp = first;
    first = first.next;
    return temp;
  }
}

void displayArray(List<Link> array) {
  for(int i = 0; i < array.length; i ++) {
    stdout.write('${array[i].data} ');
  }
  stdout.writeln();
}

void main(List<String> args) {
  int size = 10;
  Random random = new Random();
  List<Link> linkArray = new List<Link>(size);

  for(int i = 0; i < linkArray.length; i ++) {
    int n = random.nextInt(100);
    Link newLink = new Link(n);
    linkArray[i] = newLink;
  }

  stdout.write('Unsorted Array: ');
  displayArray(linkArray);

  SortedList sortedList = new SortedList.fromArray(linkArray);
  for (int i = 0; i < size; i++) {
    linkArray[i] = sortedList.remove();
  }

  stdout.write('Sorted Array: ');
  displayArray(linkArray);
}