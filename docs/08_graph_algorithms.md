# Graph Algorithms

## Depth-First Search (DFS)

```python
def dfs_recursive(graph, start, visited=None):
    """Time: O(V + E), Space: O(V)"""
    if visited is None:
        visited = set()
    
    visited.add(start)
    print(start, end=' ')
    
    for neighbor in graph.get(start, []):
        if neighbor not in visited:
            dfs_recursive(graph, neighbor, visited)
    
    return visited

def dfs_iterative(graph, start):
    """Time: O(V + E), Space: O(V)"""
    visited = set()
    stack = [start]
    
    while stack:
        vertex = stack.pop()
        if vertex not in visited:
            visited.add(vertex)
            print(vertex, end=' ')
            
            for neighbor in reversed(graph.get(vertex, [])):
                if neighbor not in visited:
                    stack.append(neighbor)
    
    return visited
```

## Breadth-First Search (BFS)

```python
from collections import deque

def bfs(graph, start):
    """Time: O(V + E), Space: O(V)"""
    visited = set([start])
    queue = deque([start])
    result = []
    
    while queue:
        vertex = queue.popleft()
        result.append(vertex)
        
        for neighbor in graph.get(vertex, []):
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
    
    return result
```

## Dijkstra's Algorithm

```python
import heapq

def dijkstra(graph, start):
    """Time: O((V + E) log V), Space: O(V)"""
    distances = {vertex: float('inf') for vertex in graph}
    distances[start] = 0
    pq = [(0, start)]
    
    while pq:
        current_dist, current = heapq.heappop(pq)
        
        if current_dist > distances[current]:
            continue
        
        for neighbor, weight in graph.get(current, []):
            distance = current_dist + weight
            
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(pq, (distance, neighbor))
    
    return distances
```

## Topological Sort

```python
def topological_sort(graph):
    """Time: O(V + E), Space: O(V)"""
    visited = set()
    stack = []
    
    def dfs(vertex):
        visited.add(vertex)
        for neighbor in graph.get(vertex, []):
            if neighbor not in visited:
                dfs(neighbor)
        stack.append(vertex)
    
    for vertex in graph:
        if vertex not in visited:
            dfs(vertex)
    
    return stack[::-1]
```

---

[← Previous: Dynamic Programming](07_dynamic_programming.md) | [Next: Tree Algorithms →](09_tree_algorithms.md)

[← Back to Main](../README.md)
