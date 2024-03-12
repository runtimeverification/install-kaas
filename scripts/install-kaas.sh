#!/usr/bin/env bash
set -eou pipefail

if [ ! -d "kaas" ]; then
  git clone https://github.com/runtimeverification/kaas.git\
else
  push kaas
  git fetch && git pull
  popd > /dev/null
fi
pushd kaas/kaas-cli
make build
pip install dist/*.whl
poetry install
# poetry run kaas-cli hello
poetry shell 
popd > /dev/null
