#!/bin/bash

# Function to check password strength
check_password_strength() {
    local password=$1

    # Initialize strength score
    local score=0

    # Check for length (at least 8 characters)
    if [[ ${#password} -ge 8 ]]; then
        ((score++))
    fi

    # Check for at least one uppercase letter
    if [[ $password =~ [A-Z] ]]; then
        ((score++))
    fi

    # Check for at least one lowercase letter
    if [[ $password =~ [a-z] ]]; then
        ((score++))
    fi

    # Check for at least one number
    if [[ $password =~ [0-9] ]]; then
        ((score++))
    fi

    # Check for at least one special character
    if [[ $password =~ [\@\#\$\%\^\&\*\(\)\_\+\!\~] ]]; then
        ((score++))
    fi

    # Check the overall score
    case $score in
        5) echo "Password strength: Very Strong";;
        4) echo "Password strength: Strong";;
        3) echo "Password strength: Medium";;
        2) echo "Password strength: Weak";;
        *) echo "Password strength: Very Weak";;
    esac
}

# Prompt user for a password
read -s -p "Enter a password to check: " password
echo
check_password_strength "$password"
