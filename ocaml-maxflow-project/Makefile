
build:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ftest.native

format:
	ocp-indent --inplace src/*

edit:
	code . -n

demo: build
	@echo "\n==== EXECUTING ====\n"
	./ftest.native graphs/graph1 0 5 outfile
	dot -Tsvg fichier.dot> some-output-file.svg
clean:
	-rm -rf _build/
	-rm ftest.native
