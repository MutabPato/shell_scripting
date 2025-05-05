command_that_may_fail
if [ $? -ne 0 ]; then
	echo "Command failed!"
	exit 1
fi
