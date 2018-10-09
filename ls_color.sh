#!/usr/bin/env bash
cd
git clone --depth=1 https://github.com/seebi/dircolors-solarized
mv dircolors-solarized  .dircolors-solarized
echo "eval \`dircolors ~/.dircolors-solarized/dircolors.256dark\`" >> .zshrc
source .zshrc

