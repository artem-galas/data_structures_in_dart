import 'dart:io';

/// DataItem class represented a data in Tree
class DataItem {
  int data;

  DataItem(this.data) {}

  void displayItem() {
    stdout.write('/$data');
  }
}

class Node {
  static final int ORDER = 4;
  int numItems = 0;
  Node parent;
  List<Node> childArray = new List<Node>(ORDER);
  List<DataItem> itemArray = new List<DataItem>(ORDER - 1);

  /// Connect Child to Parent
  void connectChild(int childNum, Node child) {
    childArray[childNum] = child;
    if (child != null) {
      child.parent = this;
    }
  }

  /// Disconnect Child from Node and return it
  Node disconnectChild(int childNum) {
    Node temp = childArray[childNum];
    childArray[childNum] = null;

    return temp;
  }

  Node getChild(int childNum) {
    return childArray[childNum];
  }

  Node getParent() {
    return parent;
  }

  bool isLeaf() {
    return (childArray[0] == null);
  }

  int getNumItems() {
    return numItems;
  }

  /// Get DataItem by index
  DataItem getItem(int index) {
    return itemArray[index];
  }

  bool isFull() {
    return (numItems == ORDER - 1);
  }

  /// Find Element index in NODE or return -1
  int findItem(int key) {
    for(int i = 0; i < ORDER - 1; i ++) {
      if(itemArray[i] == null) {
        break;
      } else if (itemArray[i].data == key ) {
        return i;
      }
    }
    return -1;
  }

  /// Insert new Item to Node
  ///
  /// Return new element index
  int insertItem(DataItem newItem) {
    numItems ++;
    int newKey = newItem.data;

    for(int i = ORDER - 2; i >= 0; i --) {
      if (itemArray[i] == null) {
        continue;
      } else {
        int itsKey = itemArray[i].data;
        if(newKey < itsKey) {
          itemArray[i + 1] = itemArray[i];
        } else {
          itemArray[i + 1] = newItem;
          return i + 1;
        }
      }
    }
    itemArray[0] = newItem;
    return 0;
  }

  /// Delete max item
  DataItem removeItem() {
    DataItem temp = itemArray[numItems - 1];
    itemArray[numItems - 1] = null;
    numItems --;
    return temp;
  }

  void displayNode() {
    for(int i = 0; i < numItems; i ++) {
      itemArray[i].displayItem();
    }
    stdout.writeln();
  }
}

class Tree234 {
  Node root = new Node();

  int find(int key) {
    Node curNode = root;
    int childNumber = curNode.findItem(key);

    while(true) {
      if (childNumber != -1) {
        return childNumber;
      } else if (curNode.isLeaf()) {
        return -1;
      } else {
        curNode = getNextChild(curNode, key);
      }
    }
  }

  /// Insert data element
  void insert(int data) {
    Node curNode = root;
    DataItem temItem = new DataItem(data);

    while(true) {
      if(curNode.isFull()) {
        split(curNode);
        curNode = curNode.getParent();

        curNode = getNextChild(curNode, data);
      } else if (curNode.isLeaf()) {
        break;
      } else {
        curNode = getNextChild(curNode, data);
      }
    }
    curNode.insertItem(temItem);
  }

  /// Split Node
  void split(Node thisNode) {
    DataItem itemB, itemC;
    Node parent, child2, child3;
    int itemIndex;

    itemC = thisNode.removeItem();
    itemB = thisNode.removeItem();
    child2 = thisNode.disconnectChild(2);
    child3 = thisNode.disconnectChild(3);
    Node newRight = new Node();

    /// If Node is Root -> create a new Root
    if(thisNode == root) {
      root = new Node();
      parent = root;
      root.connectChild(0, thisNode);
    } else {
      parent = thisNode.getParent();
    }

    itemIndex = parent.insertItem(itemB);
    int n = parent.getNumItems();

    for(int i = n - 1; i > itemIndex; i --) {
      Node temp = parent.disconnectChild(i);
      parent.connectChild(i + 1, temp);
    }
    
    parent.connectChild(itemIndex + 1, newRight);
    
    newRight.insertItem(itemC);
    newRight.connectChild(0, child2);
    newRight.connectChild(1, child3);
  }
  
  Node getNextChild(Node node, int value) {
    int i;
    int numItems = node.getNumItems();
    
    for(i = 0; i < numItems; i ++) {
      if(value < node.getItem(i).data) {
        return node.getChild(i);
      }
    }
    return node.getChild(i);
  }

  void displayTree() {
    recursionDisplayTree(root, 0, 0);
  }

  void recursionDisplayTree(Node node, int level, int childNumber) {
    stdout.write('Level = $level child = $childNumber ');
    node.displayNode();

    int numItems = node.getNumItems();
    for(int i = 0; i < numItems + 1; i ++) {
      Node nextNode = node.getChild(i);

      if(nextNode != null) {
        recursionDisplayTree(nextNode, level + 1, i);
      } else {
        return;
      }
    }
  }
}

void main(List<String> args) {
  int value;
  Tree234 tree234 = new Tree234();

  tree234.insert(50);
  tree234.insert(40);
  tree234.insert(60);
  tree234.insert(30);
  tree234.insert(70);

  while(true) {
    stdout.write('Enter first letter of show, insert, find: ');
    String choice = stdin.readLineSync();

    switch(choice) {
      case 's':
        tree234.displayTree();
        break;
      case 'i':
        stdout.write('Enter value to insert: ');
        value = int.parse(stdin.readLineSync());
        tree234.insert(value);
        break;
      case 'f':
        stdout.write('Enter value to find: ');
        value = int.parse(stdin.readLineSync());
        int found = tree234.find(value);
        if (found != -1) {
          stdout.writeln('Found $value');
        } else {
          stdout.writeln('Could now find $value');
        }
        break;
      default:
        stdout.writeln('Invalud entry');
    }
  }
}
