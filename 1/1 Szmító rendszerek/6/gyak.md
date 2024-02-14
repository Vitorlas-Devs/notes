# 6. gyak

## Welcome message when logging in

The `motd` file is located in `/etc/motd`.
It is displayed when logging in.

We want to greet the user with a different message depending on the time of the day.

### Create a script

Create a script called `motd.sh` in `/etc/profile.d/`:

```sh
sudo nano /etc/profile.d/motd.sh
```

But we don't have sudo so there is the `.profile` file in the root:

```sh
nano .profile
```

### Write the script

```sh
#!/bin/bash

hour=$(date +%H)

if test $hour -lt 12
then
    echo "Good morning!"
elif test $hour -lt 18
then
    echo "Good afternoon!"
else
    echo "Good evening!"
fi
```

<details open>
<summary><b>1. feladat: Téglalap</b></summary>

Get two parameters from the command line and print a rectangle with those dimensions.

### Example

```sh
./1.sh 3 5
```

**Output:**

```
+---+
+---+
+---+
```

</details>

## Boolean operators

### And `&&`

```sh
if [ $a -eq 1 ] && [ $b -eq 2 ]
then
    echo "a is 1 and b is 2"
fi
```

### Or `||`

```sh
if [ $a -eq 1 ] || [ $b -eq 2 ]
then
    echo "a is 1 or b is 2"
fi
```

### Not `!`

```sh
if ! [ $a -eq 1 ]
then
    echo "a is not 1"
fi
```

There is also the `-ne` operator which means "not equal".

```sh
if [ $a -ne 1 ]
then
    echo "a is not 1"
fi
```

## String operators

### Equal `=`

```sh
if [ $a = "hello" ]
then
    echo "a is hello"
fi
```

### Not equal `!=`

```sh
if [ $a != "hello" ]
then
    echo "a is not hello"
fi
```

### Empty `-z`

```sh
if [ -z $a ]
then
    echo "a is empty"
fi
```

### Not empty `-n`

```sh
if [ -n $a ]
then
    echo "a is not empty"
fi
```

## File operators

### Exists `-e`

```sh
if [ -e $a ]
then
    echo "a exists"
fi
```

### Directory `-d`

```sh
if [ -d $a ]
then
    echo "a is a directory"
fi
```

### File `-f`

```sh
if [ -f $a ]
then
    echo "a is a file"
fi
```

## Arithmetic operators

- `-eq` equal
- `-ne` not equal
- `-lt` less than
- `-le` less than or equal
- `-gt` greater than
- `-ge` greater than or equal

<details open>
<summary><b>2. feladat: Guessing game</b></summary>

Create a guessing game where the user has to guess a number between 1 and 100.

### Example

```sh
./2.sh
```

**Output:**

```
1. guess: 50
Too high!
2. guess: 25
Too low!
3. guess: 33
Correct!
```

</details>

HF: növel (minden futtatásnál +1 - et ír ki), rombusz (3-ra max 6 széles rombusz)
