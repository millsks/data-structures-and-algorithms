# Python Data Structures & Algorithms Guide

A comprehensive, educational resource for learning and mastering data structures and algorithms using Python. This repository includes detailed explanations, clean implementations, complexity analysis, and practical examples.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.13+](https://img.shields.io/badge/python-3.13+-blue.svg)](https://www.python.org/downloads/)

## 📚 What's Inside

- **Comprehensive Documentation**: Step-by-step guides for each topic
- **Clean Implementations**: Well-documented Python code for all major data structures and algorithms
- **Complexity Analysis**: Big O time and space complexity for every implementation
- **Practical Examples**: Real-world use cases and applications
- **Practice Problems**: LeetCode-style problems with solutions
- **Interview Preparation**: Common patterns and techniques
- **NumPy & Pandas**: Performance optimization techniques

## 🗂️ Repository Structure

```
├── docs/              # Detailed markdown guides for each topic
├── src/               # Source code implementations
│   ├── data_structures/
│   └── algorithms/
├── examples/          # Runnable examples
├── tests/             # Unit tests
├── practice_problems/ # Problem sets and projects
└── resources/         # Additional learning materials
```

## 🚀 Quick Start

### Prerequisites

- Python 3.13+
- [Pixi](https://pixi.sh) package manager (recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/python-dsa-guide.git
   cd python-dsa-guide
   ```

2. **Set up environment with Pixi**
   ```bash
   pixi init
   pixi add python=3.13
   pixi add numpy pandas pytest
   pixi shell
   ```

3. **Run examples**
   ```bash
   python examples/sorting_examples.py
   ```

4. **Run tests**
   ```bash
   pytest tests/
   ```

## 📖 Topics Covered

### Data Structures
- Arrays & Lists
- Stacks & Queues
- Linked Lists
- Trees (Binary, BST, AVL)
- Heaps & Priority Queues
- Hash Tables
- Graphs
- Tries
- Union-Find

### Algorithms

#### Sorting
- Bubble Sort, Selection Sort, Insertion Sort
- Merge Sort, Quick Sort, Heap Sort
- Counting Sort, Radix Sort

#### Searching
- Linear Search, Binary Search
- Jump Search, Interpolation Search

#### Graph Algorithms
- DFS & BFS
- Dijkstra's Algorithm
- Topological Sort
- Cycle Detection
- Minimum Spanning Tree (Kruskal's, Prim's)

#### Dynamic Programming
- Fibonacci, LCS, LIS
- Knapsack Problems
- Coin Change
- Edit Distance

#### Tree Algorithms
- Tree Traversals (Inorder, Preorder, Postorder, Level-order)
- Lowest Common Ancestor
- Path Sum Problems
- Tree Serialization

### Advanced Topics
- Complexity Analysis
- Recursion & Backtracking
- NumPy for Algorithm Optimization
- Pandas for Data Structures

## 📝 Learning Path

1. **Beginners**: Start with [Complexity Analysis](docs/01_complexity_analysis.md)
2. Work through [Built-in Data Structures](docs/02_builtin_structures.md)
3. Progress to [Advanced Data Structures](docs/03_advanced_structures.md)
4. Master [Sorting](docs/04_sorting.md) and [Searching](docs/05_searching.md)
5. Dive into [Dynamic Programming](docs/07_dynamic_programming.md)
6. Explore [Graph](docs/08_graph_algorithms.md) and [Tree](docs/09_tree_algorithms.md) algorithms
7. Optimize with [NumPy](docs/10_numpy_algorithms.md) and [Pandas](docs/11_pandas_structures.md)

## 🎯 Practice Problems

Check out the [practice_problems](practice_problems/) directory for:
- **Problem Sets**: Categorized by topic
- **Projects**: 5 hands-on projects to build
- **Solutions**: Detailed explanations

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting pull requests.

Ways to contribute:
- Add new algorithms or data structures
- Improve documentation
- Add test cases
- Fix bugs
- Suggest optimizations

## 📚 Resources

- [Book Recommendations](resources/book_recommendations.md)
- [Online Resources](resources/online_resources.md)
- [Interview Prep Guide](resources/interview_prep.md)
- [Study Plan](resources/study_plan.md)

## 🧪 Testing

All implementations include unit tests:

```bash
# Run all tests
pytest tests/

# Run specific test file
pytest tests/test_sorting.py

# Run with coverage
pytest --cov=src tests/
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by classic algorithms textbooks (CLRS, Sedgewick)
- Community contributions and feedback
- Open-source Python ecosystem

## ⭐ Star History

If you find this repository helpful, please consider giving it a star!

---

**Happy Learning!** 🚀

For questions or suggestions, please open an issue or reach out via discussions.
