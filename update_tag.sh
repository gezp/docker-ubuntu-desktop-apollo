#!/bin/bash
tags=(8.0-pnc)

for value in ${tags[@]}
do
    git tag $value -f
    git push origin $value -f
done

exit 0