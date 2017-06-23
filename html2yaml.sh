#!/bin/sh

html2yaml() {
	html=$1

	if [ ! -e nwt1984yaml ]  # if not exist
	then
		mkdir nwt1984yaml
	fi

	scripture_name=$(echo ${html} | cut -d "/" -f 2)

	if [ ! -e nwt1984yaml/${scripture_name} ]
	then
		mkdir nwt1984yaml/${scripture_name}
	fi

	yaml_file_name=$(basename ${html} .html).yaml
	yaml=nwt1984yaml/${scripture_name}/${yaml_file_name}

	echo converting ${html} to ${yaml}

	./html2yaml.rb ${html} > ${yaml}
}

for x in $(find nwt1984html -type f)
do
	html2yaml ${x}
done
