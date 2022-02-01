FROM google/cloud-sdk:latest

RUN apt update && apt-get update && apt install wget

RUN wget https://firebase.tools/bin/linux/latest

RUN mv latest firebase && chmod +x firebase && mv firebase /usr/local/bin/firebase 

RUN apt-get install -y python3-pip python-dev build-essential

ADD . ./app

WORKDIR /app

RUN pip3 install -r requirements.txt

EXPOSE 8500

CMD [ "python3", "app.py" ] 