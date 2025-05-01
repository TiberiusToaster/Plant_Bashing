#!/bin/bash

echo "Hey neighbor I'm Joe, Welcome to my lawn. What is your name?"

read name
sleep 1
echo "Ok $name, do you want to help me grow a plant."
echo "please type 'yes' or 'no'"

read answer
if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then 
	sleep 1
	echo "Alright, just dig a good sized hole with this trowel and plant this seed."
	sleep 2
	echo "Good work!"
elif [[ "$answer" == "no" || "$answer" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
else
	echo "Please try again, and only use 'yes' or 'no'"
fi
