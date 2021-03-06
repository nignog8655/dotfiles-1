#!/usr/bin/env sh

containers_images_volumes=$(
	docker system df | grep 'TYPE\|Images\|Containers\|Local' | sed \
		-e 's/Local Volumes/Volumes/g' | tr -s ' ' | cut -f 1-4 -d\  | column -t
)

tput bold

# Display informations about containers, images and volumes

tput setaf 1
header=$(echo "${containers_images_volumes}" | head -1)
echo "$header"
tput sgr0
text=$(echo "${containers_images_volumes}" | tail -3)
echo "$text"
