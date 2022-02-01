FROM google/cloud-sdk:latest

ADD . ./app

WORKDIR /app

# SHELL ["/bin/bash", "--login", "-c"]

RUN apt update && apt-get update && apt install wget
# RUN npm install -g firebase-tools

RUN wget https://firebase.tools/bin/linux/latest

RUN ls

ADD modern-diode-339415-b6e71cbc756a.json /app/

RUN export GOOGLE_APPLICATION_CREDENTIALS="/app/modern-diode-339415-b6e71cbc756a.json"

# CMD [ "./backup.sh" ] 
RUN ./backup.sh