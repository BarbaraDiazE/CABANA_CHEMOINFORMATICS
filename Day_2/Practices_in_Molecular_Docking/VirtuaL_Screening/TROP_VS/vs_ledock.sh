#!/bin/bash

for file in *.mol2 
do
	echo ./1 ./2 ./3 ./4 ./5 | xargs -n 1 cp "$file"
done 

for d in [0-9]
do 
	(cd "$d" && lepro_linux_x86  *.pdb -metal -p)
	(cd "$d" && ls *.mol2 > ligands.list)	
	(cd "$d" && sed -i 's/ligands/ligands.list/g' dock.in)
	(cd "$d" && ledock_linux_x86 dock.in)
	(cd "$d" && ../ledock_scores.sh)
done
