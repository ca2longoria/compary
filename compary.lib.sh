
function complete_grab_op() {
	# Get the token before the current.
	local let X=($COMP_CWORD-1)
	local OP=${COMP_WORDS[$X]}
	# Run the grep if a list of options were provided.
	[ $# -gt 0 ] && {
		local GREP=`echo $@ | sed 's/\s\s*/|/g'`
		OP=`echo $OP | grep -P "^($GREP)\$" || echo ''`
	}
	echo $OP
}

