PAGES = $(wildcard pages/*.md)

.PHONY: clean view all

#defaulg goal: downloads then builds
all:
	tools/pre_process_dl.sh people
	make en/index.html

#main build recipe:
#rebuilds if Makefile itself changed
#builds with doxygen, applies patches and post processings
en/index.html: proc/people.md proc/publications.md $(PAGES) Makefile layout/readmorestate.css
	doxygen
	cp layout/readmorestate.css en/readmorestate.css
	tools/post_process.sh

#module concernign preprocessing people
proc/people.md: pages/people.md en/readmorestate.css
	tools/pre_process.sh people

#module concernign preprocessing publications
proc/publications.md: pages/publications.md pages/publications.bib
	tools/pre_process.sh publications

clean:
	rm -rf en/*
	rm -rf proc/*
	ls images/K* | grep 'K[0-9]\{7\}[A-Z][0-9].jpg' | xargs rm -f

#simply opens the site in firefox
view:
	firefox en/index.html

#rebuilds site with cached pictures
review1:
	touch pages/index.md
	make en/index.html
	firefox en/index.html

#redownloads pictures and rebuilds site
review2:
	touch pages/index.md
	make all
	firefox en/index.html
