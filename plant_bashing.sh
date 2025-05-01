#!/bin/bash

echo "Hey neighbor I'm Sam, Welcome to my lawn. What is your name?"

read name
sleep 1
echo "Ok $name, do you want to help me grow a plant.(yes/no)"

read answer
if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then 
	sleep 1
	echo "Alright, just dig a good sized hole with this trowel and plant this seed."
	sleep 2
	echo "Good work!"
else
	sleep 2
	echo "Alright, see you later neighbor!"
fi
