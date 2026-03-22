#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

cleanup_main_tmp() {
  rm -f \
    main.aux \
    main.bbl \
    main.bcf \
    main.blg \
    main.fdb_latexmk \
    main.fls \
    main.log \
    main.out \
    main.run.xml \
    main.synctex.gz \
    main.toc \
    main.xdv
}

trap cleanup_main_tmp EXIT

latexmk -lualatex -interaction=nonstopmode -halt-on-error main.tex

perl -e 'unlink q{afleveringsfiler/Assignment4_report.pdf};'
install -m 644 main.pdf afleveringsfiler/Assignment4_report.pdf
