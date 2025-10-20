gen/local:
	@typst compile main.typ local.pdf --font-path fonts

gen/revision:
	@typst compile main.typ ken_esparta_cv_$$(date +%s%N | sha1sum | head -c 5).pdf --font-path fonts

gen/build:
	@typst compile main.typ ken_esparta_cv.pdf --font-path fonts

clean:
	@rm -rf *.pdf
