.PHONY: qa test

qa: test

test:
	python -m unittest discover -s tests -v
