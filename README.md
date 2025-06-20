# n8n_ai

# Deployment Architecture

## Docker Image Workflow

This section outlines the steps to build and deploy the n8n_ai container to **AWS App Runner**.
This Dockerfile deploys nn webapplication on an ubuntu image for more customization and general usability.

### 1. Build and Push Docker Image

The repository includes a `Dockerfile` for building the container image.

```bash
# Build the Docker image
docker build -t n8n_ai:latest .

# Login to AWS ECR (ensure you're authenticated via STS first), replace account id with your AWS acount id
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-east-2.amazonaws.com

# Tag the image
docker tag n8n_ai:latest <aws_account_id>.dkr.ecr.us-east-2.amazonaws.com/darren-project/n8n_ai:latest

# Push the image to AWS ECR
docker push <aws_account_id>.dkr.ecr.us-east-2.amazonaws.com/darren-project/n8n_ai:latest
```

