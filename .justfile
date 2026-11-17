# source .venv/bin/activate
# deactivate

set windows-shell := ["pwsh", "-c"]

build:
    zensical build

serve:
    zensical serve
