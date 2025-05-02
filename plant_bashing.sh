#!/bin/bash

echo "Hey neighbor I'm Dave, Welcome to my lawn. What is your name?"

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
	sleep 1
	echo "This plant has been genetically engineered to grow much faster than other plants."
	sleep 3
	echo "This should take around 5 more seconds to grow, do you want to wait?"
	sleep 2
	read answer2

elif [[ "$answer" == "no" || "$answer" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then 
	sleep 1
	echo "Okay"
	sleep 5
	echo "Alright, our seed has germinated"
	
elif [[ "$answer" == "no" || "$answer" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi