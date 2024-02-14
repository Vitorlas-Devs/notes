# Commandos

## Ps command

This command is used to list the processes running on the system.

```bash
ps
```

Example output:

```bash
PID TTY          TIME CMD
11490 pts/17   00:00:00 bash
11500 pts/17   00:00:00 ps
```

**Options:**

- `a` - show processes for all users
- `u` - display the process's user/owner
- `x` - also show processes not attached to a terminal

The `-aux` option is the most common and can be used to list all processes running on the system.

```bash
ps -aux
```

Example output:

```bash
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0 168896  9760 ?        Ss   11:34   0:00 /sbin/init
root         2  0.0  0.0      0     0 ?        S    11:34   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        I<   11:34   0:00 [rcu_gp]
```

## Top command

This command is used to display all the running processes and their details.

```bash
top
```

Example output:

```bash
top - 11:37:01 up  1:03,  1 user,  load average: 0.00, 0.00, 0.00
Tasks:  97 total,   1 running,  96 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   1006.4 total,    100.1 free,    512.9 used,    393.4 buff/cache
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    358.9 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   11490 root      20   0  168896   9760   7168 S   0.0   0.9   0:00.02 bash
   11503 root      20   0   21504   3840   3200 R   0.0   0.4   0:00.00 top
```

**Options:**

- `c` - display the absolute path of the running process
- `d` - specify the delay between updates
- `n` - specify the number of processes to display
- `p` - sort the processes by CPU usage
- `u` - display the processes for the specified user
- `k` - kill a process

## Jobs, sleep, fg, bg

### Jobs

This command is used to display all the jobs running in the background.

```bash
jobs
```

Example output:

```bash
[1]+  Stopped                 sleep 100
```

### Sleep

This command is used to pause the execution of a command for a specified amount of time.

```bash
sleep 100
```

### fg

This command is used to bring a background process to the foreground.

```bash
fg %1
```

### bg

This command is used to run a stopped background process.

```bash
bg %1
```

### These commands can be combined

First, we start a process in the background:

```bash
sleep 100 &
```

Output:

```bash
[1] 11490
```

Then we can use the `jobs` command to see the process:

```bash
jobs
```

Output:

```bash
[1]+  Running                 sleep 100 &
```

We can use the `fg` command to bring the process to the foreground:

```bash
fg %1
```

Output:

```bash
sleep 100
```

*(sleep now blocks the terminal, we start a new sleep process in the background)*

We can use the `bg` command to run the process in the background:

```bash
bg %1
```

Output:

```bash
[1]+ sleep 100 &
```

## Kill command

This command is used to terminate a process.

```bash
kill 11490
```

**Options:**

- `9` - force kill
- `l` - list all signal names (this is used to specify the signal to send to the process)

## Pkill command

This command is used to terminate a process by its name.

```bash
pkill sleep
```

## Misc

### Sh files

Writing `#!/bin/bash` at the beginning of a file makes it executable.

```bash
touch ps.sh
```

```bash
chmod +x ps.sh
```

```bash
nano ps.sh
```

```bash
#!/bin/bash
ps -aux
```

We can run the file with the `./` command.

```bash
./ps.sh
```

Output: (it runs the `ps -aux` command)

Using the `source` command, we can run the file in the current shell.

```bash
source ps.sh
```

An abbreviated version of the `source` command is the `.` command.

```bash
. ps.sh
```

### Path

The `PATH` variable contains the directories in which the shell looks for commands.

```bash
echo $PATH
```

Output:

```bash
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

We can add a directory to the `PATH` variable.

```bash
export PATH=$PATH:/home/user/bin
```

## Creating variables

```bash
name="John"
```

```bash
echo $name
```

We can use the `export` command to make the variable available to child processes.

```bash
export name="John"
```

## Set command

This command is used to set shell options.

This makes the shell use the vi editor.

```bash
set -o vi
```

This creates a variable named `name` with the value `John`.

```bash
set name="John"
```

This removes the variable named `name`.

```bash
set -u name
```

## Read command

This command is used to read a line from the standard input.

```bash
read name
```

## Environment variables

```bash
echo $PATH
```

```bash
echo $HOME
```

**List environment variables:**

You can use the `env` command to list all environment variables.

```bash
env
```

<details open>
<summary>Getting an input from the user and printing it</summary>

```bash
echo -n "Enter your name: "
read name
echo "Your name is $name"
```

</details>

<details open>
<summary>Making the terminal colorful</summary>

```bash
echo "Hi"
#kinit io3o4s
#aklog
#cd
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W $ \[\033[00m\]"

PATH=$PATH:.
```
