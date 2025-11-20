read -p "Enter Name:" user
if [ -z "$user" ]; then
        echo "user name canot empty"
fi

if [[ ! "$user" =~ ^[A-Za-z]+$ ]]; then
    echo "Invalid username! Only letters (A-Z, a-z) allowed."
    exit 1
fi

read -p "Enter Age:" age
if [ -z "$age" ]; then
        echo "age canot empty"
fi

if [[ ! "$age" =~ ^[0-9]+$ ]]; then
    echo "Invalid age! Only numbers allowed."
    exit 1
fi

echo "Validation successful!"
echo "Username: $user"
echo "Age: $age"
