# Recursion and Backtracking

## Basic Recursion

### Factorial

```python
def factorial(n):
    """Time: O(n), Space: O(n)"""
    if n <= 1:
        return 1
    return n * factorial(n - 1)
```

### Fibonacci

```python
def fibonacci(n, memo=None):
    """Time: O(n), Space: O(n) with memoization"""
    if memo is None:
        memo = {}
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)
    return memo[n]
```

## Backtracking

### Generate Permutations

```python
def permutations(arr):
    if len(arr) <= 1:
        return [arr]
    
    result = []
    for i in range(len(arr)):
        rest = arr[:i] + arr[i+1:]
        for p in permutations(rest):
            result.append([arr[i]] + p)
    
    return result
```

### Generate Subsets

```python
def subsets(arr):
    result = [[]]
    for num in arr:
        result += [subset + [num] for subset in result]
    return result
```

---

[← Previous: Searching](05_searching.md) | [Next: Dynamic Programming →](07_dynamic_programming.md)

[← Back to Main](../README.md)
