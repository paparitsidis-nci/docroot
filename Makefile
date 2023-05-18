# Prerequisites
# pandoc
#
# sudo apt install pandoc
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
GENERATED=	intro.html \
			intro.docx



all: $(GENERATED)

# Gerenate html, doc from the html
intro.html: intro.md
	pandoc -s -o ./dist/$@ $< --toc --metadata title="The European Digital Identity Wallet Reference Implementation" --metadata lang="en" --self-contained --css=styles/style.css
	node fix.js
	cd ./dist && cp output.html $@ && rm output.html
	pandoc -o ./dist/$@.docx ./dist/$@ --reference-doc=styles/reference.docx

# Generate docx
intro.docx: intro.md
	pandoc -o ./dist/$@ $<

# Run a local http server
serve:
	npx http-server .

prepare:
	mkdir -p dist
	npm install

clean:
	echo $(GENERATED)
	rm -f $(GENERATED) intro.html.docx
	rm -f ./dist -R