FROM python:3.11.5-alpine3.18

# Install python
RUN apk add linux-headers
RUN apk add -y --update gcc musl-dev cmake make
RUN pip3 install --upgrade pip
RUN pip3 install scikit-build
RUN export CXXFLAGS="-D_BSD_SOURCE"
RUN pip3 install ninja
# Copy requirements.txt
COPY requirements.txt /tmp/requirements.txt

# Install requirements
RUN pip3 install -r /tmp/requirements.txt
# Remove requirements.txt
RUN rm /tmp/requirements.txt
# Remove dependencies
RUN apk del gcc python3-dev musl-dev py3-pip linux-headers
# Remove cache
RUN rm -rf /var/cache/apk/*


# Set working directory
WORKDIR /app

# Copy contents
COPY . /app


# EXPOSE port
EXPOSE 8000

# ENTRYPOINT
CMD [ "/bin/sh", "-c", "python3 /app/app.py" ]