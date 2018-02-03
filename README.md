# Data Structures and Algorithms in Dart

This is a repository inspired by **Data Structures & Algorithms in Java by Robert Lafore**.

There you can find all _listing_ rewritten on Dart and all _solved tasks_

[To buy a book](https://www.amazon.com/Data-Structures-Algorithms-Java-2nd/dp/0672324539)

## Table of Contents
### Chap02. Arrays.
  - LowArray - very simple example with arrays. 
  - HighArray - rewritten `low_array.dart` using more OOP way. Describes **LinerSearch** in Arrays.
  - OrderedArray - Describes **BinarySearch** in sorted Arrays.
  - ClassData - Using Arrays with Object.
### Chap 03. Simple Sorting
  - BubbleSort - Bubble Sort Example
  - Select Sort
  - Insert Sort
  - Object Sort - Object sort example using **insert sort** and **Lexicographical Comparisons**
### Chap 04. Stacks and Queues
  - Stack
    - stack - simple stack with array of integer
    - reverse - reversing a word eq: `artem` -> `metra`
    - brackets - Delimiter Matching - a program that checks the delimiters in a line of text typed by the user eq: `a{b(c]d}e` -> `Error ] at 5`
  - Queue - simple queue.
  - Priority Queue
  - Infix - Convert Infix to Postfix eq `A+B*C` -> `ABC*+`
  - Postfix - Evaluate Postfix Expressions eq `57+` -> `Evaluates to 12`
### Chap 05. Linked Lists
  - LinkedList
    - `simple_linked_list ` - simple linked list implemintation with `deleteFirst` and `insertFirst` methods
    - `linked_list` - adding `delete` and `find` methods.
  - FirstLastList - linked list with link to `first` and `last` object
  - LinkStack - `stack` implementation using `linked list`
  - LinkQueue `queue` implementation using `first_last_list`
  - SortedList - sorted linked list
  - List Insertion Sort - insertion sort array using linked list
  - DobuleLinkedList - linked list where each element contain `next` and `previous` link
  - ListIteraort - implementation linked list with iterator 
## How to Run listing?

- Open folder with project
- Run into you terminal `dart path/to/file.dart` e.q `dart Chap02/LowArray/low_array.dart `