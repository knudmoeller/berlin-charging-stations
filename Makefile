all: clean data

data: data/target/elektro-ladesäulen-berlin.csv

data/target/elektro-ladesäulen-berlin.csv: data/temp/elektro-ladesäulen_formatted.xml | data/target
	@echo "converting $< to CSV"
	@echo "writing to $@ ..."
	@ruby bin/gml2csv.rb $< $@

data/temp/elektro-ladesäulen_formatted.xml: data/temp/elektro-ladesäulen.xml | data/temp
	@echo "formatting $<"
	@echo "writing to $@ ..."
	@xmllint --format $< > $@

.PHONY: data/temp/elektro-ladesäulen.xml
data/temp/elektro-ladesäulen.xml: | data/temp
	@echo "downloading $@ from WFS service"
	@echo "writing to $@ ..."
	@curl -o $@ "https://energieatlas.berlin.de/public/ogcsl.ashx?nodeId=302&Service=WFS&request=GetFeature&typeNames=cls:L210"

clean: clean-temp

clean-temp:
	@echo "deleting temp folder ..."
	@rm -rf data/temp

data/target:
	@echo "creating $@ directory ..."
	@mkdir -p $@

data/temp:
	@echo "creating $@ directory ..."
	@mkdir -p $@

.PHONY: data/temp/date.txt
data/temp/date.txt: | data/temp
	@echo "write current date ..."
	@date "+Last changed: %Y-%m-%d" > $@

.PHONY: README.md
README.md: data/temp/date.txt
	@echo "update README.md with current date"
	@sed '$$ d' README.md > _README.md
	@cat _README.md $< > README.md
	@rm _README.md

