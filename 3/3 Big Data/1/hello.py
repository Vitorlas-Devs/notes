import re
from collections import defaultdict

def mapper(filename, line):
    if "elephant" in line.lower():
        yield filename, line.strip()

def reducer(key, values):
    for value in values:
        yield f"{key}: {value}"

def map_reduce(input_files):
    # Map phase
    intermediate = defaultdict(list)
    for filename in input_files:
        with open(filename, 'r') as file:
            for line in file:
                for key, value in mapper(filename, line):
                    intermediate[key].append(value)
    
    # Reduce phase
    results = []
    for key, values in intermediate.items():
        results.extend(reducer(key, values))
    
    return results

if __name__ == "__main__":
    input_files = ["input1.txt", "input2.txt", "input3.txt"]
    results = map_reduce(input_files)
    
    print("Grep results for 'elephant':")
    for result in results:
        print(result)
