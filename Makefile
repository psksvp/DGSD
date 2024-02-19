SOURCES=$(wildcard chapters/*.md)

outputDirs:
	mkdir -p ./output

epub: $(SOURCES) outputDirs
	pandoc --embed-resources \
           -t epub3 \
           --css=style.epub.css \
           --metadata title="Demi-Gods and Semi-Devils (天龍八部)" \
           --metadata author="Jin Yong" \
           --epub-cover-image=cover.jpeg\
           -o output/DGSD.epub README.md $(SOURCES)
           
html:  $(SRCS) outputDirs
	pandoc --embed-resources=true --standalone \
           -t html5 \
           --toc \
           --css=style.epub.css \
           --top-level-division=chapter \
           --metadata pagetitle="Demi-Gods and Semi-Devils (天龍八部) by Jin Yong" \
           -o output/DGSD.html README.md $(SOURCES)

clean: 
	rm -rf output