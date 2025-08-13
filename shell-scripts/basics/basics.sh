#!/bin/bash
# ==============================================
# Shell Script Basics - For Practice
# ==============================================

# 1. Variables
name="Abhinesh"
age=30
echo "Hello, my name is $name and I am $age years old."

# 2. Command substitution
current_date=$(date)
echo "Today's date is: $current_date"

# 3. If-else
if [ $age -ge 18 ]; then
    echo "You are an adult."
else
    echo "You are a minor."
fi

# 4. For loop
echo "Counting from 1 to 5:"
for i in {1..5}
do
    echo "Number: $i"
done

# 5. While loop
echo "While loop example (countdown from 3):"
count=3
while [ $count -gt 0 ]
do
    echo "Countdown: $count"
    ((count--))
done

# 6. Function
say_hello() {
    echo "Hello $1, welcome to shell scripting!"
}
say_hello "Abhinesh"

# 7. Reading input
read -p "Enter your favorite color: " color
echo "Your favorite color is $color."

# 8. Using arguments
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"

# 9. Exit status
ls /not_exist_folder 2>/dev/null
if [ $? -ne 0 ]; then
    echo "The previous command failed."
fi

# 10. Arrays
fruits=("apple" "banana" "mango")
echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"

echo "=== Script Completed ==="

