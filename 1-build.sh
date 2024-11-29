#!/bin/bash -e

set -k

rm -rf OpenUSD b i s
git clone https://github.com/PixarAnimationStudios/OpenUSD.git --depth=1
python3 ./OpenUSD/build_scripts/build_usd.py \
	--build ${PWD}/b \
    --ignore-homebrew \
    --force-all \
    --src ${PWD}/s \
	--no-examples \
	--no-tutorials \
    --no-python \
    --no-usdview \
    --no-materialx \
    --onetbb \
    ${PWD}/i

# --generator Xcode
# --build-monolithic
# --no-tools
# --imaging             Build imaging component
# --usd-imaging         Build imaging and USD imaging components (default)
# --no-imaging          Do not build imaging or USD imaging components

mv i relocated_openusd_install
