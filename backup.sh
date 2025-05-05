#!/bin/bash

src="/home/patrick/Documents"
dest="/home/patrick/backup"
date=$(date +%Y-%m-%d)

mkdir -p "$dest"
cp -r "$src" "$dest/backup-$date"

echo "Backup complete: $dest/backup-$date"
