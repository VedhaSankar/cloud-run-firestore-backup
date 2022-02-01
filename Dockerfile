FROM google/cloud-sdk:latest

RUN apt update && apt-get update && apt install wget

RUN wget https://firebase.tools/bin/linux/latest

RUN ls

RUN mv latest firebase && chmod +x firebase && mv firebase /usr/local/bin/firebase 

ADD . ./app

WORKDIR /app

# ADD modern-diode-339415-b6e71cbc756a.json /app/

# RUN export GOOGLE_APPLICATION_CREDENTIALS="/app/modern-diode-339415-b6e71cbc756a.json"

CMD [ "./backup.sh" ] 
# RUN ./backup.sh