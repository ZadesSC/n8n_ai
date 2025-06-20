# Start from Ubuntu base
FROM ubuntu:22.04

# Set environment variables for non-interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    python3 \
    python3-pip \
    git \
    lsb-release \
    software-properties-common

# Install Node.js 20.x (LTS) from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install n8n globally
RUN npm install -g n8n && apt-get clean
# Create n8n user
RUN useradd -m -s /bin/bash node

USER node
WORKDIR /home/node

# Expose default n8n port
EXPOSE 5678

# Entrypoint to run n8n
CMD ["n8n"]
