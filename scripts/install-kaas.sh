#!/usr/bin/env bash
set -eou pipefail

if [ ! -d "kaas" ]; then
  git clone https://${GITHUB_TOKEN}@github.com/runtimeverification/kaas.git
else
  pushd kaas
  git fetch && git pull
  popd > /dev/null
fi
pushd kaas/kaas-cli
make build
pip install dist/*.whl
poetry install
popd > /dev/null