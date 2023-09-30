# Linux commands

## Basic

### Pwd

Print working directory.

```bash
pwd
```

Example output:

```bash
/home/username
```

### Kpasswd

Change password on kerberos, so not just on the local machine.

```bash
kpasswd
```

Example output:

```bash
Current Kerberos password:
New Kerberos password:
Retype new Kerberos password:
```

### Cd

Change directory.
Withouth any arguments it will change to the home directory, same as `cd ~`.

```bash
cd
```

You can also use `cd` with relative paths.

```bash
cd Documents
```

Or with absolute paths.

```bash
cd /home/username/Documents
```

### Mkdir

Make directory.

```bash
mkdir dir1
```

Make directory with parents.

```bash
mkdir -p dir1/dir2/dir3
```

### Rmdir

Remove directory. Only works if the directory is empty.

```bash
rmdir dir1
```

Remove directory with contents.

```bash
rm -rf dir1
```

### Cp

Copy files.

```bash
cp file1 file2
```

Copy directories.

```bash
cp -r dir1 dir2
```

### Mv

Move files.

```bash
mv file1 file2
```

### Cat

Print file contents.

```bash
cat file1
```

### Less

Print file contents, but with scrolling.

```bash
less file1
```

### More

Same as `less`, but older.

```bash
more file1
```

### Sort

Sort file contents.

```bash
sort file1
```

Sort only unique lines.

```bash
sort -u file1
```

## Perms

### Chown

Change owner of file.

```bash
chown user1 file1
```

Change owner and group of file.

```bash
chown user1:group1 file1
```

### Chmod

Change permissions of file.

```bash
chmod 777 file1
```

> **Note**
> The numbers are in octal, so 777 is 111 111 111 in binary, which means that all the permissions are set to true. The first 3 bits are for the owner, the second 3 bits are for the group, and the last 3 bits are for everyone else. The bits are for read, write, and execute permissions, in that order.

Add read permissions to file.

```bash
chmod +r file1
```

Remove read permissions from file.

```bash
chmod -r file1
```

Add read permissions to user to a file.

```bash
chmod u+r file1
```

Add write and execute permissions to group to a file.

```bash
chmod g+wx file1
```

List permissions of file.

```bash
ls -l file1
```
