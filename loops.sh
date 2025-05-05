for i in {1..5}; do
	echo "Number $i"
done

while [ "$i" -le 5 ]; do
	echo "Counting: $i"
	((i++))
done
