#!/bin/bash -x
declare -A dictionary
read -p "Enter how many times you want to flip coin : " noOfFlips
headHeadCount=0
headTailCount=0
tailHeadCount=0
tailTailCount=0
for((i=0;i<$noOfFlips;i++))
do
        result=$((RANDOM%4))
        if [ $result = 0 ]
        then
                ((headHeadCount++))
                echo HEAD HEAD
        elif [ $result = 1 ]
        then
                ((headTailCount++))
                echo HEAD TAIL

        elif [ $result = 2]
        then
                ((tailHeadCount++))
                echo TAIL HEAD
        else
                ((tailTailCount++))
                echo TAIL TAIL
        fi
done
headHeadPercentage=`expr $headHeadCount/$noOfFlips | bc -l`
headTailPercentage=`expr $headTailCount/$noOfFlips | bc -l`
tailHeadPercentage=`expr $tailHeadCount/$noOfFlips | bc -l`
tailTailPercentage=`expr $tailTailCount/$noOfFlips | bc -l`
dictionary[HH]="$headHeadPercentage"
dictionary[HT]="$headTailPercentage"
dictionary[TH]="$tailHeadPercentage"
dictionary[TT]="$tailTailPercentage"
