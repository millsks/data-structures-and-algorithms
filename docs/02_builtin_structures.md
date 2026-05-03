# Built-in Data Structures

Python provides powerful built-in data structures that are optimized and ready to use.

## Lists

Dynamic arrays with O(1) append and O(n) insert/delete operations.

### Creating Lists

```python
# Various ways to create lists
numbers = [1, 2, 3, 4, 5]
mixed = [1, "hello", 3.14, True]
empty = []
range_list = list(range(10))

# List comprehension
squares = [x**2 for x in range(10)]
evens = [x for x in range(20) if x % 2 == 0]
```

### Common Operations

```python
# Adding elements
numbers.append(6)           # O(1) - Add to end
numbers.insert(0, 0)        # O(n) - Insert at position
numbers.extend([7, 8, 9])   # O(k) - Extend with another list

# Removing elements
numbers.pop()               # O(1) - Remove last
numbers.pop(0)              # O(n) - Remove at position
numbers.remove(3)           # O(n) - Remove first occurrence
numbers.clear()             # O(n) - Remove all

# Accessing elements
first = numbers[0]          # O(1) - Index access
last = numbers[-1]          # O(1) - Negative indexing

# Slicing
first_three = numbers[:3]   # O(k) where k is slice size
last_two = numbers[-2:]
reversed_list = numbers[::-1]
```

### List Methods

```python
numbers = [3, 1, 4, 1, 5, 9, 2, 6]

# Sorting and reversing
numbers.sort()              # O(n log n) - In-place sort
numbers.reverse()           # O(n) - In-place reverse

# Searching
index = numbers.index(4)    # O(n) - Find first occurrence
count = numbers.count(1)    # O(n) - Count occurrences

# Copying
shallow_copy = numbers.copy()
deep_copy = numbers[:]
```

## Tuples

Immutable sequences - once created, cannot be modified.

### Creating Tuples

```python
# Various ways to create tuples
point = (3, 4)
single = (1,)              # Note the comma!
empty = ()
tuple_from_list = tuple([1, 2, 3])

# Tuple packing/unpacking
coordinates = 10, 20       # Packing
x, y = coordinates         # Unpacking
```

### Named Tuples

```python
from collections import namedtuple

# Define a named tuple
Point = namedtuple('Point', ['x', 'y'])
Person = namedtuple('Person', ['name', 'age', 'city'])

# Create instances
p = Point(3, 4)
person = Person('Alice', 30, 'NYC')

# Access by name or index
print(p.x, p.y)            # 3 4
print(person.name)         # Alice
print(person[1])           # 30
```

## Sets

Unordered collections with unique elements. O(1) average case for add, remove, and lookup.

### Creating Sets

```python
# Various ways to create sets
numbers = {1, 2, 3, 4, 5}
empty_set = set()          # Note: {} creates an empty dict
set_from_list = set([1, 2, 2, 3, 3])  # Removes duplicates

# Set comprehension
squares = {x**2 for x in range(10)}
```

### Set Operations

```python
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

# Basic operations
a.add(5)                   # O(1) - Add element
a.remove(2)                # O(1) - Remove (raises KeyError if missing)
a.discard(10)              # O(1) - Remove (no error if missing)

# Set mathematics
union = a | b              # {1, 2, 3, 4, 5, 6}
intersection = a & b       # {3, 4}
difference = a - b         # {1, 2}
symmetric_diff = a ^ b     # {1, 2, 5, 6}

# Membership testing
print(3 in a)              # O(1) - Very fast!
```

## Dictionaries

Hash tables providing O(1) average case for insert, delete, and lookup.

### Creating Dictionaries

```python
# Various ways to create dictionaries
person = {"name": "Alice", "age": 30, "city": "NYC"}
empty_dict = {}
dict_from_pairs = dict([("a", 1), ("b", 2)])
dict_comprehension = {x: x**2 for x in range(10)}
```

### Dictionary Operations

```python
# Adding/updating
person["email"] = "alice@example.com"  # O(1)
person.update({"age": 31, "country": "USA"})

# Accessing
age = person["age"]                    # KeyError if missing
age = person.get("age", 0)             # Returns 0 if missing

# Removing
email = person.pop("email")            # Remove and return
person.popitem()                       # Remove arbitrary item
del person["city"]                     # Delete key
person.clear()                         # Remove all
```

### Dictionary Methods

```python
person = {"name": "Alice", "age": 30, "city": "NYC"}

# Keys, values, items
keys = person.keys()       # dict_keys view
values = person.values()   # dict_values view
items = person.items()     # dict_items view

# Iteration
for key in person:
    print(key, person[key])

for key, value in person.items():
    print(f"{key}: {value}")

# Merging dictionaries (Python 3.9+)
defaults = {"theme": "dark", "notifications": True}
settings = {"theme": "light"}
merged = defaults | settings  # {'theme': 'light', 'notifications': True}
```

## Collections Module

