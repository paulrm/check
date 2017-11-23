# # comment
# # (note: the <tab> in the command line is necessary for make to work) 
# target:  dependency1 dependency2 ...
#       <tab> command
clear-check:
	rm -f ./check.d/*

install-ubuntu:
	cp ./tests/ping-google-dns.sh ./check.d/
