# Use a lightweight base image with Python 3.11+
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
 && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY weather.py requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables for MCP HTTP transport
ENV MCP_HTTP_HOST=0.0.0.0
ENV MCP_HTTP_PORT=8000

# Expose port for HTTP streaming
EXPOSE 8000

# Run the MCP server
CMD ["python", "weather.py"]
