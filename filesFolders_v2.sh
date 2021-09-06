# takes the name of all the files and sends them to a dynamic vector, copies them and puts them in another folder

ls * # list all files in the folder

files=/home/user/Documents/Bash/* # add to variable the name of files

cont=0 # count the quantity of copied files
for i in $files  # while have files
do
	
	echo "file: "  $i 
	array[$cont]=$i
	cont=$((cont+1))
	
done

size=${#array[@]} # vector size with the name of each file

echo $size

echo  "itens:" ${array[0]} # print the vector items

if [ -d copied ] # tests if the copied directory already exists
then
	echo "directory already exists"
	existe=/home/user/Documents/Bash/copied/* # puts the path of the folder to be copied in a variable
	cont1=0
	for i in $existe
	do
        	echo "file: "  $i
	        array1[$cont]=$i
        	cont1=$((cont1+1))
	done
	if [ $cont1 -eq 0 ] # tests if the copied folder is empty
	then
		echo "Empty folder, files are being copied"
		for ((i=0; i<size; i++))
	        do
        	        file="${array[$i]}"
                	cp $file copied/ # copies the vector files and puts them in the copied folder
        	done
	else
		echo "Full folder"
	fi
else # directory is created if copied folder has not been created
	echo "The directory is being created, and the files copied"
	mkdir copied
	for ((i=0; i<size; i++))
	do
		file="${array[$i]}"
		cp $file copied/
	done
fi

echo $file
