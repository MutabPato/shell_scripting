#!/bin/bash

echo "What is your name?"
read name
if [ "$name" = "Patrick" ]; then
	echo "You're the boss!"
else
	echo "Welcome, $name."
fi
