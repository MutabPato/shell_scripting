# 🧠 OVERVIEW 

A one hour shell scripting refresher

(What is Shell Scripting?)

Shell scripting is writing a series of shell (Bash) commands in a file to automate tasks—like backups, server setups, data processing, etc.

# 🏗️ STRUCTURE OF A SHELL SCRIPT

Basic skeleton:

```
#!/bin/bash  # shebang tells the system this script runs with Bash

 # This is a comment

echo "Hello, world!" 
```

Save as `hello.sh`, make it executable: `chmod +x hello.sh`, then run: `./hello.sh`

# 🧰 PART 1: CORE CONCEPTS (20 MIN)

## 1.1 Variables

```
name="Patrick"
echo "Hello, $name"
```

No space around `=`

Use `"$var"` to avoid word splitting

## 1.2 Input and Output

```
echo "What is your name?"
read name
echo "Nice to meet you, $name!"
```

## 1.3 Conditionals (if, else, elif)

```
if [ "$name" = "Patrick" ]; then
  echo "You're the boss!"
else
  echo "Welcome, $name."
fi
```

Common test operators:

- `-f file.txt` → file exists

- `-d dir/` → directory exists

- `-z "$var"` → string is empty

- `"$a" = "$b"` → string equality

- `-eq`, `-lt`, `-gt` → numbers

## 1.4 Loops

```
for i in {1..5}; do
  echo "Number $i"
done

while [ "$i" -le 5 ]; do
  echo "Counting: $i"
  ((i++))
done
```

## 1.5 Functions

```
greet() {
  echo "Hi, $1!"
}

greet "Patrick"
```

# 🔧 PART 2: TOOLS & TRICKS (20 MIN)

## 2.1 Arguments to Scripts

```
#!/bin/bash
echo "Script name: $0"
echo "First arg: $1"
echo "All args: $@"
echo "Number of args: $#"
```

Run with: `./myscript.sh arg1 arg2`

## 2.2 Exit Codes and Error Handling

```
command_that_may_fail
if [ $? -ne 0 ]; then
  echo "Command failed!"
  exit 1
fi
```

OR better:
```
set -e  # Exit script if any command fails
```

## 2.3 Redirection

```
ls > output.txt        # stdout
ls notafile 2> err.txt # stderr
ls > out 2>&1          # all
```

## 2.4 Pipes & Command Substitution

```
ps aux | grep nginx

files=$(ls *.sh)
echo "Shell scripts: $files"
```

## 2.5 Cron Jobs (Automate Scripts)

Run every day at 7 AM:

```
crontab -e
0 7 * * * /home/user/backup.sh
```

# 🧪 PART 3: PRACTICE & MINI PROJECT (15 MIN)

Create a backup script:

```
#!/bin/bash
# backup.sh

src="/home/user/docs"
dest="/home/user/backup"
date=$(date +%Y-%m-%d)

mkdir -p "$dest"
cp -r "$src" "$dest/backup-$date"

echo "Backup complete: $dest/backup-$date"
```\

Make it executable: `chmod +x backup.sh`, run it, then add to cron.

# 🧹 BEST PRACTICES (5 MIN)

- Always use quotes around variables: `"$var"`

- Use `set -euo pipefail` at the top for safety:

```
set -euo pipefail
IFS=$'\n\t'
```

-Test scripts in a safe environment before running on production

- Use logging: `logger`, `echo`, or `tee`

# ✅ CHECKLIST: WHAT YOU NOW KNOW

✅ Variables
✅ Input/output
✅ Conditionals and loops
✅ Functions
✅ Script arguments
✅ Error handling and exit codes
✅ Redirection & piping
✅ Cron automation
✅ Writing and running scripts

# 📚 RECOMMENDED NEXT STEPS

- Read `man bash`

- Use [ShellCheck](https://www.shellcheck.net/) to lint your scripts

- Write daily-use scripts (e.g. update system, monitor disk usage)

- Learn about `getopts` for parsing flags