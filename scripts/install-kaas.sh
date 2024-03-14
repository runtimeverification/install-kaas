#!/usr/bin/env bash
set -eou pipefail

python3 -m venv kaas-env
echo "$(pwd)/kaas-env/bin" >> $GITHUB_PATH
# export PATH="$(pwd)/kaas-env/bin:$PATH"
source $(pwd)/kaas-env/bin/activate

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