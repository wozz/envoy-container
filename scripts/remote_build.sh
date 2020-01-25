#!/bin/bash

if [ -z "$PROJECT" ]; then
    echo "Must set \$PROJECT"
    exit 1
fi

gcloud builds submit --project $PROJECT --config cloudbuild.yaml .
