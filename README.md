# Data Structures and Algorithms in Dart

[![Build Status](https://travis-ci.org/artem-galas/data_structures_in_dart.svg?branch=master)](https://travis-ci.org/artem-galas/data_structures_in_dart)

This is a repository inspired by **[Data Structures & Algorithms in Java by Robert Lafore](https://www.amazon.com/Data-Structures-Algorithms-Java-2nd/dp/0672324539)**.

There you can find all code-example rewritten on Dart and all solved tasks

## Table of Contents
### 01. Arrays.
  - `low_array` - very simple example with arrays.
  - `high_array` - rewritten `low_array.dart` using more OOP way. Describes **LinerSearch** in Arrays.
  - `ordered_array` - Describes **BinarySearch** in sorted Arrays.
  - `class_data` - Using Arrays with Object.
### 02. Simple Sorting.
  - `bubble_sort` - Bubble Sort Example
  - `select_sort`
  - `insert_sort`
  - `object_sort` - Object sort example using **insert sort** and **Lexicographical Comparisons**
### 03. Stacks and Queues.
  - stack
    - `stack` - simple stack with array of integer
    - `reverse` - reversing a word eq: `artem` -> `metra`
    - `brackets` - Delimiter Matching - a program that checks the delimiters in a line of text typed by the user eq: `a{b(c]d}e` -> `Error ] at 5`
  - `queue` - simple queue.
  - `priority_queue`
  - `infix` - Convert Infix to Postfix eq `A+B*C` -> `ABC*+`
  - `postfix` - Evaluate Postfix Expressions eq `57+` -> `Evaluates to 12`
### 04. Linked Lists.
  - linked_list
    - `simple_linked_list ` - simple linked list implemintation with `deleteFirst` and `insertFirst` methods
    - `linked_list` - adding `delete` and `find` methods.
  - `first_last_list` - linked list with link to `first` and `last` object
  - `link_stack` - Stack implementation using `linked list`
  - `link_queue` - Queue implementation using `first_last_list`
  - `sorted_list` - sorted linked list
  - `list_insertion_sort` - insertion sort array using linked list
  - `double_linked_list` - linked list where each element contain `next` and `previous` link
  - `list_iterator` - implementation linked list with iterator
### 05. Recursion.
  - `triangle` - simple example of recursion - calculate triangle number. E.g `Triangle number 3 -> 6` (1, 3, 6, 10, 15, 21...)
  - `anagram` - simple program, which can do anagrams.
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
  - `binary_search` - binary search implemented with recursion (binary search see 01_array/ordered_array)
  - `towers` - Tower of Hanoi algorithms using recursion
  - `merge` - very simple implementation merge 2 pre-sorted arrays.
  - `merge_sort` - Merge sorting array
  - `stack_triangle` - calculate triangle number with recursion and stack
  - `stack_triangle2` - calculate triangle number using stack instead of recension
  - `power` - X power Y using optimizing recursion method
### 06. Sorting.
  - `shell_sorting` - sorting used [Shell's Method](https://en.wikipedia.org/wiki/Shellsort)
  - `partion`
  - `quick_sort1` - Quick sort based on last element of array
  - `quick_sort2` - QuickSort based on median
### 07. Binary Tree.
  - `binary-tree` - Binary Search tree
  ```bash
                                  50
                25                              75
        12              37              --              87
    --      --      30      43      --      --      --      93
  --  --  --  --  --  33  --  --  --  --  --  --  --  --  --  97
  ```
### 08. Red-Black Tree.
  Unfortunately there no code.
### 09. Tree 2 3 4.
  - `tree_2_3_4` - Tree 2 3 4
  ```bash
  Enter first letter of show, insert, find: s
  Level = 0 child = 0 /50
  Level = 1 child = 0 /30/40
  Level = 1 child = 1 /60/70
  ```    
### 10. Hash.
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

- `hash_double` - Double Hash. It use two hashFunction:
    - `hashFunc` - for find first index;
    - `secondHashFunc` - for find the step (offset); 

```bash
Enter size of hash table: 10
Enter initial number of items: 4
Enter first leter of show, insert, delete, find: 
s
HashTable: ** 121 ** ** ** ** 196 137 138 ** 
Enter first leter of show, insert, delete, find: 
i
Enter key value to insert: 100
Enter first leter of show, insert, delete, find: 
s
HashTable: 100 121 ** ** ** ** 196 137 138 ** 
```

- `hash_chain` - Chain method which use SortedLinkedList

```bash
Enter size of hash table: 5
Enter initial number of items: 5
Enter first leter of show, insert, delete, find
s
0. List (first -> last):
1. List (first -> last): 56 86
2. List (first -> last): 12
3. List (first -> last): 13 48
4. List (first -> last):
Enter first leter of show, insert, delete, find
```

### 11. Heap.

- `heap` - heap implementation

```bash
Enter first letter of show, insert, remove, change:
s
Heap Array: 100 90 80 30 60 50 70 20 10 40
........................................................
                                100
                90                              80
        30              60              50              70
    20      10      40
 ........................................................
```

- `heap_sort` - heap sorting - `O(N*logN)`

```bash
Enter number of items: 10
Random Array: 58 42 87 29 14 53 39 79 9 64
Heap: 87 79 58 42 64 53 39 29 9 14
........................................................
                                87
                79                              58
        42              64              53              39
    29      9      14
 ........................................................
Sorted: 9 14 29 39 42 53 58 64 79 87
```

### 12 Graph.
![graph](./doc/graph.jpg)

- `dfs` - Depth-first search
```bash
Visits: ABCDE
```

- `bfs` - Breadth-first search 
```bash
Visits: ABDCE
```

- `mst` - Minimum spanning tree

![graph-not-optimized](./doc/graph-not-optimized.jpg)
![graph-mst](./doc/graph-mst.jpg)

```bash
Minimum spanning tree: AB BC CD DE 
```

- `topo` - Topology sorting

```bash
Topologically sorted order: BAEDGCFH
```

### 13. Weighted Graph.

- `mstw`- Minimum Spanning Tree with Weighted Graphs

![weighted-graph-mstw-input](doc/weighted-graph-mstw-input.jpg)
![weighted-graph-mstw-output](doc/weighted-graph-mstw-output.jpg)

```bash
Minimum spanning tree: AD AB BE EC CF 
``` 

- `path` - Find Shortest Path ([Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm))

![graph_shortest_path](doc/graph_shortest_path.jpg)

```bash
Shortest Path: 
A = inf(A) B = 50(A) C = 100(D) D = 80(A) E = 140(C) 
```

## How to Run Code?

- Be sure you have installed [dart](https://webdev.dartlang.org/tools/sdk#install)
- Open folder with project
- Run into you terminal `dart path/to/file.dart` e.q `dart chap_02/low_array.dart`

## What IDE have support dart language?
I prefer use [JetBrains](https://www.jetbrains.com/idea/)

But you can use [VsCode](https://code.visualstudio.com/) + [DartCode](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) Plugin

## How to test tasks?
All tasks have a unit test, which located in `0N_name/tasks/test`.

So you need:
- copy and past that test to your project
- change path to you solution
- run `pub run test path/to_test.dart`

## Contributing
If you want to contribute or you find a issue/mistake feel free to create an issue and pull-request

## TODO:
- [ ] Add tests for implementations
- [ ] Add task for each data structure
- [ ] Add test for each task
