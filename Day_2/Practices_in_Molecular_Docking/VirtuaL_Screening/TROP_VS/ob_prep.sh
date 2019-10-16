#!/bin/bash

for file in ./lig?.mol2 
do	
	obminimize -ff MMFF94 $file 
done
