# Searching Algorithms

## Linear Search

Time: O(n), Space: O(1)

```python
def linear_search(arr, target):
    for i, val in enumerate(arr):
        if val == target:
            return i
    return -1
```

## Binary Search

Time: O(log n), Space: O(1), Requires: Sorted array

```python
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    
    while left <= right:
        mid = (left + right) // 2
        
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    
    return -1
```

## Binary Search Variants

### Find First Occurrence

```python
def find_first(arr, target):
    left, right = 0, len(arr) - 1
    result = -1
    
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            result = mid
            right = mid - 1
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    
    return result
```

---

[← Previous: Sorting](04_sorting.md) | [Next: Recursion →](06_recursion.md)

[← Back to Main](../README.md)
