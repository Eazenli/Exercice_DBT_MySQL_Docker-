FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev

# Set working directory
WORKDIR /app

# Copy project
COPY . /app

# Install Python requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
