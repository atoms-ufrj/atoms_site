all:
	tools/pre_process.sh pages/people.md > .people.md
	doxygen
	rm .people.md

update:
	bash tools/update_people_images.sh

clean:
	rm -rf html/

