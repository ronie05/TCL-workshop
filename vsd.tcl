#!/bin/tcsh -f
echo " This is a TCL file created by sanjana "

set my_work_dir = `pwd`

if ($#argv != 1) then
	echo " Info: Please provide a csv file "
	exit 1
endif

if (! -f $argv[1] || $argv[1] == "-help")then
	if ($argv[1] != "-help")then
		echo "ERROR: Could not find the file $argv[1]. Exiting..."
		exit 1
	else
		echo "User Manual will be printed on how to use this tool"
		exit 1
	endif
else
	tclsh vsdsynth.tcl $argv[1]
endif


#! /bin/env tclsh

set generate_sdc 1
set enable_prelayout_timing 1
set working_dir [exec pwd]
set pan_array_length [llength [split [lindex $argv 0] .]]
set input [lindex [split [lindex $argv 0] .] $pan_array_length-1]

if {![regexp {^csv} $input] || $argc!=1 } {
puts "Error in usage"
puts "Usage: ./panda <.csv>"
puts "where <.csv> file has below inputs"
exit
} else {

        set filename [lindex $argv 0]
        package require csv
        package require struct::matrix
        struct::matrix m
        set f [open $filename]
        csv::read2matrix $f m , auto
        close $f
        set columns [m columns]
        m add columns $columns
        m link my_arr
        set num_of_rows [m rows]
        set i 0
        while {$i < $num_of_rows} {
                 puts "\nInfo: Setting $my_arr(0,$i) as '$my_arr(1,$i)'"
                 if {$i == 0} {
                         set [string map {" " ""} $my_arr(0,$i)] $my_arr(1,$i)
                 } else {
                         set [string map {" " ""} $my_arr(0,$i)] [file normalize $my_arr(1,$i)]
                 }
                  set i [expr {$i+1}]
        }
}

puts "\nInfo: Below are the list of initial variables and their values. User can use these variables for further debug. Use 'puts <variable name>' command to query value of below variables"
puts "DesignName = $DesignName"
puts "OutputDirectory = $OutputDirectory"
puts "NetlistDirectory = $NetlistDirectory"
puts "EarlyLibraryPath = $EarlyLibraryPath"

if {![file isdirectory $OutputDirectory]} {
        puts "\n Info: Couln't find output directory in the path $OutputDirectory. Creating it.."
        file mkdir $OutputDirectory
} else {
        puts "\n Found output directory in the path $OutputDirectory"
}

if {! [file exists $EarlyLibraryPath] } {
        puts "\nError: Cannot find early cell library in path $EarlyLibraryPath. Exiting... "
        exit
} else {
        puts "\nInfo: Early cell library found in path $EarlyLibraryPath"
}


if {! [file exists $LateLibraryPath]} {
        puts "\nError: Cannot find late cell library in path $LateLibraryPath. Exiting... "
        exit
} else {
        puts "\nInfo: Late cell library found in path $LateLibraryPath"
}

if {! [file isdirectory $NetlistDirectory]} {
        puts "\nError: Cannot find RTL netlist directory in path $NetlistDirectory. Exiting..."
        exit
} else {
        puts "\nInfo: RTL netlist directory found in path $NetlistDirectory"
}

if {! [file exists $ConstraintsFile] } {
        puts "\nError: Cannot find constraints file in path $ConstraintsFile. Exiting... "
        exit
} else {
        puts "\nInfo: Constraints file found in path $ConstraintsFile"
}


#Constraints file creation
#SDC format
puts "\nInfo: Dumping SDC constraints for $DesignName"
::struct::matrix constraints
set chan [open $ConstraintsFile]
csv::read2matrix $chan constraints , auto
close $chan
set number_of_rows [constraints rows]
puts "number_of_rows = $number_of_rows"

if {![file isdirectory $OutputDirectory]} {
        puts "\n Info: Couln't find output directory in the path $OutputDirectory. Creating it.."
        file mkdir $OutputDirectory
} else {
        puts "\n Found output directory in the path $OutputDirectory"
}

if {! [file exists $EarlyLibraryPath] } {
        puts "\nError: Cannot find early cell library in path $EarlyLibraryPath. Exiting... "
        exit
} else {
        puts "\nInfo: Early cell library found in path $EarlyLibraryPath"
}


if {! [file exists $LateLibraryPath]} {
        puts "\nError: Cannot find late cell library in path $LateLibraryPath. Exiting... "
        exit
} else {
        puts "\nInfo: Late cell library found in path $LateLibraryPath"
}

if {! [file isdirectory $NetlistDirectory]} {
        puts "\nError: Cannot find RTL netlist directory in path $NetlistDirectory. Exiting..."
        exit
} else {
        puts "\nInfo: RTL netlist directory found in path $NetlistDirectory"
}

if {! [file exists $ConstraintsFile] } {
        puts "\nError: Cannot find constraints file in path $ConstraintsFile. Exiting... "
        exit
} else {
        puts "\nInfo: Constraints file found in path $ConstraintsFile"
}


#Constraints file creation
#SDC format
puts "\nInfo: Dumping SDC constraints for $DesignName"
::struct::matrix constraints
set chan [open $ConstraintsFile]
csv::read2matrix $chan constraints , auto
close $chan
set number_of_rows [constraints rows]
puts "number_of_rows = $number_of_rows"

if {![file isdirectory $OutputDirectory]} {
        puts "\n Info: Couln't find output directory in the path $OutputDirectory. Creating it.."
        file mkdir $OutputDirectory
} else {
        puts "\n Found output directory in the path $OutputDirectory"
}

if {! [file exists $EarlyLibraryPath] } {
        puts "\nError: Cannot find early cell library in path $EarlyLibraryPath. Exiting... "
        exit
} else {
        puts "\nInfo: Early cell library found in path $EarlyLibraryPath"
}


if {! [file exists $LateLibraryPath]} {
        puts "\nError: Cannot find late cell library in path $LateLibraryPath. Exiting... "
        exit
} else {
        puts "\nInfo: Late cell library found in path $LateLibraryPath"
}

if {! [file isdirectory $NetlistDirectory]} {
        puts "\nError: Cannot find RTL netlist directory in path $NetlistDirectory. Exiting..."
        exit
} else {
        puts "\nInfo: RTL netlist directory found in path $NetlistDirectory"
}

if {! [file exists $ConstraintsFile] } {
        puts "\nError: Cannot find constraints file in path $ConstraintsFile. Exiting... "
        exit
} else {
        puts "\nInfo: Constraints file found in path $ConstraintsFile"
}


#Constraints file creation
#SDC format
puts "\nInfo: Dumping SDC constraints for $DesignName"
::struct::matrix constraints
set chan [open $ConstraintsFile]
csv::read2matrix $chan constraints , auto
close $chan
set number_of_rows [constraints rows]
puts "number_of_rows = $number_of_rows"
set clock_start [lindex [lindex [constraints search all CLOCKS] 0 ] 1]
puts "clock_start = $clock_start"
set clock_start_column [lindex [lindex [constraints search all CLOCKS] 0 ] 0]
puts "clock_start_column = $clock_start_column"

#set clock_period [constraints get cell [expr {$clock_start+1}] [expr {$clock_start_column+1}]]

#-----check row number for "inputs" section in constraints.csv---##
set input_ports_start [lindex [lindex [constraints search all INPUTS] 0 ] 1]
puts "input_ports_start = $input_ports_start"


#-----check row number for "outputs" section in constraints.csv---##
set output_ports_start [lindex [lindex [constraints search all OUTPUTS] 0 ] 1]
puts "output_ports_start = $output_ports_start"
set clock_early_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  early_rise_delay] 0 ] 0]

