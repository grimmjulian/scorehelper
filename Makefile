# Makefile for an R package using renv (no devtools)

# Package name
PACKAGE_NAME := scorehelper
# Path to the package source
PKG_PATH := .

# Default target
all: build

# --------------------
# 1. Restore package dependencies with renv
# --------------------
deps:
	@echo "Restoring R environment with renv..."
	Rscript -e "if (file.exists('renv.lock')) renv::restore(prompt = FALSE) else cat('No renv.lock found\n')"

# --------------------
# 2. Build the package tar.gz
# --------------------
build: deps
	@echo "Building package..."
	R CMD build $(PKG_PATH)

# --------------------
# 3. Check the package
# --------------------
check: build
	@echo "Checking package..."
	R CMD check $(PACKAGE_NAME)_*.tar.gz

# --------------------
# 4. Install the package locally
# --------------------
install: build
	@echo "Installing package..."
	R CMD INSTALL $(PACKAGE_NAME)_*.tar.gz

# --------------------
# 5. Clean build artifacts
# --------------------
clean:
	@echo "Cleaning..."
	rm -rf *.tar.gz *.Rcheck

# --------------------
# 6. Test (if using testthat)
# --------------------
test: deps
	@echo "Running tests..."
	Rscript -e "if (requireNamespace('testthat', quietly=TRUE)) testthat::test_dir('tests') else cat('testthat not installed\n')"

.PHONY: all deps build check install clean test
