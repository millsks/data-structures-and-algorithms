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

When analyzing time complexity, focus on how the running time grows as $n$ gets large, not the exact number of CPU instructions. Different machines may run code at different speeds, but the growth trend is what matters.

In practice, time complexity usually counts the number of:

- Comparisons
- Assignments
- Arithmetic operations
- Loop iterations
- Recursive calls

We do **not** usually count every tiny low-level detail. Instead, we look for the dominant pattern that controls growth.

### How to Think About Time Complexity

Ask these questions:

1. What is the input size $n$?
2. What is the core operation being repeated?
3. How many times does that operation happen?
4. Which term grows fastest as $n$ increases?

For example:

```python
def print_pairs(arr):
    for i in range(len(arr)):
        for j in range(len(arr)):
            print(arr[i], arr[j])
```

If `arr` has length $n$:

- Outer loop runs $n$ times
- Inner loop runs $n$ times for each outer iteration
- Total work is $n \cdot n = n^2$

So the time complexity is O(n²).

### O(1) - Constant Time

**Operations that always take the same time**, regardless of input size.

Constant time does **not** mean "instant". It means the work does not grow with $n$.

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

**Key idea:**
Even if an O(1) operation takes 20 machine steps instead of 2, it is still O(1) because the number of steps stays bounded.

### O(log n) - Logarithmic Time

**Operations that halve the problem size** with each step.

Logarithmic time is efficient because each step removes a large fraction of the remaining work.

If a problem size repeatedly changes like this:

$$
n \to n/2 \to n/4 \to n/8 \to \dots
$$

then the number of steps is about $\log_2 n$.

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

**Rule of thumb:**
If each iteration shrinks the search space by a constant factor, the runtime is often O(log n).

### O(n) - Linear Time

**Operations that scale directly with input size**.

If you must inspect each element once, the runtime is usually linear.

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

**Important note:**
Multiple separate linear passes are still O(n):

$$
O(n) + O(n) = O(2n) = O(n)
$$

### O(n log n) - Linearithmic Time

**Efficient sorting algorithms**.

This often appears when:

- The problem is divided into smaller pieces
- There are O(log n) levels of work
- Each level performs O(n) total processing

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

**Mental model:**
"Do linear work across logarithmically many levels."

### O(n²) - Quadratic Time

**Nested loops** over the data.

Quadratic algorithms become slow quickly as input grows. Doubling the input size roughly quadruples the amount of work.

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

**Warning sign:**
If every item is compared with many or all other items, suspect O(n²).

This is often acceptable for small inputs, but it usually becomes impractical for large ones.

### O(n³) - Cubic Time

**Three levels of dependent iteration**.

```python
def count_triplets(arr):
    count = 0
    for i in range(len(arr)):
        for j in range(len(arr)):
            for k in range(len(arr)):
                count += 1
    return count
```

This runs in O(n³) time because there are three nested loops of size $n$.

**Where it appears:**
- Brute-force triplet checking
- Some matrix algorithms
- Naive graph algorithms on dense data

### O(2ⁿ) - Exponential Time

**Each additional input doubles the operations**.

Exponential complexity is usually a sign that the algorithm explores many combinations or branches.

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

**Why it becomes infeasible fast:**

Adding one more input element may nearly double the work. That means even modest increases in $n$ can make the algorithm unusable.

### Time Complexity Pitfalls

#### Nested loops are not always O(n²)

```python
def two_pointer_scan(arr):
    left, right = 0, len(arr) - 1
    while left < right:
        left += 1
        right -= 1
```

This is O(n), not O(n²), because the pointers move toward each other only a total of O(n) times.

#### Different inputs should use different variables

```python
def compare_all(a, b):
    for x in a:
        for y in b:
            print(x, y)
```

This is O(nm), not necessarily O(n²), because the input sizes may be different.

#### Early exits can improve best case but not worst case

```python
def contains_zero(arr):
    for value in arr:
        if value == 0:
            return True
    return False
```

- Best case: O(1)
- Worst case: O(n)

When no case is specified, Big O usually refers to the worst case.

## Space Complexity

Space complexity measures **memory usage** as input size grows.

Just like time complexity tracks growth in operations, space complexity tracks growth in memory consumption.

This usually includes:

