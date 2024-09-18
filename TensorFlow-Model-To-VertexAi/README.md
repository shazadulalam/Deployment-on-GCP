### A custom TensorFlow model deploy to Vertex AI

This work aims to deploy a custom machine-learning model to GCS VertexAI and create an endpoint to test the model's predictions. For this custom model, a Fashion MNIST dataset was used with a simple CNN layer for prediction purposes. 

### Files and Folders

- `model/`: Contains the training script of the Fashion MNIST model
- `bash/`: Contains the bash scripts to deploy and upload a model to GCS

### Dependencies

- Google-Cloud
- Python 3.7 or higher
- TensorFlow

### Usage

To make the bash script executable, run:
```bash
chmod +x deployment.sh
```
To execute the script, run:
```bash
./deployment.sh
```
Same for the `model-upload.sh` script. First, make the script executable then execute.
