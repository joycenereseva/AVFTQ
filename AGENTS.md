# AGENTS.md

## Cursor Cloud specific instructions

This repository is a **fully static, offline HTML application** (AVFTQ — swimming
technical evaluation forms). There is **no package manager, backend, or build
dependency to install**: the browser libraries (`jspdf`, `html2canvas`) are
committed under `vendor/`, and the toolchain (Python 3, Google Chrome) is already
present on the VM.

### Files
- `avaliacao_natacao.html` — main app; loads libs from `vendor/` with CDN fallback.
- `avaliacao_natacao_standalone.html` — generated single-file build with libs inlined.
- `vendor/` — committed `jspdf` and `html2canvas` bundles.
- `build-standalone.sh` — regenerates the standalone file (runs `python3`, no deps).

### Run / develop
- Serve locally for testing (the app uses `localStorage`, so open it over HTTP, not `file://`):
  `python3 -m http.server 8000` then open `http://localhost:8000/avaliacao_natacao.html`.
- Data (students, evaluations, config) persists in browser `localStorage` — clearing
  site data resets the app.

### Build
- `./build-standalone.sh` regenerates `avaliacao_natacao_standalone.html` by inlining
  `vendor/` scripts. It is deterministic; re-running with unchanged inputs produces no diff.

### Lint / test
- There is no lint or automated-test setup in this repo. Verification is manual in the
  browser (create a student, fill an evaluation, generate/preview the PDF).
