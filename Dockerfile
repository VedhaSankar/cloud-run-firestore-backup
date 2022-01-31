FROM google/cloud-sdk:latest AS base

ADD . ./app

WORKDIR /app

# RUN apt-get update

# RUN apt-get upgrade -y

# RUN apt install nodejs -y

# RUN apt-get install npm -y

# nvm installation
SHELL ["/bin/bash", "--login", "-c"]

# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# RUN nvm install 8.10.0
# RUN nvm use 8.10.0

RUN apt install nodejs -y

RUN apt-get install npm -y

RUN node -v && npm -v

RUN npm install -g firebase-tools

ADD modern-diode-339415-b6e71cbc756a.json /app/

RUN export GOOGLE_APPLICATION_CREDENTIALS="/app/modern-diode-339415-b6e71cbc756a.json"

# CMD [ "./backup.sh" ] 
RUN ./backup.sh