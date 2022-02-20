#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.


# Get the username (login).
read -p "please enter username : " username
# Get the real name (contents for the description field).
read -p "enter the comment : " comment
# Get the password.

# Create the account.
useradd -c $comment
# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn'e password.
if [[ $? -eq 0]]
then
echo "success!"
fi
# set password 

echo $password |passwd --stdin $username

# Check to see if the passwd command succeeded.
if [[ $? -eq 0]]
then
echo "success!"
fi
# Force password change on first login.
passwd -e $username
# Display the username, password, and the host where the user was created.
echo -e "Your username: $username
Your password: $password
Hostname : $HOSTNAME" 