set clock_early_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  early_fall_delay] 0 ] 0]

set clock_late_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  late_rise_delay] 0 ] 0]

set clock_late_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  late_fall_delay] 0 ] 0]



set clock_early_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  early_rise_slew] 0 ] 0]

set clock_early_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  early_fall_slew] 0 ] 0]

set clock_late_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  late_rise_slew] 0 ] 0]

set clock_late_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$number_of_columns-1}] [expr {$input_ports_start-1}]  late_fall_slew] 0 ] 0]

set sdc_file [open $OutputDirectory/$DesignName.sdc "w"]
set i [expr {$clock_start+1}]
set end_of_ports [expr {$input_ports_start-1}]
puts "\nInfo-SDC: Working on clock constraints....."
while { $i < $end_of_ports } {
        puts -nonewline $sdc_file "\ncreate_clock -name [constraints get cell 0 $i] -period [constraints get cell 1 $i] -waveform \{0 [expr {[constraints get cell 1 $i]*[constraints get cell 2 $i]/100}]\} \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_transition -rise -min [constraints get cell $clock_early_rise_slew_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_transition -fall -min [constraints get cell $clock_early_fall_slew_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_transition -rise -max [constraints get cell $clock_late_rise_slew_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_transition -fall -max [constraints get cell $clock_late_fall_slew_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_delay  -min -rise [constraints get cell $clock_early_rise_delay_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_delay  -min -fall [constraints get cell $clock_early_fall_delay_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_delay  -max -rise [constraints get cell $clock_late_rise_delay_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        puts -nonewline $sdc_file "\nset_input_delay  -max -fall [constraints get cell $clock_late_fall_delay_start $i] -clock [constraints get cell 0 $i] \[get_ports [constraints get cell 0 $i]\]"
        set i [expr {$i+1}]
}

