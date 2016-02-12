#!/bin/bash

installer="[INSTALLER:]"
clear
echo
echo  $installer "Do you have all of the REQUIRED required components installed?"
echo "==---------------------------------------------------------------------=="
echo "-Fully Installed and Updated XCode with optional command line tools via Apple (REQUIRED)"
echo "-git for mac platform (REQUIRED Enter Getgit to install)"
echo "-.bash_profile file (REQUIRED after instalation instrustions avaliable in source code)"
echo "==---------------------------------------------------------------------=="
echo $installer "yes or no?"
echo -n "[RESPONCE:] "
read answer
declare debugMode=0


# Inable Debuging mode
#---------------------------------------------------------------------------------------------------#
if [[ $answer == "test" ]]; then
        answer="yes"
        debugMode=1
        echo "DEBUG MODE ENABLED!" 
fi
#---------------------------------------------------------------------------------------------------#



# Install Stuff
#---------------------------------------------------------------------------------------------------#
if [ $answer ==  "yes" ]; then
        echo
        declare version

        if [[ $debugMode == 1 ]]; then
              echo "Please specify the version of ROOT you would like to install: "
                #echo "Please enter the version root you would like to install using the following syatax"
                #echo "vx-xx-xx replacing x with the correct numbers: "
                #read version

        elif [[ condition ]]; then
               version="v5-34-34"

        fi
        
        echo $installer "how many avaliable threads/cores would you like to allocate to this install?"
        echo $installer "[NOTE:] In general most Macs will have 4 usable threads"
        read cores


        # Downloads Root From GitHub using git command.
        git clone http://root.cern.ch/git/root.git

        # Config Stuff for git download and choosing version (set to v5.34.34).
        cd root
        git tag -l


        git checkout -b $version $version

        # Replaceed with line above to add version controll ability.
        #git checkout -b v5-34-34 v5-34-34

        # Runs .configure with mac os install peramiter.
        ./configure macosx64

        # Runs make command currently set to use 4 cores.
        make -j$cores

        # Links Source Files
        source bin/thisroot.sh

        echo $installer "Installation complete!"
        echo $installer "If you are on Mac OS X 10.11.1 \(El Capitan\) you must launch root and type in TPython::Prompt\(\) to be able to use pyROOT!"
        
        # check For bash_profile
        cd ~/

        if [ ! -f ~/.bash_profile ]; then
                echo $installer "bash profile not found!"
                echo $installer "You should make one with the following additions after instelation listed at the end of this scripts source code"
        else
                echo $installer "bash_profile found!"
                echo $installer "Please add the following lines to your bash_profile located at the end of this scripts source code"
        fi

        echo $installer "Remember to create or modify your .bash_profile if needed."
        echo $installer "If you run into any trouble try to run (source bin/thisroot.sh) as it sometimes dosent work in this script"
        echo
        exit
#---------------------------------------------------------------------------------------------------#


# Instructions for no answer
#---------------------------------------------------------------------------------------------------#
elif [ $answer == "no" ]; then
        echo $installer "Please install the necessary components then rerun this installer."
        echo
        exit
#---------------------------------------------------------------------------------------------------#        
elif [[ $answer == "Getgit" ]]; then
        echo $installer "Please go to the folowing link to download the git installer"
        echo $installer "http://git-scm.com/download/mac"
        echo $installer "Or if you have brew package manager use"
        echo $installer "brew install git"
        echo $installer "Please rerun the installer after installing git to continue instalation"
# Catch
#---------------------------------------------------------------------------------------------------#
else
        echo $installer "Unrecognised input prease rerun installer."
        
        echo
        exit
fi
#---------------------------------------------------------------------------------------------------#






# NOTE REPLACE HOMEFOLDERNAME with the name of your home folder.
# NOTE if line has a #= delete the #= but if it only has # then dont delete it. 

#Fixes python
#=export PATH="/usr/bin:$PATH"
# Adds path to root folder
#=export PATH="/Users/HOMEFOLDERNAME/root:$PATH"
# Fix to allow user to type in "root" to launch cern root
#=source /Users/HOMEFOLDERNAME/root/bin/thisroot.sh
#=export PYTHONDIR=/Library/Frameworks/EPD64.framework/Versions/Current
#=export ROOTSYS=/usr/local/root
#=export LD_LIBRARY_PATH=$ROOTSYS/lib:$PYTHONDIR/lib/:$LD_LIBRARY_PATH
#=export PATH=$ROOTSYS/bin:$PYTHONDIR/bin:$PATH
#=export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH








