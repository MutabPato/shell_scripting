#!/bin/bash
ls > output.txt		# stdout
ls notafile 2> err.txt  # stderr
ls > out 2>&1
