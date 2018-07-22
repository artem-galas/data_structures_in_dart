import 'dart:io';
import 'dart:collection';

class Node {
  int iData;
  double dData;
  Node leftChild;
  Node rightChild;

  void displayNode() {
    stdout.write('{');
    stdout.write(iData);
    stdout.write(', ');
    stdout.write(dData);
    stdout.write('}');
  }
}

class Tree {
  Node root;

  Tree() {
    root = null;
  }

  Node find(int key) {
    Node current = root;
    while (current.iData != key) {
      if (key < current.iData) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
      if (current == null) {
        return null;
      }
    }
    return current;
  }

  void insert(int key, double dd) {
    Node newNode = new Node();
    newNode.iData = key;
    newNode.dData = dd;
    if (root == null) {
      root = newNode;
    } else {
      Node current = root;
      Node parent;
      while (true) {
        parent = current;
        if (key < current.iData) {
          current = current.leftChild;
          if (current == null) {
            parent.leftChild = newNode;
            return;
          }
        } else {
          current = current.rightChild;
          if (current == null) {
            parent.rightChild = newNode;
            return;
          }
        }
      }
    }
  }

  Node minimum() {
    Node current = root;
    Node last;
    while (current != null) {
      last = current;
      current = current.leftChild;
    }
    return last;
  }

  bool delete(int key) {
    Node current = root;
    Node parent = root;
    bool isLeftChild = true;

    while (current.iData != key) {
      parent = current;
      if (key < current.iData) {
        isLeftChild = true;
        current = current.leftChild;
      } else {
        isLeftChild = false;
        current = current.rightChild;
      }
      if (current == null) {
        return false;
      }
      if (current.leftChild == null && current.rightChild == null) {
        if (current == root) {
          root = null;
        } else if (isLeftChild) {
          parent.leftChild = null;
        } else {
          parent.rightChild = null;
        }
      } else if (current.rightChild == null) {
        if (current == root) {
          root = current.leftChild;
        } else if (isLeftChild) {
          parent.leftChild = current.leftChild;
        } else {
          parent.rightChild = current.leftChild;
        }
      } else if (current.leftChild == null) {
        if (current == root) {
          root = current.rightChild;
        } else if (isLeftChild) {
          parent.leftChild = current.rightChild;
        } else {
          parent.rightChild = current.rightChild;
        }
      } else {
        Node successor = getSuccessor(current);
        if (current == root) {
          root = successor;
        } else if (isLeftChild) {
          parent.leftChild = successor;
        } else {
          parent.rightChild = successor;
          // successor.leftChild = current.leftChild;
        }
      }
    }
    return true;    
  }

  Node getSuccessor(Node delNode) {
    Node successorParent = delNode;
    Node successor = delNode;
    Node current = delNode.rightChild;

    while (current != null) {
      successorParent = successor;
      successor = current;
      current = current.leftChild;
    }
    if (successor != delNode.rightChild) {
      successorParent.leftChild = successor.rightChild;
      successor.rightChild = delNode.rightChild;
    }
    return successor;
  }

  void traverse (int traverseType) {
    switch (traverseType) {
      case 1: 
        stdout.write('Preorder traveral: ');
        preOrder(root);
        break;
      case 2:
        stdout.write('Inorder traveral: ');
        inOrder(root);
        break;
      case 3:
        stdout.write('Postorder traveral: ');
        postOrder(root);
        break;
    }
    stdout.writeln();
  }

  void preOrder(Node localRoot) {
    if (localRoot != null) {
      stdout.write('${localRoot.iData} ');
      preOrder(localRoot.leftChild);
      preOrder(localRoot.rightChild);
    }
  }

  void inOrder(Node localRoot) {
    if (localRoot != null) {
      inOrder(localRoot.leftChild);
      stdout.write('${localRoot.iData} ');
      inOrder(localRoot.rightChild);
    }
  }

  void postOrder(Node localRoot) {
    if (localRoot != null) {
      postOrder(localRoot.leftChild);
      postOrder(localRoot.rightChild);
      stdout.write('${localRoot.iData} ');
    }
  }

  void displayTree() {
    Queue<Node> globalQueue = new Queue<Node>();
    globalQueue.addLast(root);
    int nBlanks = 32;
    bool isRowEmpty = false;
    stdout.writeln(
      "............................................."
    );
    while (isRowEmpty == false) {
      Queue<Node> localQueue = new Queue<Node>();
      isRowEmpty = true;
      for (int i = 0; i < nBlanks; i ++) {
        stdout.write(' ');
      }
      while (globalQueue.isEmpty == false) {
        Node temp = globalQueue.removeLast();
        if (temp != null) {
          stdout.write(temp.iData);
          localQueue.addLast(temp.leftChild);
          localQueue.addLast(temp.rightChild);

          if (temp.leftChild != null || temp.rightChild != null) {
            isRowEmpty = false;
          }
        } else {
          stdout.write('--');
          localQueue.addLast(null);
          localQueue.addLast(null);
        }
        for (int i = 0; i < nBlanks * 2 - 2; i ++) {
          stdout.write(' ');
        }
      }
      stdout.writeln();
      nBlanks = nBlanks ~/ 2;
      while (localQueue.isEmpty == false) {
        globalQueue.addLast(localQueue.removeLast());
      }
    }
    stdout.writeln(
      "............................................."
    );
  }

}

void main(List<String> args) {
  Tree tree = new Tree();

  tree.insert(50, 1.5);
  tree.insert(25, 1.7);
  tree.insert(75, 1.9);
  tree.insert(12, 1.5);
  tree.insert(37, 1.2);
  tree.insert(43, 1.7);
  tree.insert(30, 1.5);
  tree.insert(33, 1.2);
  tree.insert(87, 1.7);
  tree.insert(93, 1.5);
  tree.insert(97, 1.5);

  while(true) {
    stdout.write('Enter first letter of show, insert, find, delete, traverse: ');
    String choise = stdin.readLineSync();

    switch(choise) {
      case 's':
        tree.displayTree();
        break;
      case 'i':
        stdout.write('Enter value to insert: ');
        int value = int.parse(stdin.readLineSync());
        tree.insert(value, value + 0.9);
        break;
      case 'f':
        stdout.write('Enter value to find: ');
        int value = int.parse(stdin.readLineSync());
        Node found = tree.find(value);
        if (found != null) {
          stdout.write('Found: ');
          found.displayNode();
          stdout.writeln();
        } else {
          stdout.write('Value not Found');          
        }
        break;
      case 'd':
        stdout.write('Enter value to delete: ');
        int value = int.parse(stdin.readLineSync());
        bool isDeleted = tree.delete(value);
        if (isDeleted) {
          tree.displayTree();
        } else {
          stdout.write('Value not Found');
        }
        break;
      case 't':
        stdout.write('Please write type of traverse; Pre Order - 1, In Order - 2, Post Order - 3: ');
        int value = int.parse(stdin.readLineSync());        
        tree.traverse(value);
        break;  
    }
  }
}
