#! /bin/bash


add_book(){
	read -p "Enter book name to add:" newbook
	books[$i]=$newbook
	let i++
	echo "Book Added Successfully.."
}
delete_book(){
	read -p "Enter name of the book to delete:" book_to_delete
	available="no"
	for index in ${!books[@]}
	do
		if [ ${books[$index]} = $book_to_delete ];then
			available="yes"
			unset books[$index]
			echo "$book_to_delete Book Deleted Successfully"
			break
		fi
	done
	if [ $available = "no" ];then
		echo "$book_to_delete Book is not available, cannot be deleted"
	fi
}
list_books(){
	if [ ${#books[@]} -eq 0 ];then
		echo "No books are available"
		echo 
		return 1
	fi

	echo "List of All Available Books:"
	echo "-----------------------------------------------"

	for book in ${books[@]}
	do
		echo "$book"
	done
	echo
}

echo "Welcome to book management system"
echo "###################################################"

declare -a books
i=0
while [ true ]
do
	read -p "Which operation you want to perform [add|delete|list|exit]:" opt
	case $opt in
		add)
			add_book
			;;
		delete)
			delete_book
			;;
		list)
			list_books
			;;
		exit)
			echo "Thanks for using our application"
			exit 0
			;;
		*)
			echo "Wrong option,Try again"
	esac
done

