#!/bin/bash -e

set -k

rm -rf OpenUSD/b OpenUSD/original_openusd_install
python3 ./OpenUSD/build_scripts/build_usd.py \
	--build ${PWD}/OpenUSD/b \
    --ignore-homebrew \
    --force-all \
    --src ${PWD}/OpenUSD/s \
    --no-python \
    --no-materialx \
    --onetbb \
    ${PWD}/OpenUSD/original_openusd_install

    --tests \
    # --no-usdview \
    # --no-examples \
    # --no-tutorials \
    # --no-tools \



# --generator Xcode
# --build-monolithic
# --imaging             Build imaging component
# --usd-imaging         Build imaging and USD imaging components (default)
# --no-imaging          Do not build imaging or USD imaging components

rm -rf b relocated_openusd_install
cp -R OpenUSD/original_openusd_install relocated_openusd_install

if [[ $(uname -s) =~ Darwin ]]; then
    readonly generator_option=-GXcode
fi

cmake -H. -Bb $generator_option
