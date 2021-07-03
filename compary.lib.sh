
function compare_grab_op() {
	local X
	local GREP=
	# Filter grep with args passed in as only available options.
	[ $# -gt 0 ] && \
		GREP=`echo $@ | sed 's/\s\s*/|/g'`
	# Get the token before the current.
	X=($COMP_CWORD-1)
	local OP=${COMP_WORDS[$X]}
	# Run the grep if a list of options were provided.
	[ ! -z "$GREP" ] && \
		OP=`echo $OP | grep -P "($GREP)" || echo ''`
	echo $OP
}

function _actual_func() {
	OP=`compare_grab_op`
	echo
	echo OP: $OP
}

complete -F _actual_func foop


