# More Linux commands

## Ln

Soft link, hard link, symbolic link

### Soft link

A soft link is a pointer to a file. It is a special file that contains the path to the target file. That is literally the content of the file.
It is like a shortcut in Windows. Soft links can be created to files and folders.

```bash
ln -s <target> <link>
```

Example:

This will create a soft link on the desktop to the Documents folder.

```bash
ln -s /home/user/Documents/ /home/user/Desktop/Documents
```

The content of the file will be `/home/user/Documents/`.

### Hard link

Same as the soft link, but it is not a special file. It is a file that contains the content of the target file.

```bash
ln <target> <link>
```

Example:

This will create a hard link on the desktop to the Documents folder.

```bash
ln /home/user/Documents/ /home/user/Desktop/Documents
```

The content of the file will be the content of the Documents folder.

## Find

Find files and folders by name, size, type, etc.

```bash
find <path> <options>
```

Options:

- Search by name: `-name "name"`
- Search by size: `-size +1M`
- Search by type: `-type f`
- Search by owner: `-user user`
- Search by group: `-group group`
- Search by permissions: `-perm 777`
- Don't follow symbolic links: `-P`
- Dollow symbolic links: `-L`
- Search only for files: `-type f`
- Search only for folders: `-type d`

Example:

Find all files in the current directory that are bigger than 1MB.

```bash
find . -size +1M
```

Find all files in the www folder that start with `index`.

```bash
find www -name "index*"
```

## Exec

Execute a command on the results of a find command.

```bash
find <path> <options> -exec <command> {} \;
```

Example:

Find all files in the current directory that are bigger than 1MB and delete them.

```bash
find . -size +1M -exec rm {} \;
```

Count all the characters in all the files that end with `.txt` in all the subfolders of the current directory.

```bash
find . -name "*.txt" -exec wc -c {} \;
```

The `{}` will be replaced with the path of the file.
The `\;` is needed to end the command.

## Wc

Count words, lines, characters in a file.

```bash
wc <file>
```

Options:

- Count words: `-w`
- Count lines: `-l`
- Count characters: `-c`

Example:

Count the words in the `index.html` file.

```bash
wc -w index.html
```

## Head, Tail, Grep, Cut

### Head

Print the first 10 lines of a file.

```bash
head <file>
```

Options:

- Print the first n lines: `-n n`
- Print the first n characters: `-c n`

Example:

Print the first 5 lines of the `index.html` file.

```bash
head -n 5 index.html
```

It can also be combined with `cat` to print the first 5 lines of the `index.html` file.

```bash
cat -n index.html | head -n 5
```

`-n 5` can be shortened to `-5`.

The difference is that `cat` will print the line numbers as well.

### Tail

Same as head, but it prints the last lines of a file.

```bash
tail <file>
```

Options:

- Print the last n lines: `-n n`
- Print the lines starting from the 5th line: `-n +5`
- Print the last n characters: `-c n`
- Follow the file changes: `-f`
- Follow the file by name: `-F`

Example:

Print the last 5 lines of the `index.html` file.

```bash
tail -n 5 index.html
```

It can also be combined with `cat`.

The `-f` option will print the last lines of the file as it is being written, and 'follow' the file changes.

```bash
tail -f index.html
```

### Who

Print the users that are logged in.

```bash
who
```

Options:

- Print the users that are logged in: `-u`
- Print the users that are logged in and the time they logged in: `-uH`
- Print the users that are logged in and the time they logged in and the IP address: `-uHm`

### Cut

Cut out parts of a file.

```bash
cut <file>
```

Options:

- Cut out the first n characters: `-c n`
- Cut out the first n characters and show the rest: `-c n-`
- Cut out the first n characters and show the last m characters: `-c n-m`
- Cut out the first n fields: `-f n`

Example:

Show the ip addresses of the users only.

```bash
who | cut -c 40-
```

Show the second field of a txt file (formatted like a csv file).

```bash
cat names.txt | cut -f 2 -d ";"
```

### Grep

Search for a pattern in a file.

```bash
grep <pattern> <file>
```

Options:

- Search for a pattern in a file: `<pattern> <file>`
- Search for a pattern in a file and print the line number: `-n <pattern> <file>`
- Search for a pattern in a file and print the line number and the file name: `-Hn <pattern> <file>`
- Search for a pattern in a file and print the line number and the file name and the surrounding lines: `-HnC 3 <pattern> <file>`
- Search for a pattern in a file and print the line number and the file name and the surrounding lines and highlight the pattern: `-HnC 3 --color <pattern> <file>`
- Ignore case: `-i <pattern> <file>`
- Use regular expressions: `-E <pattern> <file>`

Example:

Search for the name "Béla" in the `names.txt` file and print the line with number.

```bash
cat names.txt | grep -n "Béla"
```

<details open>
<summary><b>😎 Grep with RegExp</b></summary>
<br>

Match email addresses in the `names.txt` file.

```bash
cat names.txt | grep -E "[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,}"
```

Let's break down the regular expression:

- `[a-zA-Z0-9]+` matches **one or more** characters from a-z, A-Z, 0-9
- `@` matches the @ character literally
- `[a-zA-Z0-9]+` matches one or more characters from a-z, A-Z, 0-9
- `\.` matches the . character literally (case sensitive)
- `[a-zA-Z0-9]{2,}` matches **two or more** characters from a-z, A-Z, 0-9

Other useful RegExp:

Quantifiers:

- `*` matches the previous token between `zero` and `unlimited` times, as many times as possible, giving back as needed (greedy)
- `?` matches the previous token between `zero` and `one` times, as many times as possible, giving back as needed (greedy)
- `+` matches the previous token between `one` and `unlimited` times, as many times as possible, giving back as needed (greedy)
- `{n}` matches the previous token exactly `n` times
- `{n,}` matches the previous token at least `n` times
- `{n,m}` matches the previous token between `n` and `m` times

- `.` matches any character
- `^` matches the beginning of the line
- `$` matches the end of the line
- `|` matches either the preceding or the following character
- `()` groups characters together

</details>
