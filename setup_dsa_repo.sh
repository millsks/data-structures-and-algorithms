#!/bin/bash

# Script to set up Python DSA Repository Structure
# Author: Generated for educational DSA repository
# Usage: ./setup_dsa_repo.sh

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Creating Python DSA structure in current directory...${NC}"
echo "================================================"

# Create main directories
echo -e "${GREEN}Creating directory structure...${NC}"
mkdir -p docs
mkdir -p src/{data_structures,algorithms/{sorting,searching,recursion,dynamic_programming,graph_algorithms,tree_algorithms,numpy_algorithms,pandas_structures},utils}
mkdir -p examples
mkdir -p tests
mkdir -p practice_problems/{problem_sets,projects/{01_collections_module,02_mini_database,03_graph_visualizer,04_performance_analyzer,05_lru_cache}}
mkdir -p resources
mkdir -p .github/ISSUE_TEMPLATE

# Create __init__.py files for Python packages
echo -e "${GREEN}Creating Python package files...${NC}"
touch src/__init__.py
touch src/data_structures/__init__.py
touch src/algorithms/__init__.py
touch src/algorithms/sorting/__init__.py
touch src/algorithms/searching/__init__.py
touch src/algorithms/recursion/__init__.py
touch src/algorithms/dynamic_programming/__init__.py
touch src/algorithms/graph_algorithms/__init__.py
touch src/algorithms/tree_algorithms/__init__.py
touch src/algorithms/numpy_algorithms/__init__.py
touch src/algorithms/pandas_structures/__init__.py
touch src/utils/__init__.py
touch tests/__init__.py

# Create data structure files
echo -e "${GREEN}Creating data structure files...${NC}"
touch src/data_structures/array.py
touch src/data_structures/stack.py
touch src/data_structures/queue.py
touch src/data_structures/linked_list.py
touch src/data_structures/tree.py
touch src/data_structures/binary_search_tree.py
touch src/data_structures/heap.py
touch src/data_structures/graph.py
touch src/data_structures/trie.py
touch src/data_structures/union_find.py

# Create sorting algorithm files
echo -e "${GREEN}Creating sorting algorithm files...${NC}"
touch src/algorithms/sorting/bubble_sort.py
touch src/algorithms/sorting/selection_sort.py
touch src/algorithms/sorting/insertion_sort.py
touch src/algorithms/sorting/merge_sort.py
touch src/algorithms/sorting/quick_sort.py
touch src/algorithms/sorting/heap_sort.py
touch src/algorithms/sorting/counting_sort.py

# Create searching algorithm files
echo -e "${GREEN}Creating searching algorithm files...${NC}"
touch src/algorithms/searching/linear_search.py
touch src/algorithms/searching/binary_search.py
touch src/algorithms/searching/jump_search.py
touch src/algorithms/searching/interpolation_search.py

# Create recursion files
echo -e "${GREEN}Creating recursion files...${NC}"
touch src/algorithms/recursion/factorial.py
touch src/algorithms/recursion/fibonacci.py
touch src/algorithms/recursion/permutations.py
touch src/algorithms/recursion/hanoi.py
touch src/algorithms/recursion/n_queens.py

# Create dynamic programming files
echo -e "${GREEN}Creating dynamic programming files...${NC}"
touch src/algorithms/dynamic_programming/fibonacci_dp.py
touch src/algorithms/dynamic_programming/lcs.py
touch src/algorithms/dynamic_programming/knapsack.py
touch src/algorithms/dynamic_programming/coin_change.py
touch src/algorithms/dynamic_programming/lis.py
touch src/algorithms/dynamic_programming/edit_distance.py

# Create graph algorithm files
echo -e "${GREEN}Creating graph algorithm files...${NC}"
touch src/algorithms/graph_algorithms/dfs.py
touch src/algorithms/graph_algorithms/bfs.py
touch src/algorithms/graph_algorithms/dijkstra.py
touch src/algorithms/graph_algorithms/topological_sort.py
touch src/algorithms/graph_algorithms/cycle_detection.py
touch src/algorithms/graph_algorithms/mst.py

# Create tree algorithm files
echo -e "${GREEN}Creating tree algorithm files...${NC}"
touch src/algorithms/tree_algorithms/traversals.py
touch src/algorithms/tree_algorithms/tree_problems.py
touch src/algorithms/tree_algorithms/path_sum.py

# Create numpy and pandas files
echo -e "${GREEN}Creating numpy and pandas files...${NC}"
touch src/algorithms/numpy_algorithms/array_operations.py
touch src/algorithms/numpy_algorithms/matrix_operations.py
touch src/algorithms/numpy_algorithms/optimization.py
touch src/algorithms/pandas_structures/series_dataframe.py
touch src/algorithms/pandas_structures/data_manipulation.py
touch src/algorithms/pandas_structures/time_series.py

# Create utility files
echo -e "${GREEN}Creating utility files...${NC}"
touch src/utils/complexity.py
touch src/utils/helpers.py

# Create example files
echo -e "${GREEN}Creating example files...${NC}"
touch examples/sorting_examples.py
touch examples/searching_examples.py
touch examples/recursion_examples.py
touch examples/dp_examples.py
touch examples/graph_examples.py
touch examples/tree_examples.py
touch examples/numpy_examples.py
touch examples/pandas_examples.py

# Create test files
echo -e "${GREEN}Creating test files...${NC}"
touch tests/test_data_structures.py
touch tests/test_sorting.py
touch tests/test_searching.py
touch tests/test_recursion.py
touch tests/test_graph.py
touch tests/test_tree.py
touch tests/test_algorithms.py

# Create practice problem files
echo -e "${GREEN}Creating practice problem files...${NC}"
touch practice_problems/problem_sets/arrays_and_strings.py
touch practice_problems/problem_sets/linked_lists.py
touch practice_problems/problem_sets/trees_and_graphs.py
touch practice_problems/problem_sets/sorting_searching.py
touch practice_problems/problem_sets/dynamic_programming.py
touch practice_problems/problem_sets/miscellaneous.py

# Create project README files
touch practice_problems/projects/01_collections_module/README.md
touch practice_problems/projects/01_collections_module/solution.py
touch practice_problems/projects/02_mini_database/README.md
touch practice_problems/projects/02_mini_database/solution.py
touch practice_problems/projects/03_graph_visualizer/README.md
touch practice_problems/projects/03_graph_visualizer/solution.py
touch practice_problems/projects/04_performance_analyzer/README.md
touch practice_problems/projects/04_performance_analyzer/solution.py
touch practice_problems/projects/05_lru_cache/README.md
touch practice_problems/projects/05_lru_cache/solution.py

echo -e "${BLUE}Directory structure created successfully!${NC}"
echo -e "${BLUE}Location: $(pwd)${NC}"
echo ""
echo "Next steps:"
echo "1. Initialize git (if needed): git init"
echo "2. Initialize pixi: pixi init"
echo "3. Add Python: pixi add python=3.13"
echo "4. Add dependencies: pixi add numpy pandas pytest"
echo ""
echo -e "${GREEN}Happy coding!${NC}"
