all:
	cp people.md people.markdown
	sed -i -r "s/(K[0-9]{7}[A-Z][0-9])/\n<\/td><\/tr><tr><td>\n![](images\/\1.jpg)\n<\/td><td>/g" people.markdown
	doxygen
	rm people.markdown

update:
	bash tools/update_people_images.sh

clean:
	rm -rf html/

