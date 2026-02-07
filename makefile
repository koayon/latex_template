.PHONY: hooks
hooks:
	pre-commit install --overwrite --install-hooks --hook-type pre-commit --hook-type post-checkout --hook-type pre-push
	git checkout

# Makefile for LaTeX papers
# Usage:
#   make pdf              # build main.pdf
#   make clean            # remove aux/build artifacts
#   make diff BASE=...    # build diff against git ref/tag/branch (produces diff.pdf)
#   make diff BASE=v1.0 MAIN=paper.tex
#
# Requirements:
#   - latexmk
#   - (for diff) latexdiff + git

SHELL := /bin/bash
.ONESHELL:

MAIN ?= main.tex
PDF  := $(patsubst %.tex,%.pdf,$(MAIN))

# Build settings
LATEXMK ?= latexmk
LATEXMK_FLAGS ?= -pdf -interaction=nonstopmode -file-line-error -halt-on-error

# Diff settings
# latexdiff can struggle with some packages; adjust flags if needed.
LATEXDIFF ?= latexdiff
LATEXDIFF_FLAGS ?= --exclude-safecmd="hyperref,hypertarget,urlstyle,csname" \
                   --exclude-textcmd="hyperref,hypertarget"
LATEXPAND ?= latexpand
LATEXPAND_FLAGS ?= --expand-usepackage --explain
DIFF_DIR ?= .latexdiff
BASE ?= HEAD~1

# Arxiv settings
ARXIV_DIR ?= .arxiv
ARXIV_TAR ?= arxiv.tar.gz

.PHONY: pdf clean diff arxiv help

help:
	@echo "Targets:"
	@echo "  pdf                 Build $(PDF) from $(MAIN)"
	@echo "  clean               Remove LaTeX build artifacts"
	@echo "  diff BASE=<gitref>  Build diff.pdf comparing BASE vs working tree"
	@echo "  arxiv               Build arxiv-ready .tar.gz (flattened, comments stripped)"
	@echo ""
	@echo "Vars:"
	@echo "  MAIN=<file.tex>     Main TeX file (default: main.tex)"
	@echo "  BASE=<gitref>       Git ref for diff (default: HEAD~1)"
	@echo "  DIFF_DIR=<dir>      Temp directory for diff build (default: .latexdiff)"
	@echo "  ARXIV_DIR=<dir>     Temp directory for arxiv build (default: .arxiv)"

pdf:
	@echo "Building $(PDF) from $(MAIN)"
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN)

clean:
	@echo "Cleaning LaTeX artifacts for $(MAIN)"
	$(LATEXMK) -C $(MAIN)
	# latexmk -C won't remove some extras in all setups; remove common leftovers:
	rm -rf $(DIFF_DIR) \
		*.synctex.gz *.synctex.gz\(busy\) \
		*.bbl *.blg *.run.xml *.bcf \
		*.nav *.snm *.vrb \
		*.fls *.fdb_latexmk

