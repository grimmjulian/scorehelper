ROXYGEN_STAMP := .roxygen.stamp
R_SOURCES := $(shell find R -name '*.R')
PKG_NAME := $(shell Rscript -e "cat(desc::desc_get('Package'))")
PKG_VERSION := $(shell Rscript -e "cat(desc::desc_get('Version'))")
TARBALL := $(PKG_NAME)_$(PKG_VERSION).tar.gz

.PHONY: doc
doc: $(ROXYGEN_STAMP) README.md

$(ROXYGEN_STAMP): $(R_SOURCES) DESCRIPTION
	R -s -e "pkgload::load_all('.'); roxygen2::roxygenize('.')"
	touch $(ROXYGEN_STAMP)

README.md: README.Rmd
	Rscript -e "rmarkdown::render('README.Rmd', output_format='github_document', quiet=TRUE)"
	rm -f README.html

$(TARBALL): $(ROXYGEN_STAMP) README.md $(R_SOURCES) DESCRIPTION
	rm -f *.tar.gz
	R CMD build --compact-vignettes="gs+qpdf" .

.PHONY: build
build: $(TARBALL)

.PHONY: check
check: $(TARBALL)
	R CMD check *.tar.gz

.PHONY: install
install: $(TARBALL) 
	R CMD INSTALL *.tar.gz

.PHONY: clean
clean:
	rm -f *.tar.gz .roxygen.stamp
	rm -rf *.Rcheck/

.PHONY: test
test:
	R -s -e "testthat::test_local()"
