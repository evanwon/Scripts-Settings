# place this file in the Windows Git installation directory /cmd folder
# be sure to add the ../cmd folder to the Path environment variable

# passing the following parameters to mergetool:
# local base remote merge_result

"C:/Program Files (x86)/SourceGear/DiffMerge/DiffMerge.exe" "$1" "$2" "$3" --result="$4" --title1="Mine" --title2="Merge" --title3="Theirs"