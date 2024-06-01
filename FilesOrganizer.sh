#!/usr/bin/bash

                ################################################### Oraginzing Files Part #############################################################
if [ -d "$1" ]; then
    for FILE in "$1"/*; do
        if [[ -d "$FILE" ]] ; then
        continue  
        fi

        declare extension=${FILE##*.}        
        if [[ $FILE =~ \.[^.]+ ]] && [[ "${extension}" != "unknown" ]]; then
            if [[ ! -d "$1/$extension" ]]; then
                mkdir "$1/$extension"
                mv "${FILE}" "$1/$extension"
            else
                mv "${FILE}" "$1/$extension"
            fi
        else
            if [[ ! -d "$1/misc" ]]; then
                mkdir "$1/misc"
                mv "${FILE}" "$1/misc"
            else
                mv "${FILE}" "$1/misc"
            fi
        fi

    done

                ################################################### Printing Directories #############################################################
    
    Filename=$(basename "$1")
    echo "${Filename}/"   
    for FILE in "$1"/*; do
        Filename=$(basename "$FILE")
        echo " |-- ${Filename}/"
        for iFILE in "$1/$Filename"/*; do
            Filename=$(basename "$iFILE")
            echo "      |-- ${Filename}"
        done    
    done

else
    echo "This Directory : '${1}' doesn't exist "
fi

