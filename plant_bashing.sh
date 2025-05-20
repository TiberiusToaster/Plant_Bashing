#!/bin/bash

title=Morpheus
plant_height=2
plant_leaves=2
day_count=5
is_active=true
first_time=true





echo "Hey neighbor I'm Dave, Welcome to my lawn. What is your name?"
read name
sleep 2
echo "Ok $name, do you want to help me grow a plant."
echo "please type 'yes' or 'no'"
read answer



while [[ $is_active == true ]]; do
	if [[ $first_time == false ]]; then
		echo "Hey again neighbor! Do you want to help me grow a plant?"
		echo "please type 'yes' or 'no'"
		read sanswer
	fi

	if [[ $first_time == false ]]; then
		if [[ "$sanswer" == "yes" || "$sanswer" == "Yes" ]]; then 
			sleep 1
			echo "Would you like to give your plant a name?"
			read plant_sanswer
		elif [[ "$sanswer" == "no" || "$sanswer" == "No" ]];then
			sleep 1
			echo "Alright, see you later neighbor!"
			exit
		else
			echo "Please try again, and only use 'yes' or 'no'"
			exit		
		fi
	fi	

	if [[ "$plant_sanswer" == "yes" || "$plant_sanswer" == "Yes" ]]; then 
		sleep 1
		echo "What would you like to name your plant?"
		read title
		sleep 1
		echo "Alright just dig a good sized hole for $title and plant this seed."
		sleep 1
		echo "Good work!"
		sleep 1
		echo "I know you've only just moved here but I'm sure you've realized time moves much faster here."
		sleep 2
		echo "Our days can take as long as your seconds or minutes."
		sleep 1
		echo "Do you want to wait 2 days?"
		read answer2
	elif [[ "$plant_sanswer" == "no" || "$plant_sanswer" == "No" ]];then
		sleep 1
		echo "Ok, I'll name it Morpheus"
		sleep 1
		echo "Alright just dig a good sized hole for $title and plant this seed."
		sleep 1
		echo "Good work!"
		sleep 1
		echo "I know you've only just moved here but I'm sure you've realized time moves much faster here."
		sleep 2
		echo "Our days can take as long as your seconds or minutes."
		sleep 1
		echo "Do you want to wait 2 days?"
		read answer2
	fi	


	if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then 
		sleep 1
		echo "Alright just dig a good sized hole and plant this seed."
		sleep 1
		echo "Good work!"
		sleep 1
		echo "I know you've only just moved here but I'm sure you've realized  time moves much faster here."
		sleep 1
		echo "Our days can take as long as your seconds or minutes."
		sleep 1
		echo "Do you want to wait 2 days?"
		read answer2
	elif [[ "$answer" == "no" || "$answer" == "No" ]];then
		sleep 1
		echo "Alright, see you later neighbor!"
		exit
	else
		echo "Please try again, and only use 'yes' or 'no'"
		exit
	fi


	if [[ $first_time == true ]]; then
		if [[ "$answer2" == "yes" || "$answer2" == "Yes" ]]; then 
			sleep 1
			echo "Alright, our seed has germinated overnight!"
			sleep 1
			echo "Germination is the 2nd stage of our plant."
			sleep 1
			echo "Would you like to name your plant?"
			read plant_answer
		fi

		if [[ "$plant_answer" == "yes" || "$plant_answer" == "Yes" ]]; then 
			sleep 1
			echo "What would you like to name your plant?"
			read title
			sleep 1
			echo "Alright just dig a good sized hole for $title and plant this seed."
			sleep 1
			echo "Good work!"
			sleep 1
			echo "I know you've only just moved here but I'm sure you've realized time moves much faster here."
			sleep 2
			echo "Our days can take as long as your seconds or minutes."
			sleep 1
			echo "Do you want to wait 2 days?"
			read answer3
		elif [[ "$plant_answer" == "no" || "$plant_answer" == "No" ]];then
			sleep 1
			echo "Ok, I'll name it Morpheus"
			sleep 1
			echo "Alright just dig a good sized hole for $title and plant this seed."
			sleep 1
			echo "Good work!"
			sleep 1
			echo "I know you've only just moved here but I'm sure you've realized time moves much faster here."
			sleep 2
			echo "Our days can take as long as your seconds or minutes."
			sleep 1
			echo "Do you want to wait 2 days?"
			read answer3
		fi
	fi

	if [[ "$answer3" == "yes" || "$answer3" == "Yes" ]]; then 
		sleep 1
		echo "Alright, our seed has developed into a sapling!"
		sleep 1
		echo "From now on, your plant will grow taller and stronger, but it won't go through any new stages."
		sleep 3
		echo "Do you want to wait another day?"
		read answer4
	elif [[ "$answer3" == "no" || "$answer3" == "No" ]];then
		sleep 1
		echo "Alright, see you later neighbor!"
		exit
	else
		echo "Please try again, and only use 'yes' or 'no'"
		exit
	fi

	# TO DO: put a while loop here for controlling if the plant should grow or not grow
	# What is this section of code for?
	while [[ "$answer4" == "yes" || "$answer4" == "Yes" ]]; do
		if [[ $day_count -lt 21 ]]; then 
			#sleep 1
			echo "It's day "$day_count", your plant has grown 2 cm higher and grown 2 more leaves!"
			#sleep 1
			echo "Your plant is now "$plant_height" cm high and has "$plant_leaves" leaves."
			#sleep 1
			echo "Do you want to wait another day?"
			((plant_height += 2))
			((plant_leaves += 2))
			((day_count += 1))
			read answer4

		elif [[ "$answer4" == "no" || "$answer4" == "No" ]];then
			sleep 1
			echo "Alright, see you later neighbor!"
			exit
		else
			echo "Please try again, and only use 'yes' or 'no'"
			exit
		fi
	done


	if [[ "$day_count" == 21 ]]; then 
		echo "It's day 21, your plant has grown 2 cm higher and grown 2 more leaves!"
		sleep 2
		echo "Your plant is now 30 cm high and has 30 leaves."
		sleep 2
		echo "I think I can take care of it from here neighbor."
		sleep 2
		echo "Thanks for the help, see you later!"
		sleep 1
		echo "Would you like to play again? (Yes/No)"
		read playanswer
		sleep 3

		if [[ "$playanswer" == "yes" || "$playanswer" == "Yes" ]]; then
			sleep 1
			echo "Reloading game..."
			plant_height=2
			plant_leaves=2
			day_count=7
			sleep 2
			is_active=true
			first_time=false

		else
			sleep 2
			echo "Game closed"
			exit
		fi
	fi
done