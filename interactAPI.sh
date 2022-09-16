#!/bin/bash

function return_all_user() {
    curl 103.90.224.249:1234/users
}

function return_an_user() {
    read -p "Please enter username of the user that you want to find: " find_username
    curl 103.90.224.249:1234/user/$find_username
}

function add_a_new_user() {
    read -p "Please enter username: " new_username
    read -p "Please enter public key that your want to add: " new_public_keys
    if [ -z "$new_username" ] || [ -z "$new_public_keys" ]
    then
        echo "Either username or public key is empty!! Please try again!!"
        return
    fi
    curl -X POST 103.90.224.249:1234/create_user -H "Content-Type: application/json" -d "{\"Username\": \"$new_username\", \"Pub_key\": \"$new_public_keys\"}"
}

function sync_user_from_file() {
    #Upload file
    read -p "Please file path: " path_file
    if [ -z "$path_file" ]
    then
        echo "File path is empty!! Please try again!!"
        return
    fi
    curl -X POST 103.90.224.249:1234/upload_file --form "file=@\"$path_file\""
    curl 103.90.224.249:1234/user/test_getall
}

function modify_an_user() {
    read -p "Please enter username that you want to modify (can only modify public key): " modify_username
    read -p "Please enter public key: " modify_public_key
    if [ -z "$new_username" ] || [ -z "$modify_public_key" ]
    then
        echo "Either username or public key is empty!! Please try again!!"
        return
    fi
    curl -X PUT 103.90.224.249:1234/user/$modify_username -H "Content-Type: application/json" -d "{\"Username\": \"$modify_username\", \"Pub_key\": \"$modify_public_key\"}"

}

function delete_an_user() {
    read -p "Please enter username that you want to remove: " delete_username
    curl -X DELETE 103.90.224.249:1234/user/$delete_username
    rm -f /root/ssh-key/$delete_username
}

while true 
do
    echo
    echo "=================Switch management================="
    echo "1. Return all user are available" 
    echo "2. Return a specific user"
    echo "3. Add a new user"
    echo "4. Sync user from file"
    echo "4. Modify a public key of specific user" 
    echo "5. Delete a user" 
    echo "6. Exit"
    read -p "ENTER YOUR CHOICE: " user_choice

    case $user_choice in
        1) return_all_user;;
        2) return_an_user;;
        3) add_a_new_user;;
        4) sync_user_from_file;;
        5) modify_an_user;;
        6) delete_an_user;;
        *)
            if [ $user_choice -eq 6 ]
            then
                echo "EXISTING!!!!!!"
            else
                echo "This is wrong input, please try again!!!"
            fi
            ;;
    esac
    if [ $user_choice -eq 6 ]
    then
        break
    fi

done