- Variables
- Temporary arrays or lists
- Hash maps / sets
- Recursion call stack
- Any extra storage created by the algorithm

### Input Space vs Auxiliary Space

It is useful to distinguish between:

- **Input space**: memory needed to store the input itself
- **Auxiliary space**: extra memory used beyond the input

In interviews and algorithm analysis, people often care most about **auxiliary space**.

For example, if a function receives an array of size $n$ and uses only a few extra variables, we usually call it O(1) auxiliary space, even though the input already occupies O(n) memory.

### O(1) - Constant Space

The algorithm uses a fixed amount of extra memory, regardless of input size.

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

**Characteristics:**
- A fixed number of variables
- In-place updates
- No growing helper data structures

An algorithm can still take O(n) time while using O(1) extra space.

### O(n) - Linear Space

The amount of extra memory grows in proportion to input size.

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

**Common causes:**
- Building a new list or copy of the input
- Storing memoization tables
- Using sets or dictionaries to track seen values
- Breadth-first or depth-first traversal structures in some cases

### O(log n) - Logarithmic Space

This often comes from recursion depth when the problem size shrinks by a factor each time.

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

Each recursive call adds one frame to the call stack, but the number of calls present at once is only O(log n).

### O(n) Recursive Space vs O(1) Iterative Space

Two solutions can have the same time complexity but different space complexity.

```python
def sum_recursive(n):
    if n == 0:
        return 0
    return n + sum_recursive(n - 1)
```

This uses O(n) space because there are O(n) recursive stack frames.

By contrast, the earlier iterative version uses O(1) extra space.

### In-Place vs Out-of-Place Algorithms

- **In-place** algorithms modify the original structure with little extra memory
- **Out-of-place** algorithms build new structures

Example:

```python
def reverse_in_place(arr):
    left, right = 0, len(arr) - 1
    while left < right:
        arr[left], arr[right] = arr[right], arr[left]
        left += 1
        right -= 1
```

This uses O(1) extra space.

```python
def reversed_copy(arr):
    return arr[::-1]
```

This uses O(n) extra space because it creates a new array.

### Space Complexity Pitfalls

#### Recursion uses memory

Even if a recursive function creates no lists or dictionaries, the call stack still consumes space.

#### Output size may dominate space usage

If an algorithm must return all subsets of a set, the output itself already requires O(2ⁿ) space.

#### Python slicing can allocate new memory

Code like `arr[:mid]` often creates a new list, which affects space usage.

For example, a recursive algorithm may have a simple time recurrence but higher-than-expected space cost if it repeatedly copies slices.

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

Some operations have varying costs, but **average out over time across a sequence of operations**.

Amortized analysis asks:

> If we perform an operation many times, what is the average cost per operation in the **worst valid sequence**?

This is different from average-case analysis:

- **Average-case** assumes something about the input distribution
- **Amortized** makes no randomness assumption; it spreads occasional expensive operations across many cheap ones

In other words, an amortized bound says that while a single operation might be expensive, **it cannot happen too often without many inexpensive operations around it**.

### When Amortized Analysis Is Useful

Amortized analysis often appears in data structures where work is done in bursts:

- Dynamic arrays that occasionally resize
- Hash tables that occasionally rehash
- Stacks with occasional batch operations
- Union-find with path compression

### Dynamic Array (Python List)

The classic example is appending to a dynamic array.

- Most `append()` operations place the element into unused capacity: O(1)
- Once the array is full, the implementation allocates a bigger array and copies old elements: O(n)
- That resize is expensive, but it does **not** happen on every append

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

### Why Appending Is Still O(1) Amortized

Suppose the array doubles in size whenever it fills up.

If capacities grow like this:

1, 2, 4, 8, 16, ...

then the total number of copied elements after $n$ appends is:

$$
1 + 2 + 4 + 8 + \dots + n/2 < n
$$

So across $n$ appends:

- We do $n$ direct insertions
- We do fewer than $n$ total copied moves during resizes

That gives total work of less than $2n$, so the average cost per append is:

$$
\frac{O(n)}{n} = O(1)
$$

This is the key amortized idea: the expensive resize cost is paid for by many earlier cheap appends.

### Small Resize Walkthrough

Imagine starting with capacity 1:

