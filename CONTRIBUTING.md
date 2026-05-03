# Contributing to Python DSA Guide

Thank you for considering contributing to this project! This is an educational repository aimed at helping people learn data structures and algorithms in Python.

## 🎯 How Can I Contribute?

### Reporting Bugs

- **Use the GitHub issue tracker** to report bugs
- **Describe the bug** with a clear title and description
- **Include code snippets** that reproduce the issue
- **Specify your environment** (Python version, OS, etc.)

### Suggesting Enhancements

- **Use the GitHub issue tracker** for feature requests
- **Explain why the enhancement would be useful**
- **Provide examples** of how it would work

### Adding New Content

We welcome contributions of:
- New algorithms or data structures
- Alternative implementations
- Performance optimizations
- Additional test cases
- Documentation improvements
- Practice problems
- Examples and use cases

## 📋 Pull Request Process

### 1. Fork and Clone

```bash
# Fork the repository on GitHub, then clone your fork
git clone https://github.com/YOUR_USERNAME/python-dsa-guide.git
cd python-dsa-guide

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL_OWNER/python-dsa-guide.git
```

### 2. Create a Branch

```bash
# Create a new branch for your feature
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/bug-description
```

### 3. Make Your Changes

Follow the coding standards (see below) and make your changes.

### 4. Test Your Changes

```bash
# Run tests
pytest tests/

# Run specific tests
pytest tests/test_your_feature.py

# Check code coverage
pytest --cov=src tests/
```

### 5. Commit Your Changes

```bash
# Stage your changes
git add .

# Commit with a clear message
git commit -m "Add: Description of what you added"

# Or
git commit -m "Fix: Description of what you fixed"
```

Follow these commit message conventions:
- `Add:` for new features
- `Fix:` for bug fixes
- `Update:` for updates to existing features
- `Docs:` for documentation changes
- `Test:` for adding or updating tests
- `Refactor:` for code refactoring

### 6. Push and Create Pull Request

```bash
# Push to your fork
git push origin feature/your-feature-name
```

Then create a pull request on GitHub with:
- Clear title and description
- Reference to any related issues
- Summary of changes made
- Any relevant test results

## 🎨 Coding Standards

### Python Style Guide

Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) with these specifics:

#### Code Style

```python
# Use descriptive variable names
def binary_search(arr, target):  # Good
    pass

def bs(a, t):  # Avoid
    pass

# Add docstrings to all functions
def bubble_sort(arr):
    """
    Sort array using bubble sort algorithm.
    
    Time Complexity: O(n²)
    Space Complexity: O(1)
    
    Args:
        arr (list): List to be sorted
        
    Returns:
        list: Sorted list
        
    Example:
        >>> bubble_sort([3, 1, 4, 1, 5])
        [1, 1, 3, 4, 5]
    """
    # Implementation here
    pass

# Use type hints where appropriate
def merge_sort(arr: list[int]) -> list[int]:
    pass
```

#### Documentation Requirements

Every algorithm/data structure should include:

1. **Docstring** with:
   - Brief description
   - Time complexity
   - Space complexity
   - Parameters
   - Return value
   - Example usage

2. **Comments** for complex logic

3. **Complexity Analysis** in markdown docs

#### File Structure

```python
"""
Module: sorting/merge_sort.py
Description: Implementation of merge sort algorithm
"""

def merge_sort(arr: list) -> list:
    """Implementation with docstring"""
    pass

def merge(left: list, right: list) -> list:
    """Helper function with docstring"""
    pass

# Example usage
if __name__ == "__main__":
    test_array = [64, 34, 25, 12, 22, 11, 90]
    print(f"Original: {test_array}")
    print(f"Sorted: {merge_sort(test_array)}")
```

### Test Requirements

Every new algorithm or data structure must include tests:

```python
"""tests/test_sorting.py"""
import pytest
from src.algorithms.sorting.merge_sort import merge_sort

def test_merge_sort_basic():
    """Test basic sorting functionality"""
    assert merge_sort([3, 1, 4, 1, 5]) == [1, 1, 3, 4, 5]

def test_merge_sort_empty():
    """Test empty array"""
    assert merge_sort([]) == []

def test_merge_sort_single():
    """Test single element"""
    assert merge_sort([1]) == [1]

def test_merge_sort_already_sorted():
    """Test already sorted array"""
    assert merge_sort([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]

def test_merge_sort_reverse():
    """Test reverse sorted array"""
    assert merge_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]
```

### Documentation Standards

#### Markdown Files

- Use clear headings (H1, H2, H3)
- Include code examples
- Add complexity analysis
- Provide visual diagrams when helpful
- Link to related topics

Example structure:
```markdown
# Algorithm Name

## Description
Brief explanation of what the algorithm does.

## Algorithm
Step-by-step description.

## Complexity Analysis
- **Time Complexity**: O(n log n)
- **Space Complexity**: O(n)

## Implementation

```python
# Code here
```

## Examples

## Use Cases

## Related Topics
```

## 🧪 Testing Guidelines

- Write tests for all new code
- Aim for >80% code coverage
- Test edge cases:
  - Empty inputs
  - Single elements
  - Large inputs
  - Invalid inputs
- Use descriptive test names
- Include both positive and negative tests

## 📝 Documentation Guidelines

### For Algorithms

Include:
1. Algorithm description
2. Pseudocode or steps
3. Python implementation
4. Complexity analysis
5. Visual examples
6. Common use cases
7. Variations

### For Data Structures

Include:
1. Structure description
2. Operations and their complexities
3. Implementation
4. Common use cases
5. Comparison with alternatives
6. Real-world applications

## ✅ Checklist Before Submitting PR

- [ ] Code follows PEP 8 style guidelines
- [ ] All functions have docstrings
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] Complexity analysis is provided
- [ ] Code is well-commented
- [ ] Examples are included
- [ ] Commit messages are clear
- [ ] PR description is complete

## 🔍 Review Process

1. **Automated checks** run on all PRs
2. **Code review** by maintainers
3. **Testing** verification
4. **Documentation** review
5. **Merge** once approved

## 💡 Tips for Good Contributions

- **Start small**: Fix typos, add tests, improve docs
- **Ask questions**: Use issues or discussions
- **Be patient**: Reviews take time
- **Be respectful**: Follow the code of conduct
- **Stay focused**: One feature per PR

## 📖 Resources for Contributors

- [Python Style Guide (PEP 8)](https://www.python.org/dev/peps/pep-0008/)
- [Writing Good Commit Messages](https://chris.beams.io/posts/git-commit/)
- [How to Write a Git Commit Message](https://cbea.ms/git-commit/)

## 🤔 Questions?

- Open an issue for general questions
- Use discussions for broader topics
- Tag maintainers if urgent

## 📄 Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/). By participating, you agree to uphold this code.

---

Thank you for contributing to making this a better learning resource for everyone! 🎉
