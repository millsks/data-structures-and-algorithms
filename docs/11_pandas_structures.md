# Pandas for Data Structures

Pandas provides high-level data structures for data manipulation.

## Series and DataFrames

```python
import pandas as pd

# Series
s = pd.Series([1, 2, 3, 4, 5], index=['a', 'b', 'c', 'd', 'e'])

# DataFrame
df = pd.DataFrame({
    'name': ['Alice', 'Bob', 'Charlie'],
    'age': [25, 30, 35],
    'city': ['NYC', 'LA', 'Chicago']
})
```

## Data Manipulation

```python
# Sorting
df_sorted = df.sort_values('age')

# Filtering
df_filtered = df[df['age'] > 28]

# Grouping
grouped = df.groupby('city')['age'].mean()

# Merging
df1 = pd.DataFrame({'key': ['A', 'B'], 'value1': [1, 2]})
df2 = pd.DataFrame({'key': ['A', 'B'], 'value2': [3, 4]})
merged = pd.merge(df1, df2, on='key')
```

## Time Series Operations

```python
# Create time series
dates = pd.date_range('2024-01-01', periods=100, freq='D')
ts = pd.Series(np.random.randn(100), index=dates)

# Rolling operations
rolling_mean = ts.rolling(window=7).mean()
```

---

[← Previous: NumPy](10_numpy_algorithms.md) | [Next: Resources →](RESOURCES.md)

[← Back to Main](../README.md)
