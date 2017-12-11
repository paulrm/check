# # comment
# # (note: the <tab> in the command line is necessary for make to work) 
# target:  dependency1 dependency2 ...
#       <tab> command

.DEFAULT_GOAL := help
.PHONY: list


help:
	@echo "Makefile del check"
	@echo "    ejecutar make install-default"
	@echo "    o make list, para ver los targets"

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs


clean:
	rm -f ./check.d/*
	echo "#File to keep the execute" > ./check.d/README.txt

install-default:
	mkdir -p ./check.d/
	cp ./tests/dir-etc.sh                   ./check.d/
	cp ./tests/timezone-arg.sh              ./check.d/
	cp ./tests/get-aws-r53-zones.sh         ./check.d/

home:
	cp ./tests/ping-google-dns.sh           ./check.d/
        
invap:
	cp ./tests/postfix-bind-main-ip.sh      ./check.d/
	cp ./tests/postfix-relay.sh             ./check.d/
