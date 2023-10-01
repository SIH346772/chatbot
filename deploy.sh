# !/bin/bash

sudo docker build . -t chatbot

# take openai key from user
read -p "Enter your openai key: " openai_key

# deploy the docker image and expose port 8000
sudo docker run -d -p 8000:8000 -e OPENAI_API_KEY=$openai_key chatbot