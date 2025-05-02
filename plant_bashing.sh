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
	echo "I know you've only just moved here but I'm sure you've realized time moves much faster here."
	sleep 3
	echo "Our days can take as long as your seconds or minutes."
	sleep 2
	echo "Do you want to wait 2 days?"
	read answer2
fi

elif [[ "$answer" == "no" || "$answer" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer2" == "yes" || "$answer2" == "Yes" ]]; then 
	sleep 3
	echo "Alright, our seed has germinated overnight!"
	sleep 2
	echo "Germination is the 2nd stage of our plant."
	sleep 2
	echo "Do you want to wait another 3 days?"
	read answer3

elif [[ "$answer2" == "no" || "$answer2" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer3" == "yes" || "$answer3" == "Yes" ]]; then 
	sleep 4
	echo "Alright, our seed has developed into a sapling."
	sleep 2
	echo "Germination is the 2nd stage of our plant."
	sleep 2
	echo "Do you want to wait another day?"
	read answer3

elif [[ "$answer3" == "no" || "$answer3" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi