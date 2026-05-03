# Advanced Data Structures

This chapter covers custom implementations of advanced data structures.

## Stack

Last-In-First-Out (LIFO) data structure.

```python
class Stack:
    def __init__(self):
        self.items = []
    
    def push(self, item):
        """O(1)"""
        self.items.append(item)
    
    def pop(self):
        """O(1)"""
        if not self.is_empty():
            return self.items.pop()
        raise IndexError("Pop from empty stack")
    
    def peek(self):
        """O(1)"""
        if not self.is_empty():
            return self.items[-1]
        return None
    
    def is_empty(self):
        """O(1)"""
        return len(self.items) == 0
    
    def size(self):
        """O(1)"""
        return len(self.items)
```

## Queue

First-In-First-Out (FIFO) data structure.

```python
from collections import deque

class Queue:
    def __init__(self):
        self.items = deque()
    
    def enqueue(self, item):
        """O(1)"""
        self.items.append(item)
    
    def dequeue(self):
        """O(1)"""
        if not self.is_empty():
            return self.items.popleft()
        raise IndexError("Dequeue from empty queue")
    
    def front(self):
        """O(1)"""
        if not self.is_empty():
            return self.items[0]
        return None
    
    def is_empty(self):
        return len(self.items) == 0
```

## Linked List

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class LinkedList:
    def __init__(self):
        self.head = None
        self.size = 0
    
    def append(self, val):
        """O(n)"""
        new_node = ListNode(val)
        if not self.head:
            self.head = new_node
        else:
            current = self.head
            while current.next:
                current = current.next
            current.next = new_node
        self.size += 1
    
    def prepend(self, val):
        """O(1)"""
        new_node = ListNode(val, self.head)
        self.head = new_node
        self.size += 1
```

## Binary Tree

```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class BinaryTree:
    def __init__(self, root=None):
        self.root = root
    
    def inorder(self, node, result=None):
        """Left -> Root -> Right"""
        if result is None:
            result = []
        if node:
            self.inorder(node.left, result)
            result.append(node.val)
            self.inorder(node.right, result)
        return result
```

## Binary Search Tree

```python
class BST:
    def __init__(self):
        self.root = None
    
    def insert(self, val):
        """O(log n) average, O(n) worst"""
        if not self.root:
            self.root = TreeNode(val)
        else:
            self._insert_recursive(self.root, val)
    
    def _insert_recursive(self, node, val):
        if val < node.val:
            if node.left:
                self._insert_recursive(node.left, val)
            else:
                node.left = TreeNode(val)
        else:
            if node.right:
                self._insert_recursive(node.right, val)
            else:
                node.right = TreeNode(val)
```

## Heap

```python
import heapq

class MinHeap:
    def __init__(self):
        self.heap = []
    
    def push(self, val):
        """O(log n)"""
        heapq.heappush(self.heap, val)
    
    def pop(self):
        """O(log n)"""
        if self.heap:
            return heapq.heappop(self.heap)
        raise IndexError("Pop from empty heap")
    
    def peek(self):
        """O(1)"""
        if self.heap:
            return self.heap[0]
        return None
```

## Graph

```python
class Graph:
    def __init__(self, directed=False):
        self.graph = {}
        self.directed = directed
    
    def add_vertex(self, vertex):
        if vertex not in self.graph:
            self.graph[vertex] = []
    
    def add_edge(self, v1, v2):
        self.add_vertex(v1)
        self.add_vertex(v2)
        self.graph[v1].append(v2)
        if not self.directed:
            self.graph[v2].append(v1)
```

## Trie

```python
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end_of_word = False

class Trie:
    def __init__(self):
        self.root = TrieNode()
    
    def insert(self, word):
        """O(m) where m is word length"""
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end_of_word = True
    
    def search(self, word):
        """O(m)"""
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end_of_word
```

---

[← Previous: Built-in Structures](02_builtin_structures.md) | [Next: Sorting →](04_sorting.md)

[← Back to Main](../README.md)
