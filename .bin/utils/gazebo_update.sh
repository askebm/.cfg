#!/bin/sh 
AUR_DEP_CNT=0
AUR_DEP_CNT_PREV=0
AUR_DEPS[0]=${1:-"gazebo"}

contains() {
	for i in ${1}; do
		#echo "Comparing: ${i} = ${2}"
		if [ "${i}" = "${2}" ]; then
			#echo "is Match"
			return 1
		fi
	done
	return 0
}
getName(){
	NAME="$(pacman -Qi "${1}" 2>/dev/null | grep -E "^Name" | sed -E 's/.*:\s*//')"
}
isAur() {
	getName ${1}
	IS_AUR=$(pacaur --aur-info ${NAME} 2>/dev/null)
}
getAurDeps(){
	echo "Checking dependencies for: ${1}"
	local DEPS=$(pacman -Qi "${1}" | grep Depends | sed -E 's/.*:\ *(.*)/\1/' | sed -E 's/[>=]\S*//g')
	local OPT=$(pacaur -Qi "${1}" | grep -E "\[installed\]" | sed -E 's/.*\s(\S*):.*/\1/' | tr '\n' ' ')
	local DEPS="${DEPS} ${OPT}"
	#echo "DEPS: ${DEPS}"
	for LIB in ${DEPS}; do
		isAur "${LIB}"
		if [[ ${IS_AUR} ]]; then
			contains "${DEPS}" ${1}
			if [ $? -eq 0 ]; then
				AUR_DEP_CNT=$(( ${AUR_DEP_CNT} + 1 ))
				AUR_DEPS[${AUR_DEP_CNT}]="${LIB}"
			fi
		fi
	done
}

while true; do
	LIST=$(seq $AUR_DEP_CNT_PREV $AUR_DEP_CNT)
	AUR_DEP_CNT_PREV=$(( $AUR_DEP_CNT + 1))
	#echo ${LIST}
	if [ -z "${LIST}" ]; then
		break
	fi
	for j in ${LIST}; do
		getAurDeps ${AUR_DEPS[$j]}
		#echo "AUR DEPS: ${AUR_DEPS[*]}"
	done
done

while [ -1 -lt ${AUR_DEP_CNT} ]; do
	getName ${AUR_DEPS[$AUR_DEP_CNT]}
	PACKAGE=${NAME}
	#echo "PACKAGE: ${PACKAGE}"
	#echo "BUILD: ${BUILD}"
	contains "${BUILD}" "${PACKAGE}"
	if [ $? -eq 0 ]; then
		echo ">>Compile ${PACKAGE}"
		BUILD="${PACKAGE} ${BUILD}"
		echo "Removing cache for: ${PACKAGE}"
		rm -rf "${HOME}/.cache/pacaur/${PACKAGE}"
		pacaur -S --rebuild ${PACKAGE}
		if [ ! $? -eq 0 ]; then
			echo "Something went wrong"
			exit 1
		fi
	fi
	AUR_DEP_CNT=$(( ${AUR_DEP_CNT} - 1 ))
done
exit 0
