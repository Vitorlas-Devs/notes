# 5. gyak

## Advanced shell scripting

### Printing variables

We can print variables with the `echo` command and the `$` sign.
This is called variable substitution.

```sh
echo $0 # this is a parameter
echo $1 # this is the second parameter

echo $# # number of parameters
echo $* # all parameters
```

### Expr command

The `expr` command is used for evaluating expressions.
It can be used for arithmetic operations, string operations and logical operations.

```sh
echo $(expr 2 + 2)
echo $(expr 2 - 2)
echo $(expr 2 \* 2)
echo $(expr 2 / 2)
echo $(expr 2 % 2)
```

**Output:**

```sh
4
0
4
1
0
```

### Test command

The `test` command is used for evaluating expressions.
The difference between `test` and `expr` is that `test` is a built-in command, while `expr` is an external command.

```sh
test 2 -eq 2
test 2 -ne 2
test 2 -gt 2
test 2 -ge 2
test 2 -lt 2
test 2 -le 2
```

**Output:**

```sh
0
1
1
0
0
1
```

You can use `echo $?` to print the return value of the last command.

### If statement

The `if` statement is used for conditional execution.
It can be used with the `test` command.

```sh
if test 2 -eq 2
then
    echo "2 equals 2"
fi
```

**Output:**

```sh
2 equals 2
```

The statement can be put inside brackets.

```sh
if [ 2 -eq 2 ]; then
    echo "2 equals 2"
fi
```

### If-else statement

The `if-else` statement is used for conditional execution.

```sh
if test 2 -eq 2
then
    echo "2 equals 2"
else
    echo "2 does not equal 2"
fi
```

### If-elif-else statement

The `if-elif-else` statement is used for conditional execution.

```sh
if test 2 -eq 2
then
    echo "2 equals 2"
elif test 2 -ne 2
then
    echo "2 does not equal 2"
else
    echo "2 does not equal 2"
fi
```

### For loop

The `for` loop is used for iterating over a list of items.

```sh
for i in 1 2 3 4 5
do
    echo $i
done
```

**Output:**

```sh
1
2
3
4
5
```

### Switch statement

The `case` statement is used for conditional execution.

```sh
case $1 in
    1)
        echo "1"
        ;;
    2)
        echo "2"
        ;;
    3)
        echo "3"
        ;;
    *)
        echo "default"
        ;;
esac
```

### While loop

The `while` loop is used for iterating over a list of items.

```sh
i=0
while test $i -lt 5
do
    echo $i
    i=$(expr $i + 1)
done
```

### A simple program

Read a number from the user and print if it is even or odd.

```sh
#!/bin/sh

echo "Enter a number: "
read number

if test $(expr $number % 2) -eq 0
then
    echo "The number is even"
else
    echo "The number is odd"
fi
```

### Feladat 1

Olvass be egy nevet és egy életkort, írd ki a nevet és hogy 3 év múlva hány éves lesz.

```sh
#!/bin/sh

echo -n "Enter a name: "
read name

echo -n "Enter an age: "
read age

echo "BSc-t megkapja $name, amikor $((age + 3)) éves lesz."
```

The syntax `$((age + 3))` is called arithmetic expansion.
It is like `$(expr $age + 3)`, but that is called command substitution.

### Házi

Összegezd a számokat fájlból kiolvasva!

2
3
4
6
7
20
