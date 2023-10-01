FROM python:3.11

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-dev \
    libssl-dev \
    libffi-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt
COPY requirements.txt /tmp/requirements.txt

# Install requirements
RUN pip3 install -r /tmp/requirements.txt

# Remove requirements.txt
RUN rm /tmp/requirements.txt

# Set working directory
WORKDIR /app

# Copy contents
COPY . /app

# EXPOSE port
EXPOSE 8000

# ENTRYPOINT
CMD [ "/bin/sh", "-c", "python3 /app/app.py" ]