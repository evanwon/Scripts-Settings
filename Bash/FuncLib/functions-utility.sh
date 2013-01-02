ismac() {
	unamestr=`uname`

	if [[ $unamestr == "Darwin" ]]; then
		return 1
	else
   		return 0	
	fi
}

# Toggles display of hidden files in Mac Finder...
function finder-toggle-hidden-files {
	defaultShowFiles="YES"
	
	defaults write com.apple.Finder AppleShowAllFiles "${1:-$defaultShowFiles}"
	killall Finder
}
