import 'dart:io';

class Link {
  int data;
  Link next;

  Link(this.data) {}

  void displayLink() {
    stdout.write('$data ');
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

	void insertFirst(int data) {
		Link newLink = new Link(data);
		newLink.next = first;
		first = newLink;
	}

	int deleteFirst() {
		Link temp = first;
		first = first.next;
		return temp.data;
	}

	void displayList() {
		Link current = first;
		while(current != null) {
			current.displayLink();
			current = current.next;
		}
		stdout.writeln();
	}
}

class LinkStack {
	LinkList list;

	LinkStack() {
		list = new LinkList();
	}

	void push(int item) {
		list.insertFirst(item);
	}

	int pop() {
		return list.deleteFirst();
	}

	void displayStack() {
		stdout.write('Stack (top -> bottom): ');
		list.displayList();
	}
}

void main(List<String> args) {
	LinkStack linkStack = new LinkStack();

	linkStack.push(20);
	linkStack.push(40);

	linkStack.displayStack();

	linkStack.push(60);
	linkStack.push(80);

	linkStack.displayStack();

	linkStack.pop();
	linkStack.pop();

	linkStack.displayStack();
}