Python's `collections` module provides specialized container datatypes.

### defaultdict

```python
from collections import defaultdict

# Dictionary with default values
word_count = defaultdict(int)
for word in ["apple", "banana", "apple"]:
    word_count[word] += 1  # No KeyError!

# With list as default
graph = defaultdict(list)
graph[0].append(1)
graph[0].append(2)
```

### Counter

```python
from collections import Counter

# Count hashable objects
counts = Counter(["a", "b", "a", "c", "b", "a"])
print(counts)  # Counter({'a': 3, 'b': 2, 'c': 1})

# Most common elements
print(counts.most_common(2))  # [('a', 3), ('b', 2)]

# Arithmetic operations
c1 = Counter(['a', 'b', 'c'])
c2 = Counter(['a', 'b', 'd'])
print(c1 + c2)  # Counter({'a': 2, 'b': 2, 'c': 1, 'd': 1})
```

### deque (Double-Ended Queue)

```python
from collections import deque

# Create deque
dq = deque([1, 2, 3])

# O(1) operations on both ends
dq.append(4)        # Add to right
dq.appendleft(0)    # Add to left
dq.pop()            # Remove from right
dq.popleft()        # Remove from left

# Rotation
dq.rotate(1)        # Rotate right
dq.rotate(-1)       # Rotate left

# Use case: Circular buffer
recent_items = deque(maxlen=5)
for i in range(10):
    recent_items.append(i)  # Only keeps last 5
```

### OrderedDict

```python
from collections import OrderedDict

# Maintains insertion order (Python 3.7+ dicts do this too)
ordered = OrderedDict()
ordered['a'] = 1
ordered['b'] = 2
ordered['c'] = 3

# Move to end
ordered.move_to_end('a')  # Moves 'a' to the end
```

### ChainMap

```python
from collections import ChainMap

# Combine multiple dictionaries
defaults = {"color": "blue", "size": "medium"}
user_prefs = {"color": "red"}

settings = ChainMap(user_prefs, defaults)
print(settings["color"])  # "red" (from user_prefs)
print(settings["size"])   # "medium" (from defaults)
```

## String Operations

Strings are immutable sequences in Python.

### Common String Methods

```python
text = "Hello, World!"

# Case conversion
text.upper()           # "HELLO, WORLD!"
text.lower()           # "hello, world!"
text.capitalize()      # "Hello, world!"
text.title()           # "Hello, World!"

# Searching
text.find("World")     # 7 (index of first occurrence)
text.index("World")    # 7 (raises ValueError if not found)
text.count("l")        # 3

# Checking
text.startswith("Hello")  # True
text.endswith("!")        # True
text.isalpha()            # False (has punctuation)
text.isdigit()            # False

# Splitting and joining
words = text.split(", ")  # ["Hello", "World!"]
joined = "-".join(words)  # "Hello-World!"

# Stripping
spaced = "  hello  "
spaced.strip()         # "hello"
spaced.lstrip()        # "hello  "
spaced.rstrip()        # "  hello"
```

### String Formatting

```python
name = "Alice"
age = 30

# f-strings (Python 3.6+)
message = f"My name is {name} and I'm {age} years old"

# Format method
message = "My name is {} and I'm {} years old".format(name, age)
message = "My name is {0} and I'm {1} years old".format(name, age)
message = "My name is {name} and I'm {age} years old".format(name=name, age=age)

# Old style
message = "My name is %s and I'm %d years old" % (name, age)
```

## Performance Comparison

| Operation | List | Tuple | Set | Dict |
|-----------|------|-------|-----|------|
| Index access | O(1) | O(1) | N/A | N/A |
| Search | O(n) | O(n) | O(1)* | O(1)* |
| Append | O(1)* | N/A | O(1)* | O(1)* |
| Insert | O(n) | N/A | O(1)* | O(1)* |
| Delete | O(n) | N/A | O(1)* | O(1)* |
| Iteration | O(n) | O(n) | O(n) | O(n) |
| Memory | Less | Least | More | Most |

*Average case. Hash collisions can degrade to O(n).

## When to Use What?

### Use Lists when:
- You need ordered, mutable sequences
- You need to access elements by index
- You need to maintain duplicates

### Use Tuples when:
- You need immutable sequences
- You want to use as dictionary keys
- You want to guarantee data won't change

### Use Sets when:
- You need unique elements only
- You need fast membership testing
- You need set operations (union, intersection)

### Use Dictionaries when:
- You need key-value pairs
- You need fast lookups by key
- You need to associate data

## Practice Problems

1. Remove duplicates from a list using sets
2. Count word frequency using Counter
3. Implement LRU cache using OrderedDict
4. Merge two sorted lists
5. Find intersection of multiple lists using sets

---

[← Previous: Complexity Analysis](01_complexity_analysis.md) | [Next: Advanced Structures →](03_advanced_structures.md)

[← Back to Main](../README.md)
