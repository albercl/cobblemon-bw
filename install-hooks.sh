#!/bin/bash

# Install the git hooks to extract the mrpack files on commit

cp .githooks/pre-commit .git/hooks/pre-commit

chmod +x .git/hooks/pre-commit