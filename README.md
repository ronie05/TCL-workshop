# Documentation of VSD-TCL workshop 

Task: To write a TCL program which takes input date from an excel sheet and performs synthesis and STA analysis and displays the timing result as datasheet 

Day 1 

Three scenarios in shell script
* If the CSV file doesn't exist, the following code snippet will be executed
```
if ($#argv != 1) then
        echo "info: Please specify the .csv file "
        exit 1
endif
```

* If the file does not exist or -help command is given, the following code snippet will be executed
```
if (! -f $argv[1] || $argv[1] == "-help") then
        if ($argv[1] != "-help") then
                echo "Error, no files found, bye bye"
                exit 1
       else
               echo "USAGE: ./TCL <csv file> , where the <csv file> consists of 2 columns  -->  1st column is being case sensitive."
                echo "Note if the file is not in the same directory, ensure to include the path along with the <csv file>"
                echo
                echo "<Design Name> is the name of the top module"
                echo
                echo "<Output Directory> is the name of the output directory where you want to dump synthesis script, synthesized netlist and timing report"
                echo
                echo "<Netlist Directory> is the name of the directory where all RTL netlist are present"
                echo
                echo "<Early Library Path> is the file path of the early cell library to be used for STA"
                echo
                echo "<Late Library Path> is the file path of the late cell library to be used for STA"
                echo
                echo "<Constratints file> is the csv file path of constraints to be used for STA"
                echo
                exit 1
        endif
```
![Screenshot from 2023-06-16 19-36-50](https://github.com/ronie05/TCL-workshop/assets/111235153/c4fe17df-a16a-4f2f-9a10-99196245b304)

Day 2 

1. Removing spaces between the elements in csv file and autocreating the varialbles.
2. Converting the csv file into matrix format to access and perform various operations.
3. Computing number of rows. 

![Screenshot from 2023-06-19 23-15-40](https://github.com/ronie05/TCL-workshop/assets/111235153/24be36f7-ba3c-4665-83c8-86c7609acef4)


![Screenshot 2023-06-20 235545](https://github.com/ronie05/TCL-workshop/assets/111235153/3553243b-3d53-4b4a-857d-0f12b2b16640)

Day 3

1.Converting csv to sdc format
2.Accessing files and creating and comparing patterns 
3.Grepping the input ports and differentiating bits and busses amongst them.
4.



