
build:
	@echo "\n==== COMPILING ====\n"
	ocamlbuild ftest.native

format:
	ocp-indent --inplace src/*

edit:
	code . -n

demo: build
	@echo "\n==== EXECUTING ====\n"
	./ftest.native graphs/graph1 0 5 /home/slaoui/Bureau/projfonc/ocaml-maxflow-project/rfinal.dot
	dot -Tsvg rfinal.dot> some-output-file.svg
clean:
	-rm -rf _build/
	-rm ftest.native
