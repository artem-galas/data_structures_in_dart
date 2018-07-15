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
### Chap06. Recursion
  - `triangle` - simple example of recursion - calculate triangle number. E.g `Triangle number 3 -> 6` (1, 3, 6, 10, 15, 21...)
  - `anagram` - somple program, which can do anograms. 
    E.g Input: `cat`
    Output:
    ```
    1  c a t
    2  c t a
    3  a t c
    4  a c t
    5  t c a
    6  t a c
    ```
  - `binary_search` - binary search implemented with recursrion (binary search see Chap02/OrderedArray)
  - `towers` - Tower of Hanoi algorithms using recursion
  - `merge` - very simple implemintation merge 2 pre-sorted arrays.
  - `merge_sort` - Merge sorting array
  - `stack_triangle` - calculate triangle number with recursion and stack
  - `stack_triangle2` - calculate triangle number usign stack insted of recusion
  - `power` - X power Y using optimizing recursion method
### Chap07. Sorting
  - `shell_sorting` - sorting used [Shell's Method](https://en.wikipedia.org/wiki/Shellsort)
  - `partion`
  - `quick_sort1` - Quick sort based on last element of array
  - `quick_sort2` - QuickSort based on median
### Chap08. Binary Tree
  - `binary-tree` - Binary Search tree
  ```bash
                                  50
                25                              75
        12              37              --              87
    --      --      30      43      --      --      --      93
  --  --  --  --  --  33  --  --  --  --  --  --  --  --  --  97
  ```
### Chap 09. Red-Black Tree
  Unfortunately there no code.
### Chap 10. Tree 2 3 4
  - `tree2-3-4` - Tree 2 3 4
  ```bash
  Enter first letter of show, insert, find: s
  Level = 0 child = 0 /50
  Level = 1 child = 0 /30/40
  Level = 1 child = 1 /60/70
  ```    
### Chap 11. Hash
- `hash` - simple hash
```bash
Enter size of hash table: 10
Enter initial number of items: 8
Enter first leter of show, insert, delete, find: 
s
HashTable: 120 151 150 193 173 118 ** ** 148 99 
Enter first leter of show, insert, delete, find: 
i
Enter key value to insert: 100
Enter first leter of show, insert, delete, find: 
s
HashTable: 120 151 150 193 173 118 100 ** 148 99 
Enter first leter of show, insert, delete, find: 
```


## How to Run listing?

- Open folder with project
- Run into you terminal `dart path/to/file.dart` e.q `dart Chap02/LowArray/low_array.dart `