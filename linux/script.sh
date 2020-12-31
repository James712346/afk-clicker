#!bin/sh

exitvar="" #Makes sure that the exitvar is empty

#Sets up flags with getopts, this includes -w windowtitle -k keyid {1|left, 2|middle, 3|right} and -t timeout
while getopts w:k:t: flag
do
    case "${flag}" in
        w) windowtitle=${OPTARG};;
        k) key=${OPTARG};;
        t) timeout=${OPTARG};;
    esac
done

win=$(xdotool search --onlyvisible -name $windowtitle | head -1) #get the windowid from the given -w argument

echo "Starting AutoClicker on windowid $win clicking mouse $key with a $timeout seconds delay" # explains what its doing
xdotool type "press enter to stop the script: " # Inputs some intrustions into the termal that is backlogs to the read command
while [ -z "$exitvar" ] # checks if the exitvar is empty
do
  read -t $timeout exitvar # reads the users input with a timeout
  xdotool click --window $win $key # sends click to the window specified in the users argument
done
echo "I have stop clicking ;)" # Prints a goodbye message
