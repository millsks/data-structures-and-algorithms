# Complexity Analysis

## Introduction

Understanding algorithm complexity is crucial for writing efficient code. This guide covers Big O notation, time complexity, and space complexity analysis.

## Big O Notation

Big O notation describes the **upper bound** of algorithm complexity - how the runtime or space requirements grow as input size increases.

### Common Complexities (Best to Worst)

| Notation | Name | Example |
|----------|------|---------|
| O(1) | Constant | Array access, hash table lookup |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Linear search, simple loop |
| O(n log n) | Linearithmic | Merge sort, heap sort |
| O(n²) | Quadratic | Bubble sort, nested loops |
| O(n³) | Cubic | Three nested loops |
| O(2ⁿ) | Exponential | Recursive fibonacci |
| O(n!) | Factorial | Generating all permutations |

### Complexity Growth Visualization

```
Operations vs Input Size (n=100)

O(1):        1 operation
O(log n):    ~7 operations
O(n):        100 operations
O(n log n):  ~664 operations
O(n²):       10,000 operations
O(2ⁿ):       1,267,650,600,228,229,401,496,703,205,376 operations
O(n!):       9.3 × 10¹⁵⁷ operations
```

## Time Complexity

Time complexity measures how the number of operations scales with input size.

### O(1) - Constant Time

**Operations that always take the same time**, regardless of input size.

```python
def get_first_element(arr):
    """O(1) - Always one operation"""
    return arr[0] if arr else None

def hash_lookup(dictionary, key):
    """O(1) - Hash table lookup"""
    return dictionary.get(key)

def add_to_set(s, element):
    """O(1) - Set insertion"""
    s.add(element)
```

**Characteristics:**
- Direct access operations
- Hash table operations (average case)
- Simple arithmetic operations

### O(log n) - Logarithmic Time

**Operations that halve the problem size** with each step.

```python
def binary_search(arr, target):
    """O(log n) - Halves search space each iteration"""
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

def find_power_of_two(n):
    """O(log n) - Dividing by 2 each step"""
    count = 0
    while n > 1:
        n //= 2
        count += 1
    return count
```

**Characteristics:**
- Binary search
- Balanced tree operations
- Divide and conquer algorithms

### O(n) - Linear Time

**Operations that scale directly with input size**.

```python
def find_max(arr):
    """O(n) - Must check every element"""
    if not arr:
        return None
    
    max_val = arr[0]
    for num in arr:
        if num > max_val:
            max_val = num
    return max_val

def sum_array(arr):
    """O(n) - One pass through array"""
    total = 0
    for num in arr:
        total += num
    return total

def contains_value(arr, target):
    """O(n) - Linear search"""
    for num in arr:
        if num == target:
            return True
    return False
```

**Characteristics:**
- Single loop through data
- Linear search
- Simple array/list operations

### O(n log n) - Linearithmic Time

**Efficient sorting algorithms**.

```python
def merge_sort(arr):
    """O(n log n) - Divides and merges"""
    if len(arr) <= 1:
        return arr
    
    mid = len(arr) // 2
    left = merge_sort(arr[:mid])      # log n divisions
    right = merge_sort(arr[mid:])
    
    return merge(left, right)          # n operations to merge

def merge(left, right):
    """O(n) - Merging two sorted arrays"""
    result = []
    i = j = 0
    
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    
    result.extend(left[i:])
    result.extend(right[j:])
    return result
```

**Characteristics:**
- Efficient sorting (merge sort, quick sort, heap sort)
- Divide and conquer with linear merge

### O(n²) - Quadratic Time

**Nested loops** over the data.

```python
def bubble_sort(arr):
    """O(n²) - Two nested loops"""
    n = len(arr)
    for i in range(n):              # n iterations
        for j in range(0, n - i - 1):  # n iterations
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

def find_duplicates(arr):
    """O(n²) - Checking all pairs"""
    duplicates = []
    for i in range(len(arr)):
        for j in range(i + 1, len(arr)):
            if arr[i] == arr[j] and arr[i] not in duplicates:
                duplicates.append(arr[i])
    return duplicates

# Better approach: O(n)
def find_duplicates_optimized(arr):
    """O(n) - Using hash set"""
    seen = set()
    duplicates = set()
    for num in arr:
        if num in seen:
            duplicates.add(num)
        seen.add(num)
    return list(duplicates)
```

**Characteristics:**
- Two nested loops
- Comparing all pairs
- Simple sorting algorithms

### O(2ⁿ) - Exponential Time

**Each additional input doubles the operations**.

```python
def fibonacci_recursive(n):
    """O(2^n) - Exponential branching"""
    if n <= 1:
        return n
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)

def generate_subsets(arr):
    """O(2^n) - 2^n possible subsets"""
    if not arr:
        return [[]]
    
    subsets_without = generate_subsets(arr[1:])
    subsets_with = [subset + [arr[0]] for subset in subsets_without]
    return subsets_without + subsets_with

# Optimized fibonacci: O(n)
def fibonacci_dp(n):
    """O(n) - Dynamic programming approach"""
    if n <= 1:
        return n
    
    prev2, prev1 = 0, 1
    for _ in range(2, n + 1):
        current = prev1 + prev2
        prev2, prev1 = prev1, current
    
    return prev1
```

**Characteristics:**
- Recursive algorithms with multiple branches
- Brute force solutions
- Subset generation

## Space Complexity

Space complexity measures **memory usage** as input size grows.

### O(1) - Constant Space

