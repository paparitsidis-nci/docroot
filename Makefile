# Prerequisites
# pandoc
#
# sudo apt install pandoc
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
GENERATED=	intro.html second.html

all: $(GENERATED)

# Gerenate html, doc from the html
intro.html: intro.md
	pandoc -s -o ./dist/$@ $< --toc --metadata title="The European Digital Identity Wallet Reference Implementation" --metadata lang="en" --self-contained --css=styles/style.css -F node_modules/mermaid-filter/index.js
	node fix.js
	cd ./dist && cp output.html $@ && rm output.html

second.html: second.md
	pandoc -s -o ./dist/$@ $< --toc --metadata title="The European Digital Identity Wallet Reference Implementation" --metadata lang="en" --self-contained --css=styles/style.css -F node_modules/mermaid-filter/index.js
	node fix.js
	cd ./dist && cp output.html $@ && rm output.html

# Run a local http server
serve:
	npx http-server .

prepare:
	mkdir -p dist
	npm install --loglevel silly
	npm list
#	npm install --global 'mermaid-filter@~1.4'

clean:
	echo $(GENERATED)
	rm -f $(GENERATED) intro.html.docx
	rm -f ./dist -R