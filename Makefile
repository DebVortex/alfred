BUILDDIR ?= _build
ENV ?= dev
SPHINXOPTS =


.PHONY: help clean clean-build clean-dev clean-docs clean-pyc clean-test codeship coverage \
	coverage-html develop dist docs isort open-docs serve-docs test test-all

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  clean                    to remove all build, test, coverage and Python artifacts"
	@echo "  clean-build              to remove build artifacts"
	@echo "  clean-dev                to remove development artifacts"
	@echo "  clean-docs               to remove documentation artifacts"
	@echo "  clean-pyc                to remove Python file artifacts"
	@echo "  clean-test               to remove test and coverage artifacts"
	@echo "  codeship                 to set up Codeship CI"
	@echo "  coverage                 to generate a coverage report with the default Python"
	@echo "  coverage-html            to generate and open a HTML coverage report with the default Python"
	@echo "  develop                  to install (or update) all packages required for development"
	@echo "  dist                     to package a release"
	@echo "  docs                     to build the project documentation as HTML"
	@echo "  isort                    to run isort on the whole project"
	@echo "  open-docs                to open the project documentation in the default browser"
	@echo "  serve-docs               to serve the project documentation in the default browser"
	@echo "  test                     to run unit tests quickly with the default Python"
	@echo "  test-all                 to run unit tests on every Python version with tox"


clean: clean-build clean-dev clean-docs clean-pyc clean-test

clean-build:
	python setup.py clean -a
	rm -fr dist/
	rm -fr *.egg-info

clean-dev:
	find . -name '.DS_Store' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '*.orig' -exec rm -f {} +

clean-docs:
	$(MAKE) -C docs clean BUILDDIR=$(BUILDDIR)

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -fr .cache/
	rm -fr .tox/
	coverage erase
	rm -fr htmlcov/

codeship:
	rm -rf $${HOME}/.virtualenv
	virtualenv -p $$(which python3.4) "$${HOME}/.virtualenv"
	pip install -U pip setuptools wheel
	pip install codecov==1.6.3 tox==2.3.1

coverage:
	coverage run -m pytest $(TEST_ARGS) tests/
	coverage report

coverage-html: coverage
	coverage html
	python -c "import os, webbrowser; webbrowser.open('file://{}/htmlcov/index.html'.format(os.getcwd()))"

develop:
	pip install -U pip setuptools wheel
	pip install -U -e .
	pip install -U -e .[develop,test,docs]

dist: clean
	python setup.py sdist bdist_wheel
	ls -l dist

docs:
	$(MAKE) -C docs html BUILDDIR=$(BUILDDIR) SPHINXOPTS='$(SPHINXOPTS)'

isort:
	isort --recursive setup.py alfred/ tests/

open-docs:
	python -c "import os, webbrowser; webbrowser.open('file://{}/docs/{}/html/index.html'.format(os.getcwd(), '$(BUILDDIR)'))"

serve-docs:
	python -c "import webbrowser; webbrowser.open('http://127.0.0.1:$(PORT)')"
	cd docs/$(BUILDDIR)/html; python -m SimpleHTTPServer $(PORT)

test:
	py.test $(TEST_ARGS) tests/

test-all:
	tox
