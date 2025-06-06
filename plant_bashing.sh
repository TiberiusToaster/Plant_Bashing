#!/bin/bash

title=Morpheus #Declaring the plant's name before further change
weather=Rainy #declaring the weather variable so it can be changed later
plant_height=0 #holds the plant's height
plant_leaves=0 #holds the plants number of leaves
day_count=5 #keeps record of the number of days that have passed
is_active=true #Can be used to close while loop. Haven't used yet but may be useful in the future 
first_time=true #locks of some if statements weather or not it is the user's first time playing
growth_rate=0 #holds the plants current growth rate
winstorms_survived=0 #holds how mnay windstorms the plant has survived



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


	#intro sequence
	echo "Hey neighbor I'm Dave, Welcome to my lawn. What is your name?" 
	#"echo" will read the follwing message in quotes and it will write it for the user to see
	read name
	#"read" will collect any data the user inputs to be used in a later variable 
	sleep 2 
	# "sleep" pauses anything from happening for the specified number of seconds
	echo "Ok $name, do you want to help me grow a plant."
	# name varible holds the player's name that they typed in
	echo "please type 'yes' or 'no'"
	read answer #holds response for another text interaction



#play again while loop
while [[ $is_active == true ]]; do
	#Dave explains how fast the time moves
	if [[ $first_time == true ]]; then #if its the player first time, statement happens
		if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then #if the answer variable from the first interaction is "yes" or "Yes" the statement below happens 
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
		elif [[ "$answer" == "no" || "$answer" == "No" ]];then #if the answer variable from the first interaction is "no" or "No" the statement below happens 
			sleep 1
			echo "Alright, see you later neighbor!"
			exit
			#"exit" stops running the game
		else #"else" means that if anything other than the specified values above were true, the stuff below happens
			echo "Please try again, and only use 'yes' or 'no'"
			exit
		fi
	fi	

	#text interaction that goes over germination
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

		#the user gets to name the plant when bash reads the user's "title" input
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
			title=${default_names[$i]} #chooses a name in the array based off of the value of "i"
			((i++)) # the i variable increases by one everytime the user chooses not to choose a name. This cycles through preset names for future playthroughs
			sleep 1
			echo "Ok, I'll name it $title"
			sleep 1
			echo "Do you want to wait 2 days for $title to grow?"
			read answer3
		fi
	fi

	#Growth happens based on instructions from ms6. These instruction can be found near the top of my script
	#The growth function is called whne specific weathers happen in growth_loop
	growth() {
		#using bc here so I can use decimal numbers 
		plant_height=$(echo "$plant_height + 1.5" | bc) #increase height by 1.5
		plant_leaves=$(echo "$plant_leaves + 2 + 2.5 * $growth_rate" | bc) #increase by 2 and 2.5 times the growth_rate
	}
	growth_loop() {
	while (( $(echo "$plant_height < 35" | bc -l) )); do
		echo "Do you want to wait another day?"
		read answer4
		if [[ "$answer4" == "yes" || "$answer4" == "Yes" || -z "$answer4" ]]; then 
			weather=$((RANDOM % ${#weather_array[@]})) #takes a random value from weather_array and assigns it to a variable
			w=${weather_array[$weather]}

			#assorted weathers 
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
			((day_count += 1))
		fi

		if [[ "$answer4" == "no" || "$answer4" == "No" ]];then
			sleep 1
			echo "Alright, see you later neighbor!"
			exit
		elif [[ "$answer4" == "yes" || "$answer4" == "Yes" || -z "$answer4" ]];then
			echo " "
		else
			echo "Please try again, and only use 'yes' or 'no'"
			exit
		fi

	done
	}
	#Dave says that the plant is a sapling now
	#this is below the growth loop so it can call growth_loop
	#when this was above it, the statement didn't think growth_loop existed yet
	if [[ "$answer3" == "yes" || "$answer3" == "Yes" ]]; then 
		sleep 1
		echo "Alright, our seed has developed into a sapling!"
		sleep 1
		echo "From now on, $title will grow taller and stronger, but it won't go through any new stages."
		sleep 1
		growth_loop
	elif [[ "$answer3" == "no" || "$answer3" == "No" ]];then
		sleep 1
		echo "Alright, see you later neighbor!"
		exit
	else
		echo "Please try again, and only use 'yes' or 'no'"
		exit
	fi

	#function is called on each play after first playthrough
	#gameplay is pretty much the same but naming is done near the start instead of after germination
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

	#This function was made becasue during the growth loop if the user keeps spamming enters when the final exchange happen, the game would break
	#If new lines were made while that statement was active, the "read playanswer" would overflow with inputs it didn't understand
	#Calling to this fucntion instead of having it bunched up gives the user more time to stop pressing enter and let the game play out
	play_again() {
	sleep 1
	echo "I think I can take care of it from here neighbor."
	sleep 1
	echo "Thanks for the help, see you later!"
	sleep 1
	echo "Would you like to play again? (Yes/No)"
	read playanswer
	sleep 3

	#The user has chosen to play again
	#variables are reset but first time is set to false
	#sleep timers are to make it seem like a bunch of loading is going on
	if [[ "$playanswer" == "yes" || "$playanswer" == "Yes" ]]; then
		sleep 1
		echo "Reloading game..."
		plant_height=0
		plant_leaves=0
		growth_rate=0
		winstorms_survived=0
		day_count=5
		sleep 2
		first_time=false
		is_active=true

	else
		sleep 1
		echo "Game closed"
		exit
	fi
	}

	#final exchange between Dave and the user 
	#the user chooses if they want to play again
	if [[ $(echo "$plant_height >= 35" | bc) == 1 ]]; then #if the plants height is equal to or above 35 (cm), the stuff below happens 
		echo "It's day $day_count."
		sleep 2
		echo "$title is now $plant_height cm high and has $plant_leaves leaves."
		sleep 2
		echo "$title has survived $winstorms_survived windstorms."
		play_again
	fi

	#if it is not the users first time playing, change some interactions
	if [[ $first_time == false ]]; then 
		second_time_talk
	fi	

	#reset the preset names loop if the final name has been said
	if [[ $i == "3" ]]; then #could change the limit to the length of the array instead of hardcoded "3" if number of preset names changes in future
		(($i == 0))
	fi
done