set input_early_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  early_rise_delay] 0 ] 0]
set input_early_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  early_fall_delay] 0 ] 0]
set input_late_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  late_rise_delay] 0 ] 0]
set input_late_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  late_fall_delay] 0 ] 0]

set input_early_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  early_rise_slew] 0 ] 0]
set input_early_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  early_fall_slew] 0 ] 0]
set input_late_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  late_rise_slew] 0 ] 0]
set input_late_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  late_fall_slew] 0 ] 0]
set related_clock [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$number_of_columns-1}] [expr {$output_ports_start-1}]  clocks] 0 ] 0]


set i [expr {$input_ports_start+1}]
set end_of_ports [expr {$output_ports_start-1}]
puts "\nInfo-SDC: Working on IO constraints....."
puts "\nInfo-SDC: Categorizing input ports as bits and bussed"

while { $i <  $end_of_ports } {
set netlist [glob -dir $NetlistDirectory *.v]
set tmp_file [open temp/x w]
foreach f $netlist {
        set fd [open $f]
        while {[gets $fd line] != -1} {
                set pattern1 " [constraints get cell 0 $i];"
                if {[regexp -all -- $pattern1 $line]} {
                        set pattern2 [lindex [split $line ";"] 0]
                        if {[regexp -all {input} [lindex [split $pattern2 "\S+"] 0]]} {
                        set s1 "[lindex [split $pattern2 "\S+"] 0] [lindex [split $pattern2 "\S+"] 1] [lindex [split $pattern2 "\S+"] 2]"
                        puts -nonewline $tmp_file "\n[regsub -all {\s+} $s1 " "]"

                        }
                }
        }
close $fd
}
close $tmp_file
set tmp_file [open temp/x r]
set tmp2_file [open ./temp/2 w]
puts -nonewline $tmp2_file "[join [lsort -unique [split [read $tmp_file] \n]] \n]"
close $tmp_file
close $tmp2_file
set tmp2_file [open ./temp/2]
set count [split [llength [read $tmp2_file]] " "]
 if {$count > 2} {
        set inp_ports [concat [constraints get cell 0 $i]*]

        } else {
        set inp_ports [constraints get cell 0 $i]

        }
        puts -nonewline $sdc_file "\nset_input_delay -clock  [constraints get cell $related_clock $i] -min -rise  [constraints get cell $input_early_rise_delay_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_delay -clock  [constraints get cell $related_clock $i] -min -fall  [constraints get cell $input_early_fall_delay_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_delay -clock  [constraints get cell $related_clock $i] -max -rise  [constraints get cell $input_late_rise_delay_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_delay -clock  [constraints get cell $related_clock $i] -max -fall  [constraints get cell $input_late_fall_delay_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_transition -clock  [constraints get cell $related_clock $i] -min -rise  [constraints get cell $input_early_rise_slew_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_transition -clock  [constraints get cell $related_clock $i] -min -fall  [constraints get cell $input_early_fall_slew_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_transition -clock  [constraints get cell $related_clock $i] -max -rise  [constraints get cell $input_late_rise_slew_start $i] \[get_ports $inp_ports\]"
        puts -nonewline $sdc_file "\nset_input_transition -clock  [constraints get cell $related_clock $i] -max -fall  [constraints get cell $input_late_fall_slew_start $i] \[get_ports $inp_ports\]"
         set i [expr {$i+1}]
}
close $tmp2_file
