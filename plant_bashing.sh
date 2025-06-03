#!/bin/bash

title=Morpheus
weather=Rainy
plant_height=0
plant_leaves=0
day_count=5
is_active=true
first_time=true
growth_rate=0
winstorms_survived=0



default_names=(Morpheus Analiea Izzy)
i=0 #used to change array names when incrementing

weather_array=(Rainy Rainy Sunny Cloudy Overcast Windstorm Rainy Foggy)
w=0 #used to hold a random weather condition in the growth loop

#If growth happens:

    #Height increases by 1.5cm
    #Leaves increase by: 2 + (2.5 × current growth rate)

#Rainy — No growth; increase growth rate by 2
#Sunny — Growth occurs; increase growth rate by 3
#Cloudy — No growth
#Overcast — Growth occurs
#Windstorm — No growth; decrease growth rate by 2; lose 3 leaves
#Foggy — No growth; decrease growth rate by 1



	echo "Hey neighbor I'm Dave, Welcome to my lawn. What is your name?"
	read name
	sleep 2
	echo "Ok $name, do you want to help me grow a plant."
	echo "please type 'yes' or 'no'"
	read answer




while [[ $is_active == true ]]; do
	second_time_talk() {
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
	}


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
growth() {
	plant_height=$(echo "$plant_height + 1.5" | bc)
	plant_leaves=$(echo "$plant_leaves + 2 + 2.5 * $growth_rate" | bc)
}
	# TO DO: put a while loop here for controlling if the plant should grow or not grow
	# What is this section of code for?
	while (( $(echo "$plant_height < 35" | bc -l) )); do
		if [[ "$answer4" == "yes" || "$answer4" == "Yes" || -z "$answer4"]]; then 
			weather=$((RANDOM % ${#weather_array[@]}))
			w=${weather_array[$weather]}

			if [[ "$w" == "Rainy" ]]; then
				growth_rate=$(echo "$growth_rate + 2"| bc)
			fi

			if [[ "$w" == "Sunny" ]]; then
				growth
				growth_rate=$(echo "$growth_rate + 2"| bc)
			fi

			if [[ "$w" == "Overcast" ]]; then
				growth
			fi

			if [[ "$w" == "Windstorm" ]]; then
				growth_rate=$(echo "$growth_rate - 2"| bc)
				plant_leaves=$(echo "$plant_leaves - 3"| bc)
				((winstorms_survived += 1))
			fi

			if [[ "$w" == "Foggy" ]]; then
				growth_rate=$(echo "$growth_rate - 1"| bc)
			fi

			echo "Weather today: $w"
			#sleep 1
			echo "It's day "$day_count", $title is $plant_height cm tall, and has $plant_leaves leaves!"
			#sleep 1
			echo "So far you've survived $winstorms_survived windstorms."
			#sleep 1
			echo "Your current growth rate is $growth_rate."
			#sleep 1
			echo "Do you want to wait another day?"
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

	if [[ $(echo "$plant_height >= 35" | bc) == 1 ]]; then 
		echo "It's day $day_count."
		sleep 2
		echo "$title is now $plant_height cm high and has $plant_leaves leaves."
		sleep 2
		echo "$title has survived $winstorms_survived windstorms."
		sleep 1
		echo "I think I can take care of it from here neighbor."
		sleep 1
		echo "Thanks for the help, see you later!"
		sleep 1
		echo "Would you like to play again? (Yes/No)"
		read playanswer
		sleep 3

		if [[ "$playanswer" == "yes" || "$playanswer" == "Yes" ]]; then
			sleep 1
			echo "Reloading game..."
			plant_height=0
			plant_leaves=0
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