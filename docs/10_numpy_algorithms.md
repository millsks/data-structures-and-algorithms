# NumPy for Algorithms

NumPy provides efficient array operations for algorithm implementations.

## Arrays and Basic Operations

```python
import numpy as np

# Creating arrays
arr1d = np.array([1, 2, 3, 4, 5])
arr2d = np.array([[1, 2, 3], [4, 5, 6]])
zeros = np.zeros((3, 3))
ones = np.ones((2, 4))
random_arr = np.random.rand(3, 3)

# Array operations
print(arr1d + 10)
print(arr1d * 2)
print(np.sum(arr1d))
print(np.mean(arr1d))
```

## Algorithmic Applications

### Binary Search with NumPy

```python
def binary_search_numpy(arr, target):
    idx = np.searchsorted(arr, target)
    if idx < len(arr) and arr[idx] == target:
        return idx
    return -1
```

### Moving Average

```python
def moving_average(arr, window_size):
    cumsum = np.cumsum(np.insert(arr, 0, 0))
    return (cumsum[window_size:] - cumsum[:-window_size]) / window_size
```

### Top K Elements

```python
def top_k_elements(arr, k):
    indices = np.argpartition(arr, -k)[-k:]
    indices = indices[np.argsort(arr[indices])][::-1]
    return indices, arr[indices]
```

---

[← Previous: Tree Algorithms](09_tree_algorithms.md) | [Next: Pandas →](11_pandas_structures.md)

[← Back to Main](../README.md)
