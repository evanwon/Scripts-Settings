function host-os {
	local unamestr=`uname`

	if [[ $unamestr == "Darwin" ]]; then
		echo "mac"
	else
   		echo "linux"	
	fi
}

# Toggles display of hidden files in Mac Finder...
function finder-toggle-hidden-files {
	defaultShowFiles="YES"
	
	defaults write com.apple.Finder AppleShowAllFiles "${1:-$defaultShowFiles}"
	killall Finder
}
