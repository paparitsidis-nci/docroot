# Prerequisites
# pandoc
#
# sudo apt install pandoc
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
GENERATED=	intro.html

all: $(GENERATED)

# Gerenate html, doc from the html
intro.html: intro.md
	pandoc -s -o ./dist/$@ $< --toc --metadata title="The European Digital Identity Wallet Reference Implementation" --metadata lang="en" --self-contained --css=styles/style.css -F mermaid-filter
	node fix.js
	cd ./dist && cp output.html $@ && rm output.html

# Run a local http server
serve:
	npx http-server .

prepare:
	mkdir -p dist
	npm install
	npm install --global '@mermaid-js/mermaid-cli@~10'
	npm install --global 'mermaid-filter@~1.4'

clean:
	echo $(GENERATED)
	rm -f $(GENERATED) intro.html.docx
	rm -f ./dist -R