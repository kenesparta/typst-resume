gen-test:
	@typst compile main.typ main.pdf --font-path fonts

gen-release:
	@typst compile main.typ ken_esparta_cv_$$(date +%s%N | sha1sum | head -c 5).pdf --font-path fonts

clean:
	@rm -rf *.pdf
