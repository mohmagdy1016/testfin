#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag=hello .

# Step 2:
# Run flask app
docker run -p 8000:5000 hello


