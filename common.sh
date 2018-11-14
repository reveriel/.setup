#!/bin/bash

# write bash :
# use function
# use local

function l_not() {
	$1
	local r=$?
	if [[ r -eq 0 ]]; then
		return 1
	else
		return 0
	fi
}

# 0 means success ! not 1 !
function version_gt() {
	test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1";
}
function version_lt() {
	test "$(printf '%s\n' "$@" | sort -V -r | head -n 1)" != "$1";
}
function version_eq() {
	test "$1" = "$2"
}

function version_ge() {
	l_not "version_lt $1 $2"
	# version_lt $1 $2
	# local r=$?
	# if [[ r -eq 0 ]]; then
	# 	return 1
	# else
	# 	return 0
	# fi
}
function version_le() {
	l_not "version_gt $1 $2"
}


function test_version_cmp() {
	local func=$1
	local arg1=$2
	local arg2=$3
	local expect=$4
	$func $arg1 $arg2
	local result=$?
	if [ $expect -eq $result ]; then
		echo pass
	else
		echo "=== Test failed ===="
		echo "expression      : " $func $arg1 $arg2
		echo "expectted result: " $expect
		echo "get             : " $result

	fi
}

function test_1() {
	# 0 means success ! not 1 !
	test_version_cmp version_gt 1.3  1.2   0
	test_version_cmp version_gt 1.3  1.4   1
	test_version_cmp version_gt 2    1     0
	test_version_cmp version_gt 1.3  1.3   1

	test_version_cmp version_gt 1.3  1.3     1
	test_version_cmp version_gt 1.4  1.2.1   0
	test_version_cmp version_gt 0.4.2  0.4.5  1

	test_version_cmp version_eq 1.3  1.3     0
	test_version_cmp version_eq 0    0       0
	test_version_cmp version_eq 3.3   0      1

	test_version_cmp version_ge 3.3   0      0
	test_version_cmp version_ge 3.3   3.3    0
	test_version_cmp version_ge 3.3   3.5    1

	test_version_cmp version_le 3.3   0      1
	test_version_cmp version_le 3.3   3.3    0
	test_version_cmp version_le 3.3   3.5    0
}

# if run directly
script_name=$( basename ${0#-}  )
this_script=$( basename ${BASH_SOURCE}  )
if [[ ${script_name} = ${this_script}  ]] ; then
	echo "start test"
	test_1
else
	echo "sourced from ${script_name}"
fi


