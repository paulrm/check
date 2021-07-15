# # comment

.DEFAULT_GOAL := help
.PHONY: list help build clean


help:
	@echo "Makefile del check"
	@echo "    ejecutar make install-default"
	@echo "    o make list, para ver los targets"

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs


build:
	mkdir -p ./build/
	shellcheck check 				 > build/shellcheck-check.txt
	#shellcheck check tests/*.sh      > build/shellcheck.txt
	wc -l build/shellcheck.txt build/shellcheck-check.txt

clean:
	@echo "Making clean"
	rm -f ./check.d/*
	echo "#File to keep the execute" > ./check.d/README.txt

install-default: clean
	@echo "Making install-default"
	mkdir -p ./check.d/
	cp ./tests/dir-etc.sh                   ./check.d/
	cp ./tests/timezone-arg.sh              ./check.d/
	cp ./tests/package_.sh					./check.d/package_docker.sh
	cp ./tests/package_.sh					./check.d/package_git.sh
	cp ./tests/package_.sh					./check.d/package_speedtest.sh

install-cloud-workstation:
	cp ./tests/package_.sh				./check.d/package_azure-cli.sh
	cp ./tests/package_.sh				./check.d/package_terraform.sh
	cp ./tests/package_.sh				./check.d/package_google-cloud-sdk.sh

install-ubuntu-home: install-default install-cloud-workstation
	cp ./tests/package_.sh				./check.d/package_smplayer.sh
	cp ./tests/package_.sh				./check.d/package_deluge.sh


install-Others:
	cp ./tests/package_.sh					./check.d/package_jq.sh 
	cp ./tests/package_.sh					./check.d/package_speedtest.sh

install-phpDev:
	cp ./tests/package_.sh					./check.d/package_phpunit.sh
	cp ./tests/package_.sh 					./check.d/package_php-codesniffer.sh
	cp ./tests/package_.sh 					./check.d/package_phploc.sh
	cp ./tests/package_.sh 					./check.d/package_pdepend.sh
	cp ./tests/package_.sh 					./check.d/package_phpmd.sh
	cp ./tests/package_.sh 					./check.d/package_phpcpd.sh
	cp ./tests/package_.sh 					./check.d/package_phpdox.sh

hashbench:
	hashcat -m 0 -b --force

urano:
	cp ./tests/connect-to-mariadb.sh        ./check.d/
	cp ./tests/connect-to-ldap.sh           ./check.d/

traful-install:
	cp ./tests/connect-to-ldap.sh           ./check.d/
	cp ./tests/file-permisions*             ./check.d/

traful-check:
	MYSQL_PWD=t3stl1nk mysql -h 10.100.110.70 -u testlink -e '\h'  testlinkdb | grep "Synonym for"

home:
	@echo "Making home"
	cp ./tests/ping-google-dns.sh           ./check.d/
        
work:
	@echo "Making work"
	cp ./tests/postfix-bind-main-ip.sh      ./check.d/
	cp ./tests/postfix-relay.sh             ./check.d/


exec:
	./check --exec

