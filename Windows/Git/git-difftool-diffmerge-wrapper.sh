# place this file in the Windows Git installation directory /cmd folder
# be sure to add the ../cmd folder to the Path environment variable

# diff is called by git with 7 parameters:
# path old-file old-hex old-mode new-file new-hex new-mode

"C:/Program Files/SourceGear/Common/DiffMerge/sgdm.exe" "$1" "$2" | cat