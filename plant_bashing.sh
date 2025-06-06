#!/bin/bash

title=Morpheus
weather=Rainy
plant_height=2
plant_leaves=2
day_count=5
is_active=true
first_time=true

default_names=(Morpheus Analiea Izzy)
i=0 #used to change array names when incrementing

weather_array=(Rainy Sunny Cloudy Overcast Windstorm Rainy Foggy)
w=0 #used to hold a random weather condition in the growth loop


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
		title=${default_names[$i]}
		((i++)) 
		sleep 1
		echo "Ok, I'll name it $title"
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

	if [[ $first_time == true ]]; then
		if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then 
			sleep 1
			echo "Alright just dig a good sized hole and plant this seed."
			sleep 1
			echo "Good work!"
			sleep 1
			echo "I know you've only just moved here but I'm sure you've realized time moves much faster here."
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
	fi	


	if [[ $first_time == false ]]; then
		if [[ "$answer2" == "yes" || "$answer2" == "Yes" ]]; then 
			sleep 1
			echo "Alright, $title has germinated overnight!"
			sleep 1
			echo "Germination is the 2nd stage of our plant."
			sleep 1
			echo "Do you want to wait 2 days?"
			read answer3
		elif [[ "$answer2" == "no" || "$answer2" == "No" ]]; then
			echo "Alright, see you later neighbor!"	
			exit
		else
			echo "Please try again, and only use 'yes' or 'no'"
			exit
		fi	
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
		elif [[ "$answer2" == "no" || "$answer2" == "No" ]]; then
			echo "Alright, see you later neighbor!"	
			exit
		else
			echo "Please try again, and only use 'yes' or 'no'"
			exit	
		fi

		if [[ "$plant_answer" == "yes" || "$plant_answer" == "Yes" ]]; then 
			sleep 1
			echo "What would you like to name your plant?"
			read title
			sleep 1
			echo "Ok, it's name is $title"
			sleep 1
			echo "Do you want to wait 2 days for $title to grow?"
			read answer3
		elif [[ "$plant_answer" == "no" || "$plant_answer" == "No" ]];then
			title=${default_names[$i]}
			((i++)) 
			sleep 1
			echo "Ok, I'll name it $title"
			sleep 1
			echo "Do you want to wait 2 days for $title to grow?"
			read answer3
		fi
	fi

	if [[ "$answer3" == "yes" || "$answer3" == "Yes" ]]; then 
		sleep 1
		echo "Alright, our seed has developed into a sapling!"
		sleep 1
		echo "From now on, $title will grow taller and stronger, but it won't go through any new stages."
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
	while [[ $day_count -lt 21 ]]; do
		if [[ "$answer4" == "yes" || "$answer4" == "Yes" ]]; then 
			weather=$((RANDOM % ${#weather_array[@]}))
			w=${weather_array[$weather]}
			echo "Weather today: $w"
			#sleep 1
			echo "It's day "$day_count", $title has grown 2 cm higher and grown 2 more leaves!"
			#sleep 1
			echo "$title is now "$plant_height" cm high and has "$plant_leaves" leaves."
			#sleep 1
			echo "Do you want to wait another day?"
			((plant_height += 2))
			((plant_leaves += 2))
			((day_count += 1))
			read answer4
		fi
		if [[ "$answer4" == "no" || "$answer4" == "No" ]];then
			sleep 1
			echo "Alright, see you later neighbor!"
			exit
		elif [[ "$answer4" == "yes" || "$answer4" == "Yes" ]];then
			echo "Alright"
		else
			echo "Please try again, and only use 'yes' or 'no'"
			exit
		fi
	done


	if [[ "$day_count" -ge 21 ]]; then 
		echo "It's day 21, $title has grown 2 cm higher and grown 2 more leaves!"
		sleep 2
		echo "Your plant is now 34 cm high and has 34 leaves."
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
			day_count=5
			sleep 2
			first_time=false
			is_active=true

		else
			sleep 1
			echo "Game closed"
			exit
		fi
	fi


	if [[ $i == "3" ]]; then
		(($i == 0))
	fi
done