#!/bin/bash

which wget > /dev/null 2>&1
if [[ $? == 0 ]]
then
    set -e
    wget https://raw.githubusercontent.com/Ronmi/test-vue-tsx/master/jsxdef.ts
    wget https://raw.githubusercontent.com/Ronmi/test-vue-tsx/master/jsx.ts
else
    which curl > /dev/null 2>&1
    if [[ $? == 0 ]]
    then
	set -e
	curl https://raw.githubusercontent.com/Ronmi/test-vue-tsx/master/jsxdef.ts > jsxdef.ts
	curl https://raw.githubusercontent.com/Ronmi/test-vue-tsx/master/jsx.ts > jsx.ts
    else
	echo "Please install wget or curl first!"
	exit 1
    fi
fi
