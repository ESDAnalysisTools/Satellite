DirName=$(shell pwd)
Name=$(notdir $(DirName))

qresource:
	pyrcc4 qresource.qrc -o qresource.py

clean :
	find ./ -name "*.pyc" -exec rm -f {} \;
	find ./ -name "*~" -exec rm -f {} \;
	find ./ -name "*.pyo" -exec rm -f {} \;
	find ./ -name "*.bak" -exec rm -f {} \;
	rm -f MANIFEST
	rm -rf dist
	rm -rf build

install:
	python setup.py install --home=~

archive : clean
	cd ../ && tar -cjf $(Name).tar.bz2 $(Name)

archivegz : clean
	cd ../ && tar -czf $(Name).tar.gz $(Name)

zip_archive: clean
	cd ../ && zip -9 -r $(Name).zip $(Name) -x "$(Name)/.hg/*" "$(Name)/.hgignore" "$(Name)/.git/*" "$(Name)/.gitignore" "$(Name)/.hgtags"

sdist : clean
	python setup.py sdist