```python
def swap_elements(arr, i, j):
    """O(1) space - Only using a few variables"""
    arr[i], arr[j] = arr[j], arr[i]

def sum_iterative(n):
    """O(1) space - Only storing running total"""
    total = 0
    for i in range(n + 1):
        total += i
    return total
```

### O(n) - Linear Space

```python
def create_doubled_array(arr):
    """O(n) space - Creating new array"""
    return [x * 2 for x in arr]

def fibonacci_memoization(n, memo=None):
    """O(n) space - Storing all computed values"""
    if memo is None:
        memo = {}
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    
    memo[n] = fibonacci_memoization(n - 1, memo) + fibonacci_memoization(n - 2, memo)
    return memo[n]
```

### O(log n) - Logarithmic Space

```python
def binary_search_recursive(arr, target, left=0, right=None):
    """O(log n) space - Recursion depth is log n"""
    if right is None:
        right = len(arr) - 1
    
    if left > right:
        return -1
    
    mid = (left + right) // 2
    
    if arr[mid] == target:
        return mid
    elif arr[mid] < target:
        return binary_search_recursive(arr, target, mid + 1, right)
    else:
        return binary_search_recursive(arr, target, left, mid - 1)
```

## Analyzing Complexity

### Step-by-Step Analysis

1. **Identify the basic operations** (comparisons, assignments, etc.)
2. **Count how many times they execute** based on input size
3. **Express in Big O notation**, dropping constants and lower-order terms

### Example Analysis

```python
def example_function(arr):
    # Step 1: O(1) - constant
    n = len(arr)
    
    # Step 2: O(n) - single loop
    for i in range(n):
        print(arr[i])
    
    # Step 3: O(n²) - nested loops
    for i in range(n):
        for j in range(n):
            print(arr[i] + arr[j])
    
    # Total: O(1) + O(n) + O(n²) = O(n²)
    # We keep only the dominant term
```

### Rules for Big O

1. **Drop constants**: O(2n) → O(n)
2. **Drop lower-order terms**: O(n² + n) → O(n²)
3. **Consider worst case** unless specified otherwise
4. **Multiplication for nested operations**: O(n) * O(n) = O(n²)
5. **Addition for sequential operations**: O(n) + O(m) = O(n + m)

## Common Patterns

### Pattern 1: Sequential Operations

```python
def process(arr1, arr2):
    # O(n) + O(m) = O(n + m)
    for item in arr1:  # O(n)
        print(item)
    
    for item in arr2:  # O(m)
        print(item)
```

### Pattern 2: Nested Operations

```python
def nested(arr):
    # O(n) * O(n) = O(n²)
    for i in arr:        # O(n)
        for j in arr:    # O(n)
            print(i, j)
```

### Pattern 3: Different Input Sizes

```python
def process_two_arrays(arr1, arr2):
    # O(n * m) where n = len(arr1), m = len(arr2)
    for i in arr1:       # O(n)
        for j in arr2:   # O(m)
            print(i, j)
```

### Pattern 4: Divide and Conquer

```python
def divide_and_conquer(arr):
    # O(n log n)
    # Each level: O(n) work
    # Number of levels: O(log n)
    # Total: O(n) * O(log n) = O(n log n)
    
    if len(arr) <= 1:
        return arr
    
    mid = len(arr) // 2
    left = divide_and_conquer(arr[:mid])
    right = divide_and_conquer(arr[mid:])
    return merge(left, right)
```

## Best, Average, and Worst Case

Some algorithms have different complexities depending on input:

### Quick Sort Example

```python
def quick_sort(arr):
    """
    Best Case:    O(n log n) - Balanced partitions
    Average Case: O(n log n) - Random pivots
    Worst Case:   O(n²) - Already sorted with bad pivot
    """
    if len(arr) <= 1:
        return arr
    
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    
    return quick_sort(left) + middle + quick_sort(right)
```

## Amortized Analysis

Some operations have varying costs, but **average out over time**.

### Dynamic Array (Python List)

```python
# Appending to a list
my_list = []
for i in range(1000):
    my_list.append(i)  # O(1) amortized, even though occasional resize is O(n)
```

**Individual operations:**
- Most appends: O(1)
- Occasional resize: O(n)
- **Amortized**: O(1) per append

## Practice Problems

### Problem 1: Analyze This Function

```python
def mystery_function(n):
    result = 0
    for i in range(n):
        for j in range(i):
            result += 1
    return result
```

<details>
<summary>Answer</summary>

**Time Complexity**: O(n²)
- Outer loop: n iterations
- Inner loop: 0 + 1 + 2 + ... + (n-1) = n(n-1)/2 iterations
- Total: O(n²)

**Space Complexity**: O(1)
- Only using a few variables
</details>

### Problem 2: Compare Complexities

Which is more efficient for n = 1,000,000?
- Algorithm A: O(n)
- Algorithm B: O(n log n)
- Algorithm C: O(√n)

<details>
<summary>Answer</summary>

**Algorithm C: O(√n)** is most efficient
- C: ~1,000 operations
- A: 1,000,000 operations
- B: ~20,000,000 operations
</details>

## Summary

- **Big O** describes upper bound of growth rate
- **Drop constants** and lower-order terms
- **Consider worst case** unless specified
- **Time vs Space** - often a trade-off
- **Choose the right complexity** for your use case

## Next Steps

- [Built-in Data Structures](02_builtin_structures.md)
- Practice analyzing code complexity
- Implement algorithms and verify complexity

---

[← Back to Main](../README.md) | [Next: Built-in Structures →](02_builtin_structures.md)
