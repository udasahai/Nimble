#!/bin/bash

let errors=0


function cleanup {
	rm -rf temp_test*
	exit $1
}



echo 0 | ./nimble > /dev/null 
if [ $? -eq 0 ];
    then 
        echo "Prints correct number of stars for zero input..."
    else
	echo "FAILED test with input=0..." 	
	let errors+=1
fi



echo -2 | ./nimble > /dev/null
if [ $? -eq 0 ];
    then
        echo "Prints correct number of stars for negative input..."
    else
        echo "FAILED test with input=-2..."                        
        let errors+=1 
fi



echo 3 | ./nimble > /dev/null
if [ $? -eq 9 ];
    then
        echo "Prints correct number of stars for input=3 ..."
    else
        echo "FAILED test with input=3..."
        let errors+=1
fi



echo 3 | ./nimble > temp_test1.txt
diff temp_test1.txt test1.txt
if [ $? -eq 0 ];
    then
        echo "Output for input=3 matches expected output..."
    else
        echo "FAILED structure test with input=3..."
        let errors+=1
fi


echo 10 | ./nimble > temp_test2.txt
diff temp_test2.txt test2.txt
if [ $? -eq 0 ];
    then
        echo "Output for input=10 matches expected output..."
    else
        echo "FAILED structure test with input=10..."
        let errors+=1
fi


if [ $errors -eq 0 ]; then
	echo "Nimble... passes tests"
	cleanup 0
else
	echo "Nimble... fails tests with $errors errors!"
	echo
	echo
	cleanup 0
fi



exit 0
