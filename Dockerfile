FROM google/cloud-sdk:latest AS base

RUN apt update
RUN apt install nodejs npm -y
RUN npm install -g firebase-tools

ADD . ./app

WORKDIR /app

ADD modern-diode-339415-b6e71cbc756a.json /app/

RUN export GOOGLE_APPLICATION_CREDENTIALS="/app/modern-diode-339415-b6e71cbc756a.json"

CMD [ "./backup.sh" ] 