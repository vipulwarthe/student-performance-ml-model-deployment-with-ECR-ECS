# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the contents of the repository to the working directory
COPY . /app

# Install system dependencies (optional, modify if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose any ports if needed (e.g., if running a web app)
# EXPOSE 8080

# Define the entrypoint command to run the app (replace 'main.py' with your entry file if different)
CMD ["python", "application.py"]

