#!/usr/bin/env bash
git clone git@github.com:runtimeverification/kaas.git "$@"
cd kaas/kaas-cli
make build
pip install dist/*.whl
poetry install
poetry shell
kaas-cli hello