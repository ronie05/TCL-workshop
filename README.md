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

