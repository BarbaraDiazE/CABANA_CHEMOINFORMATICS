#!/bin/bash

for  filename  in  ./*.dok; do 
		base=${filename%.dok};
		grep -n "kcal" "$base.dok" > "$base.txt";
done 
