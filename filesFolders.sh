# Takes the name of all the files and sends it to a dynamic vector and then prints the name of the file

array=() # vector

# in the command /home/user/Downloads you can put the path of the folder you want
for filename in /home/user/Downloads*
do
	array+=${filename##*/} # add file name to vector
	
done # exit of loop

echo  ${array[@]} # prints the vector with filenames