| Append | Capacity Before | Resize? | Cost |
|--------|------------------|---------|------|
| 1st | 1 | No | O(1) |
| 2nd | 1 | Yes, copy 1 item | O(1) overall but resize step is O(1) |
| 3rd | 2 | Yes, copy 2 items | O(2) |
| 4th | 4 | No | O(1) |
| 5th | 4 | Yes, copy 4 items | O(4) |
| 6th | 8 | No | O(1) |
| 7th | 8 | No | O(1) |
| 8th | 8 | No | O(1) |

Some operations spike in cost, but the spikes are rare enough that the long-run average stays constant.

### Another Example: Stack with `multipop`

```python
class SimpleStack:
    def __init__(self):
        self.items = []

    def push(self, value):
        self.items.append(value)  # O(1)

    def pop(self):
        if self.items:
            return self.items.pop()  # O(1)
        return None

    def multipop(self, k):
        while self.items and k > 0:
            self.items.pop()
            k -= 1
```

At first glance, `multipop(k)` looks like O(k), which is true for one call. But over a sequence of operations:

- Each element can be pushed once
- Each element can be popped at most once

So if we perform many `push`, `pop`, and `multipop` operations, the total number of pops is bounded by the total number of pushes. That makes the amortized cost per stack operation O(1).

### Common Ways to Prove Amortized Bounds

There are three standard techniques:

#### 1. Aggregate Method

Add up the total cost of a sequence of $n$ operations, then divide by $n$.

This is what we did for dynamic arrays.

#### 2. Accounting Method

Assign an artificial "charge" to cheap operations so they prepay for future expensive ones.

For example, you might pretend each `append()` costs 3 units:

- 1 unit pays for the insertion now
- 2 units are saved as credit

When a resize happens, the stored credits pay for copying elements.

#### 3. Potential Method

Track stored energy in the data structure with a potential function $\Phi$.

Cheap operations may increase potential, and expensive operations may decrease it. The amortized cost is:

$$
	ext{amortized cost} = \text{actual cost} + \Delta \Phi
$$

This method is common in more advanced data structures.

### Important Takeaway

Amortized analysis does **not** say every operation is cheap.

It says that for any long enough valid sequence, the **average cost per operation stays bounded**, even if a few individual operations are expensive.

That is why we say:

- A single `append()` can be O(n)
- Repeated `append()` operations are O(1) amortized

```python
# Example interpretation:
# Performing n appends takes O(n) total time,
# so the average cost per append is O(1) amortized.
```

## Common Python Operation Comparison

Here is a quick reference for common operations. These are typical costs in practice, though exact behavior depends on implementation details and edge cases.

| Operation | Time Complexity | Extra Space | Notes |
|-----------|-----------------|-------------|-------|
| `arr[i]` | O(1) | O(1) | Direct index access |
| `arr.append(x)` | O(1) amortized | O(1) amortized | Occasional resize makes one append O(n) |
| `arr.pop()` | O(1) | O(1) | Popping from end of list |
| `arr.insert(0, x)` | O(n) | O(1) | Must shift elements |
| `x in arr` | O(n) | O(1) | Linear search in list |
| `arr[a:b]` | O(k) | O(k) | Copies a slice of length $k$ |
| `sorted(arr)` | O(n log n) | O(n) | Returns a new sorted list |
| `dict[key]` lookup | O(1) average | O(1) | Worst case can degrade |
| `key in set_obj` | O(1) average | O(1) | Hash-based membership check |
| String concatenation in loop | Often O(n²) total | O(n) or more | Repeated copying can be expensive |

### Quick Interpretation Tips

- Lists are great for **append**, indexed access, and iteration
- Lists are poor for **front insertion** or **front deletion**
- Sets and dictionaries are excellent for fast membership and lookup on average
- Slicing looks compact, but it usually creates a copy
- Built-in sorting is usually much better than writing a naive quadratic sort

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
- **Use amortized analysis** when occasional expensive operations are spread across many cheap ones
- **Time vs Space** - often a trade-off
- **Choose the right complexity** for your use case

## Next Steps

- [Built-in Data Structures](02_builtin_structures.md)
- Practice analyzing code complexity
- Implement algorithms and verify complexity

---

[← Back to Main](../README.md) | [Next: Built-in Structures →](02_builtin_structures.md)
