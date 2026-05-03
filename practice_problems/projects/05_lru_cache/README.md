# Project 5: LRU Cache Implementation

## Objective
Implement a production-ready LRU (Least Recently Used) cache.

## Components to Build

1. **Hash map** + **Doubly linked list**
2. **O(1) get** and **put** operations
3. **TTL** (Time-To-Live) support
4. **Thread-safe version** (optional)

## Features

- Fixed capacity
- Evict least recently used items
- Optional expiration time
- Thread-safe operations

## Learning Outcomes
- Cache eviction strategies
- Combined data structure usage
- Performance optimization

## Getting Started

```python
class LRUCache:
    def __init__(self, capacity):
        self.capacity = capacity
        self.cache = {}
        # Add doubly linked list
```
