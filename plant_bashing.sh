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
	echo "Alright, our seed has developed into a sapling!"
	sleep 2
	echo "From now on, your plant will grow taller and stronger, but it won't go through any new stages."
	sleep 4
	echo "Do you want to wait another day?"
	read answer4

elif [[ "$answer3" == "no" || "$answer3" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer4" == "yes" || "$answer4" == "Yes" ]]; then 
	sleep 2
	echo "It's day 7, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 2 cm high and has 2 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer5

elif [[ "$answer4" == "no" || "$answer4" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer5" == "yes" || "$answer5" == "Yes" ]]; then 
	sleep 2
	echo "It's day 8, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 4 cm high and has 4 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer6

elif [[ "$answer5" == "no" || "$answer5" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer6" == "yes" || "$answer6" == "Yes" ]]; then 
	sleep 2
	echo "Its day 9, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 6 cm high and has 6 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer7

elif [[ "$answer6" == "no" || "$answer6" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer7" == "yes" || "$answer7" == "Yes" ]]; then 
	sleep 2
	echo "It's day 10, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 8 cm high and has 8 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer8

elif [[ "$answer7" == "no" || "$answer7" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer8" == "yes" || "$answer8" == "Yes" ]]; then 
	sleep 2
	echo "It's day 11, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 10 cm high and has 10 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer9

elif [[ "$answer8" == "no" || "$answer8" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer9" == "yes" || "$answer9" == "Yes" ]]; then 
	sleep 2
	echo "It's day 12, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 12 cm high and has 12 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer10

elif [[ "$answer9" == "no" || "$answer9" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi

if [[ "$answer10" == "yes" || "$answer10" == "Yes" ]]; then 
	sleep 2
	echo "It's day 13, your plant has grown 2 cm higher and grown 2 more leaves!"
	sleep 2
	echo "Your plant is now 14 cm high and has 14 leaves."
	sleep 2
	echo "Do you want to wait another day?"
	read answer8

elif [[ "$answer7" == "no" || "$answer7" == "No" ]];then
	sleep 2
	echo "Alright, see you later neighbor!"
fi
else
	echo "Please try again, and only use 'yes' or 'no'"
fi