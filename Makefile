PAGES = $(wildcard pages/*.md)

.PHONY: clean view all

all:
	tools/pre_process_dl.sh people
	make en/index.html

en/index.html: proc/people.md proc/publications.md $(PAGES)
	doxygen
	tools/post_process.sh

proc/people.md: pages/people.md
	cp layout/readmorestate.css en/readmorestate.css
	tools/pre_process.sh people

proc/publications.md: pages/publications.md pages/publications.bib
	tools/pre_process.sh publications

clean:
	rm -rf en/*
	rm -rf proc/*
	ls images/K* | grep 'K[0-9]\{7\}[A-Z][0-9].jpg' | xargs rm -f

view:
	firefox en/index.html

review1:
	touch pages/index.md
	make en/index.html
	firefox en/index.html

review2:
	touch pages/index.md
	make all
	firefox en/index.html
