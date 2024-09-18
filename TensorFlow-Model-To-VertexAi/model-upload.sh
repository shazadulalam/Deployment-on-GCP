#!/bin/bash

# Variables
REGION="us-central1"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
MODEL_NAME="fashion_mnist_model_${TIMESTAMP}"
EXPORT_PATH="gs://ml-custom-models/export/fashion_mnist_model"

# Upload model
gcloud beta ai models upload --region=$REGION \
    --display-name=$MODEL_NAME \
    --container-image-uri=us-docker.pkg.dev/vertex-ai/prediction/tf2-cpu.2-6:latest \
    --artifact-uri=$EXPORT_PATH

echo "Model $MODEL_NAME uploaded successfully!"
