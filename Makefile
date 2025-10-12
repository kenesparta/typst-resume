generate-test:
	@typst compile main.typ main.pdf --font-path fonts

generate:
	@typst compile main.typ ken-esparta-cv-$$(date +%s%N | sha1sum | head -c 5).pdf --font-path fonts

clean:
	@rm -rf *.pdf
