PAGES = $(wildcard pages/*.md)

.PHONY: clean view

all: en/index.html

en/index.html: proc/people.md proc/publications.md $(PAGES)
	doxygen
	tools/post_process.sh

proc/people.md: pages/people.md
	tools/pre_process.sh people

proc/publications.md: pages/publications.md pages/publications.bib
	tools/pre_process.sh publications

clean:
	rm -rf en/*
	rm -rf proc/*
	ls images/K* | grep 'K[0-9]\{7\}[A-Z][0-9].jpg' | xargs rm -f

view:
	firefox en/index.html

