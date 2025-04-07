#!/bin/bash

cd /app
              
 # Clone the specified branch of the repository
 git clone --branch main --single-branch --depth 1 https://github.com/ReyeMe/SaturnRingLib.git && \
    cd SaturnRingLib && \
    git submodule update --init --recursive

# Set working directory to the Tests directory
cd /app/SaturnRingLib/Tests

# Build the project
make all

# Run the tests
 ./run_tests.bat mednafen
