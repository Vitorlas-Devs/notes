# Pseudocode

```
Function updateDisplay():
    1. Split input text into array of characters
    2. For each character (and its index) in the array:
        IF character is a space
            keep it as space
        ELSE IF this is first character (index = 0) OR previous character was space
            replace with 'B'
        ELSE IF previous character was 'B' OR space
            replace with 'a'
        ELSE IF previous character was 'a'
            replace with 'n'
        ELSE (previous character was 'n')
            replace with 'a'
    3. Join all characters back into a string
    4. Set textarea value to this new string
```

# Examples

- Input:  "hello"      -> Output: "Banan"
- Input:  "hi world"   -> Output: "Ba Banan"
- Input:  "a b c"      -> Output: "B B B"

# Rules

1. Every word starts with 'B'
2. After 'B' always comes 'a'
3. After 'a' always comes 'n'
4. After 'n' always comes 'a'
5. Spaces remain spaces
