#!/bin/bash

#This is a launcher script for TMVA Scripts (TMVAClassification.py)

#Data Set Paths
###############

# Path to Background Data set
CRAZY_PATH='/mc12_8TeV.147912.Pythia8_AU2CT10_jetjet_JZ2W.merge.NTUP_COMMON.e1126_s1469_s1470_r6262_p1575_tid05435083_00'
BKG_PATH='/phys/groups/tev/scratch4/users/gwatts/GRIDDS'$CRAZY_PATH''$CRAZY_PATH''

# Path to Signal Data set
Signal_Path='/phys/groups/tev/scratch3/users/HV/WHHV/ntup_001'

# Path to Launch Script
Script_Path='/phys/users/tommeyer/Output/Output_1/'

echo "############################"
echo "Starting TMVA Classification"
echo "############################"
echo

# This script takes a sereies of terminal inputs to launch TMVAClassification.py
	# Comment out "<<<" to allow terminal to take user input.
	# Change TEST variables as desired.
	# Input file does not actually do anything at the moment
	# Inputs are tchains that are hardcoded in TMVAClassification.py

# argv commands found in TMVAClassification.py
# Methods, Input, Output, Verbose
echo "Input argv commands: m,i,o,v"

echo "Please enter the following information"
echo

# Default Variables
TEST_METHOD_INPUT="Cuts"
TEST_FILE_INPUT="NTUP_COMMON.05435083._000001.pool.root.1"
TEST_FILE_OUTPUT="TMVA_Cuts_NoPreCut_NoPreTransform"

########################
# User Input for Methods
echo "Methods (e.g Fisher,Likelihood):" # -m
read METHOD_IN <<< "$TEST_METHOD_INPUT"
echo

# User Input for ROOT File
echo "Input File:" # -i
read INPUT_FILE <<< "$TEST_FILE_INPUT"
echo

# User input for Output File Name
echo "Root File Name:" # -o
read OUTPUT_FILE <<< "$TEST_FILE_OUTPUT.root"
echo

echo "Methods to be run: $METHOD_IN"
echo "ROOT File to be read: $INPUT_FILE"
echo "Root File to be output: $OUTPUT_FILE"

#echo "Trees:" #-t
#read InTree <<< "physics,physics"
#echo "Trees to be read: $InTree"
echo
########################

echo "Beginning..."
echo

# Organizes and stores passed arguments for launch script
TMVA_Launch_ARGUMENTS="-m "$METHOD_IN", -i "$BKG_PATH$INPUT_FILE", -o "$OUTPUT_FILE""
TMVA_LAUNCH_SCRIPT=""$Script_Path"TMVAClassification.py "$TMVA_Launch_ARGUMENTS" -v"

# Print launch command
echo "$TMVA_LAUNCH_SCRIPT"
echo

# Log and launch script
echo "Please enter desired log file name:(Do not add .txt)"
Output_log="$OUTPUT_FILE"
python $TMVA_LAUNCH_SCRIPT >> $Output_log.txt
