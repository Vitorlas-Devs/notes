sum=0
while read line; do
    echo "Line: $line"
    sum=$((sum + line))
done < hf.txt

echo "Sum: $sum"
