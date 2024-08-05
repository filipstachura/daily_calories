#!/bin/bash

rm -rf docs/
yarn build
mv dist docs
touch docs/.nojekyll