diff:
	@echo "Building diff for MAIN=$(MAIN) against BASE=$(BASE)"
	@mkdir -p $(DIFF_DIR)

	# Export the full repo at BASE into a temp dir so latexpand can resolve \import paths
	$(eval TMP_BASE := $(shell mktemp -d))
	git archive "$(BASE)" | tar -x -C "$(TMP_BASE)"

	# Flatten both versions with latexpand (handles \import, \input, \include)
	# Then fix up paths that latexpand incorrectly prefixes with the \import directory
	cd "$(TMP_BASE)" && $(LATEXPAND) $(MAIN) \
		| sed 's|{paper_sections/assets/|{assets/|g' \
		| sed 's|{paper_appendix_sections/assets/|{assets/|g' \
		| sed 's|{paper_sections/figures/|{figures/|g' \
		| sed 's|{paper_appendix_sections/figures/|{figures/|g' \
		| sed 's|{paper_sections/tables/|{tables/|g' \
		| sed 's|{paper_appendix_sections/tables/|{tables/|g' \
		> "$(CURDIR)/$(DIFF_DIR)/base_flat.tex"
	$(LATEXPAND) $(MAIN) \
		| sed 's|{paper_sections/assets/|{assets/|g' \
		| sed 's|{paper_appendix_sections/assets/|{assets/|g' \
		| sed 's|{paper_sections/figures/|{figures/|g' \
		| sed 's|{paper_appendix_sections/figures/|{figures/|g' \
		| sed 's|{paper_sections/tables/|{tables/|g' \
		| sed 's|{paper_appendix_sections/tables/|{tables/|g' \
		> "$(DIFF_DIR)/current_flat.tex"

	# Run latexdiff on the flattened files (no --flatten needed)
	$(LATEXDIFF) $(LATEXDIFF_FLAGS) \
		"$(DIFF_DIR)/base_flat.tex" \
		"$(DIFF_DIR)/current_flat.tex" \
		> "$(DIFF_DIR)/diff.tex"

	# Build diff.pdf from the project root so relative paths (styles/, assets/) resolve
	@echo "Compiling diff.pdf"
	$(LATEXMK) $(LATEXMK_FLAGS) -jobname=diff -output-directory=$(DIFF_DIR) "$(DIFF_DIR)/diff.tex"

	# Copy diff.pdf to repo root for convenience
	@cp -f "$(DIFF_DIR)/diff.pdf" ./diff.pdf
	@echo "Wrote ./diff.pdf"

	# Clean up temp dir
	@rm -rf "$(TMP_BASE)"

arxiv:
	@echo "Preparing arXiv submission from $(MAIN)"
	@rm -rf $(ARXIV_DIR)
	@mkdir -p $(ARXIV_DIR)

	# 1. Build the PDF first to ensure .bbl exists
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN)

	# 2. Flatten and strip comments with latexpand
	$(LATEXPAND) --empty-comments $(MAIN) \
		| sed 's|{paper_sections/assets/|{assets/|g' \
		| sed 's|{paper_appendix_sections/assets/|{assets/|g' \
		| sed 's|{paper_sections/figures/|{figures/|g' \
		| sed 's|{paper_appendix_sections/figures/|{figures/|g' \
		| sed 's|{paper_sections/tables/|{tables/|g' \
		| sed 's|{paper_appendix_sections/tables/|{tables/|g' \
		> "$(ARXIV_DIR)/$(MAIN)"

	# 3. Copy the .bbl file (arXiv runs pdflatex but not always bibtex)
	@cp -f main.bbl "$(ARXIV_DIR)/"

	# 4. Copy style files
	@cp -r styles/ "$(ARXIV_DIR)/styles/"

	# 5. Copy figures, assets, tables
	@[ -d assets ] && cp -r assets/ "$(ARXIV_DIR)/assets/" || true
	@[ -d figures ] && cp -r figures/ "$(ARXIV_DIR)/figures/" || true
	@[ -d tables ] && cp -r tables/ "$(ARXIV_DIR)/tables/" || true

	# 6. Remove .gitkeep files
	@find "$(ARXIV_DIR)" -name '.gitkeep' -delete

	# 7. Verify the flattened file compiles
	@echo "Verifying arxiv build compiles..."
	cd "$(ARXIV_DIR)" && $(LATEXMK) $(LATEXMK_FLAGS) $(MAIN)

	# 8. Clean build artifacts from arxiv dir (keep only source + pdf)
	cd "$(ARXIV_DIR)" && $(LATEXMK) -c $(MAIN)
	@rm -f $(ARXIV_DIR)/*.fls $(ARXIV_DIR)/*.fdb_latexmk

	# 9. Create tarball
	@tar -czf $(ARXIV_TAR) -C $(ARXIV_DIR) .
	@echo ""
	@echo "=== arXiv submission ready ==="
	@echo "  Archive: $(ARXIV_TAR)"
	@echo "  Contents:"
	@tar -tzf $(ARXIV_TAR) | head -20
	@echo "  ..."
	@echo ""
	@echo "Upload $(ARXIV_TAR) to https://arxiv.org/submit"
	@echo "Review $(ARXIV_DIR)/ to inspect the flattened source."
