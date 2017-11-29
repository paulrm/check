# # comment
# # (note: the <tab> in the command line is necessary for make to work) 
# target:  dependency1 dependency2 ...
#       <tab> command
clear-check:
	rm -f ./check.d/*

install-default:
	cp ./tests/ping-google-dns.sh           ./check.d/
	cp ./tests/dir-etc.sh                   ./check.d/
	cp ./tests/timezone-arg.sh              ./check.d/
