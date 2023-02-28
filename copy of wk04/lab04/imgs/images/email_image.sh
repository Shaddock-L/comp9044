#!/bin/dash
for file in "$@"
do
	display "$file" >/dev/null 2>&1 &
	echo "Address to e-mail this image to?"
	read email_address
	if test "$email_address"
	then
		echo "Message to accompany image?"
		read message
		echo "$message" | mutt -s 'email_image' -e 'set copy=no' -a "$file" -- "$email_address"
		
		echo ""$file" sent to "$email_address""
	else
		echo "No email sent"
		

	fi
done
