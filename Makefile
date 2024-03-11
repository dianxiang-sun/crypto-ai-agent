# Makefile for crypto-ai-agent

# Set the shell to bash in case some shell syntax is used.
SHELL := /bin/bash

# Define the python command and the package name
PYTHON := python3
PACKAGE := crypto-ai-agent
TWINE := twine

.PHONY: build install test refresh

# Build the package
build:
	$(PYTHON) setup.py sdist bdist_wheel

# Install the package locally
install: build
	pip install dist/crypto_ai_agent-0.0.7-py3-none-any.whl

# Uninstall the package
uninstall:
	pip uninstall -y $(PACKAGE)

# Refresh the package: uninstall, build, install
refresh: uninstall build install

# Run tests (optional, replace with your actual test command)
test: install
	$(PYTHON) -m unittest discover tests

# Publish the package to PyPI
publish: build
	$(TWINE) upload dist/*

# Help
help:
	@echo "Makefile commands:"
	@echo "make build - Build the package"
	@echo "make install - Install the package locally"
	@echo "make uninstall - Uninstall the package"
	@echo "make refresh - Rebuild and reinstall the package"
	@echo "make test - Run tests"
