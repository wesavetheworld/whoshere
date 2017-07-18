# vim: tabstop=8 noexpandtab

PEP8=pep8
#PEP8ARG=--ignore=E127,E265,E101,E128,E201,E202,E203,E211,E302,E303,W191,E501
# E203 space before ":"
# E201 whitespace after '('
# E202 whitespace before ')'
PEP8ARG=--ignore=E203,E201,E202
REPO=git@bitbucket.org:evilpete/scapy-watch.git
PROGS=
PLIB=
GIT=git

PEP8=pep8
PYLINT=pylint

FILES=whoshere/whoshere.py whoshere/whoshere_main.py whoshere/__init__.py \
        whoshere/utils.py whoshere/mtargets.py whoshere/webhandler.py whoshere-isy.py
BINFILES=
PYTHON=/usr/local/bin/python

# TS := $(shell /bin/date '+v0.1.%Y%m%d.%H')
TS := $(shell /bin/date '+v0.1.%Y%m%d')

all: syntax lint

syntax:
	for targ in ${FILES} ; do \
	    ${PYTHON} -m py_compile $$targ ; \
	done

style: pep8 lint


tag:
	@echo  "tag =" ${TS}
	git tag -f ${TS}
	echo "tag_version = '${TS}'" > version.py

pytag:
	git tag -f -a v$(python setup.py --version) -m 'dev version'

clean:
	rm -f *.pyc whoshere/*.pyc
	rm -rf dist
	rm -rf Build
	rm -rf whoshere.egg-info whoshere-0.1.*

lint:
	${PYTHON} -m py_compile whoshere.py
	${PYTHON} -m py_compile whoshere-isy.py
	${PYLINT} whoshere.py whoshere-isy.py

pep8:
	${PEP8} ${PEP8ARG} ${FILES}

install:
	python setup.py install --record files.txt

#setup:
#	mkdir -p /var/tmp/whoshere

dist: setup.py tag
	python setup.py sdist -k -v



# git commit --message "file GENERATED by distutils" MANIFEST
