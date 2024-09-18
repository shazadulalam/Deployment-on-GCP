
REGION="us-central1"
MODEL_NAME=$1
ENDPOINT_NAME="fashion_mnist_endpoint"

# Check if endpoint exists, else create
if [[ $(gcloud ai endpoints list --region=$REGION \
        --format='value(DISPLAY_NAME)' --filter=display_name=${ENDPOINT_NAME}) ]]; then
    echo "Endpoint $ENDPOINT_NAME already exists"
else
    echo "Creating Endpoint $ENDPOINT_NAME"
    gcloud ai endpoints create --region=$REGION --display-name=$ENDPOINT_NAME
fi

# Deploy model to endpoint
ENDPOINT_ID=$(gcloud ai endpoints list --region=$REGION \
    --format='value(ENDPOINT_ID)' --filter=display_name=${ENDPOINT_NAME})

MODEL_ID=$(gcloud ai models list --region=$REGION \
    --format='value(MODEL_ID)' --filter=display_name=${MODEL_NAME})

gcloud ai endpoints deploy-model $ENDPOINT_ID \
    --region=$REGION \
    --model=$MODEL_ID \
    --display-name=$MODEL_NAME \
    --machine-type="n1-standard-2" \
    --min-replica-count=1 \
    --max-replica-count=1 \
    --traffic-split=0=100

echo "Model $MODEL_NAME deployed successfully!"
